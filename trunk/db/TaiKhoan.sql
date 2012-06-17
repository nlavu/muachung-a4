-- 1. store kiem tra dang nhap
CREATE PROCEDURE  [dbo].[sp_KiemTraDangNhap]
@TenDangNhap nvarchar(100), 
@MatKhau nvarchar(100)
AS
BEGIN
	DECLARE @OutPut int
	DECLARE @KiemTraTenDangNhap int
	DECLARE @KiemTraMatKhau int
	DECLARE @TrangThai int 
	SELECT @KiemTraTenDangNhap=isnull(Count(tk.USERNAME),0) 
		FROM TAIKHOAN tk 
		WHERE tk.USERNAME=@TenDangNhap
	SELECT @TrangThai =isnull(tk.TKISAVAILABLE ,0)
		FROM TAIKHOAN tk 
		WHERE tk.USERNAME=@TenDangNhap
	IF @KiemTraTenDangNhap=0 
		SET @OutPut=1 -- Sai TenDangNhap
	ELSE
	BEGIN
		SELECT @KiemTraMatKhau =isnull(count(*),0) 
			FROM TAIKHOAN tk 
		WHERE tk.USERNAME=@TenDangNhap 
			AND tk.PASSWORD=@MatKhau
		IF @KiemTraMatKhau=0
			SET @OutPut=2 -- Sai m?t kh?u
		ELSE
			BEGIN
			   IF @TrangThai=0
				SET @OutPut=4 -- Ph?i d?i m?t kh?u
			   ELSE
				BEGIN
				   IF @TrangThai=2
				-- TenDangNhap dang b? khóa 
				   SET @OutPut=3 
				   ELSE
					SET @OutPut=0
				END
			END
	END
	SELECT @OutPut AS KetQua
END 


-- 2 form dang nhap.
<asp:TextBox 
	ID="txtUserName"  
	runat="server" 
	CssClass="login_TextForm" 
	Width="140px" />
<asp:RequiredFieldValidator 
	ID="RequiredFieldValidator1" 
	runat="server" 
	ControlToValidate="txtUserName"
	Display="Dynamic" 
	Font-Size="8pt">(*)
</asp:RequiredFieldValidator>

<asp:TextBox ID="txtPassword" 
	runat="server" 
	CssClass="login_TextForm" 
	TextMode="Password" 
	Width="140px" />
<asp:RequiredFieldValidator 
	ID="RequiredFieldValidator2" 
	runat="server" 
	ControlToValidate="txtPassword"
        Display="Dynamic" 
	Font-Size="8pt">(*)
</asp:RequiredFieldValidator>

<asp:Button 
	ID="btnLogin" 
	runat="server" 
	CssClass="textbox" 
	Text="Đăng nhập" 
	Font-Bold="False" 
	OnClick="btnLogin_Click" />
	
-- 3. Ma hoa mat khau
public string MaHoaMatKhau(string password)
{
    UnicodeEncoding encoding = new UnicodeEncoding();
    Byte[] hashBytes = encoding.GetBytes(password);
    /* Compute the SHA-1 hash */
    SHA1CryptoServiceProvider sha1 = new SHA1CryptoServiceProvider();
    Byte[] cryptPassword = sha1.ComputeHash(hashBytes);
    return BitConverter.ToString(cryptPassword);
}

-- 4 Ham thuc thi store kiem tra dang nhap
private static DataSet ThucThiStore_DataSet(
    string StoredProcedure, 
    params SqlParameter[] Parameters)
{
    string ConnectionString = @"Server =.\SQL2005;Initial Catalog=DatabaseName;User ID=sa;Password=***"; 
    SqlConnection Conn = new SqlConnection(ConnectionString);
    SqlCommand Command = new SqlCommand(StoredProcedure, Conn);
    if (Parameters != null)
    {
        Command.Parameters.Clear();
        Command.Parameters.AddRange(Parameters);
    }
    DataSet ds = new DataSet(); 
    SqlDataAdapter da = new SqlDataAdapter(StoredProcedure, Conn);
    Command.CommandType = CommandType.StoredProcedure;
    da.SelectCommand = Command;
    try
    {
        Conn.Open();
        da.Fill(ds);
    }
    finally
    {
        if (Conn.State == ConnectionState.Open)
            Conn.Close();
        Conn.Dispose();
    }
    return ds;
}

private DataTable StoreToDataTable(
    string TenDangNhap, 
    string MatKhau)
{
    SqlParameter[] arrParam = {
            new SqlParameter("@TenDangNhap", SqlDbType.NVarChar),
            new SqlParameter("@MatKhau", SqlDbType.NVarChar)
            };
    arrParam[0].Value = TenDangNhap;
    arrParam[1].Value = MatKhau;
    return ThucThiStore_DataSet("sp_KiemTraDangNhap", arrParam).Tables[0];
}

-- 6. Ham xu li load
protected void Page_Load(object sender, EventArgs e)
{
    if (Session["TenDangNhap"] != null || Session["MatKhau"] != null)
    {
        Response.Redirect("Default.aspx");
    }
}
protected void btnLogin_Click(object sender, EventArgs e)
{
    KiemTraNhap(txtUserName.Text + "", MaHoaMatKhau(txtPassword.Text).Trim());
}

private void KiemTraNhap(string TenDangNhap, string MatKhau)
{
   DataTable dtb = StoreToDataTable(TenDangNhap, MatKhau);
    int num = 0;
    if (dtb.Rows.Count > 0)
    {
        num = int.Parse("0" + dtb.Rows[0][0]);
        switch (num)
        {
            case 0: /* Khai báo Session cho phép đăng nhập */
                Session["TenDangNhap"] = txtUserName.Text.ToString().ToLower();
                Session["MatKhau"] = MaHoaMatKhau(txtPassword.Text);
		Response.Redirect("Default.aspx");
                break;
            case 1: /* Thông báo tên đăng nhập không tồn tại */
                ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectMe", "alert('Lỗi: Tên đăng nhập không tồn tại');", true);
                break;
            case 2: /* thông báo sai mật khẩu */
                ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectMe", "alert('Lỗi; Mật khẩu đăng nhập không đúng!');", true);
                break;
            case 3: /* thông báo TenDangNhap đã bị khóa */
                ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectMe", "alert('Lỗi: Tên đăng nhập này đã bị khóa!');", true);
                break;
            case 4: /* Thông báo phải đổi mật khẩu và chuyển người dùng đến trang ChangePassword.aspx.aspx */
                ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectMe", "alert('Bạn phải đổi mật khẩu trước khi đăng nhập!');location.href='ChangePassword.aspx?userid=" + TenDangNhap + "'", true);
                break;
        }
    }
    dtb.Dispose();
}

---------------------------------------------------
-- Kiem tra trung email

CREATE PROCEDURE [dbo].[st_User_CheckEmail]
@email nvarchar(100)
AS
BEGIN
    if (SELECT COUNT (EMAIL) FROM [Account] where EMAIL=@email)>0
    return 1;
    else return -1;
END 
