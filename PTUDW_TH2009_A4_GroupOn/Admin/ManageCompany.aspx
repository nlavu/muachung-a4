<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ManageCompany.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn.Admin.ManageCompany" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <p>
        <asp:SiteMapPath runat="server">
        </asp:SiteMapPath>
    </p>
<link type="text/css" rel="stylesheet" href="css/style.css" />
    <script type="text/javascript" src="js/js.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.mousewheel-3.0.4.pack.js"></script>
<script type="text/javascript" src="js/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="js/jquery.fancybox-1.3.4.css" media="screen" />
<script language="javascript"  type="text/javascript">
    $(document).ready(function () {
        $(".addfund").fancybox();
        $("#q").keyup(function () {
            $("#users").html('<img src="images/progress.gif" width="90" height="90">');
            $.post('company_search.php', { uname: $("#q").val() },
		function (data) {
		    $("#users").html(data);
		});
        });
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<tr> 
    <td valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
		<td valign="top" width="267"><table width="170" border="0">
      <tr>
        <td class="list_heading">Main Menu</td>
      </tr>
<!--      <tr>
      	<td class="list_detail" align="left"><a href="index.php">Home</a></td>
      </tr>
      				<tr>
                	<td class="list_detail" align="left"><a href="#">Company</a></td>
                </tr>
								<tr>
                	<td class="list_detail" align="left"><a href="#">Deals</a></td>
                </tr>
								<tr>
                	<td class="list_detail" align="left"><a href="#">Admin</a></td>
                </tr>
								<tr>
                	<td class="list_detail" align="left"><a href="#">Users</a></td>
                </tr>
								<tr>
                	<td class="list_detail" align="left"><a href="#">Locations</a></td>
                </tr>
								<tr>
                	<td class="list_detail" align="left"><a href="#">Pages</a></td>
                </tr>
								<tr>
                	<td class="list_detail" align="left"><a href="#">Affiliate</a></td>
                </tr>
								<tr>
                	<td class="list_detail" align="left"><a href="#">General</a></td>
                </tr>
								<tr>
                	<td class="list_detail" align="left"><a href="test.php">Test menu</a></td>
                </tr>
				      <tr>
      	<td class="list_detail" align="left"><a href="logout.php">Logout</a></td>
      </tr>
-->      
      <tr>
      	<td align="left">
        <style>
		.leftmenu ul
		{
			list-style-type:none;
		}
		</style>
        	<div class="leftmenu" >
            <ul>
                        	<li><a style="font-weight:bold;" href="#">Company</a>  </li>
            <li><ul>						<li><a href="AddNewCompany.aspx">Add New Company</a>  </li>				
											<li><a href="ManageCompany.aspx">Manage Companies</a>  </li>				
					</ul></li>            	<li><a style="font-weight:bold;" href="#">System</a>  </li>
            <li><ul>						<li><a href="#">Home</a>  </li>				
											<li><a href="SiteConfig.aspx">Site Config</a>  </li>				
											<li><a href="#">Logout</a>  </li>				
					</ul></li>            	<li><a style="font-weight:bold;" href="#">Deals</a>  </li>
            <li><ul>						<li><a href="AddNewDeal.aspx">Add New Deal</a>  </li>				
											<li><a href="AllDeal.aspx">All Deals</a>  </li>				
											<li><a href="CurrentDeal.aspx">Current Deals</a>  </li>				
											<li><a href="#">Tipped Deals</a>  </li>				
											<li><a href="#">Cancelled Deals</a>  </li>				
											<li><a href=""DealCategory.aspx">Deals Category</a>  </li>				
					</ul></li>            	<li><a style="font-weight:bold;" href="#">Admin</a>  </li>
            <li><ul>						<li><a href="">Manage Admin</a>  </li>				
					</ul></li>            	<li><a style="font-weight:bold;" href="#">Users</a>  </li>
            <li><ul>						<li><a href="#">Add New User</a>  </li>				
											<li><a href="#">Manage Users</a>  </li>				
											<li><a href="#">import users</a>  </li>				
											<li><a href="#">Export Users</a>  </li>				
					</ul></li>            	<li><a style="font-weight:bold;" href="#">Locations</a>  </li>
            <li><ul>						<li><a href="#">Manage Locations</a>  </li>				
											<li><a href="#">Manage Areas</a>  </li>				
					</ul></li>            	<li><a style="font-weight:bold;" href="#">Pages</a>  </li>
            <li><ul>						<li><a href="#">Manage Pages Category</a>  </li>				
											<li><a href="#">Manage Pages</a>  </li>				
					</ul></li>            	<li><a style="font-weight:bold;" href="#">Language</a>  </li>
            <li><ul>						<li><a href="#">Manage Languages</a>  </li>				
											<li><a href="#">Manage Translation</a>  </li>				
					</ul></li>            	<li><a style="font-weight:bold;" href="#">Affiliate</a>  </li>
            <li><ul>						<li><a href="#">Add New Affiliate</a>  </li>				
											<li><a href="#">Manage Affliate</a>  </li>				
					</ul></li>            	<li><a style="font-weight:bold;" href="#">General</a>  </li>
            <li><ul>						<li><a href="#">Add Fund</a>  </li>				
											<li><a href="#">Advertisement</a>  </li>				
											<li><a href="#">Newsletter Template</a>  </li>				
											<li><a href="#">Manage Users</a>  </li>				
					</ul></li>            </ul>
            </div>
         <!--second -->
            <div class="leftmenu" >
            <ul >
            
            	<li style="font-weight:bold; color:#0000CC;">  </li>
           
						<li style="color:#0000CC; margin-left:30px; margin-top:10px;"></li>				
					
					
				
				
                        
            </ul>
            </div>
        </td>
      </tr>
    </table></td>
    <td align="left" valign="top"><h1 align="left">Manage Company</h1>
   <br>
   	<form name="form1" method="get">
              <table width="" border="0" cellspacing="1" cellpadding="0">
                <tr>
                  <td class="list_detail">Search:</td>
                  <td class="list_detail"><input type="text" name="q" maxlength="20"  id="q"/></td>
                  <td class="list_detail">&nbsp;</td>
                </tr>
                <tr>
                  <td><div id="search_reasult"> </div></td>
                </tr>
                              </table>
   	  </form>
                <br>
  
    <table width="760" border="0" align="center" cellpadding="0" cellspacing="0" id="users">
        <tr>
          <td width="700" align="center"></td>
        </tr>
        <tr>
          <td align="center"><table width="100%" border="0" align="left" cellpadding="0" cellspacing="1" class="list">
              <tr>
                <td width="60" align="center" valign="middle" >&nbsp;</td>
                 <td width="299" align="center" valign="middle" >&nbsp;</td>
                <td width="177" align="center" valign="middle" >&nbsp;</td>
                <td colspan="2" align="center" valign="middle" ><a href="company_add.php">Add New Company</a></td>
              </tr>
             
              <tr>
                <td width="60" align="center" valign="middle" class="list_heading">SN</td>
                 <td width="299" align="center" valign="middle" class="list_heading">Company Name</td>
                <td width="177" align="center" valign="middle" class="list_heading">Url</td>
                <td width="105" align="center" valign="middle" class="list_heading">Actions</td>
                <td align="center" valign="middle" class="list_heading">Status</td>
              </tr>
                            <tr>
                <td height="18" class="list_detail">1</td>
                <td  class="list_detail"><a href="company_detail.php?id=96">ABC Spa Ltd</a></td>
                <td  class="list_detail">www.bbc.co.uk</td>
                <td align="center"  class="list_detail"  ><a href="company_edit.php?id=96"><img src="images/edit.png" width="16" height="16" border="0"></a> &nbsp;<a href="company_delete_do.php?id=96" onClick="return confirm('Are You Sure You Want to Delete');"><img src="images/delete.png" width="16" height="16" border="0"></a>&nbsp;<a class="addfund" href="company_fund_add.php?uid=96&uemail=ABC Spa Ltd" ><img src="images/fund.png" width="16" height="16" border="0"> </a></td>
                <td width="113" align="center"  class="list_detail"  ><a href='action1.php?table=company&column=status&email=saraknight2@yahoo.co.uk<br>&pass=abcspatest&return=company_manage.php&id=96&do=0' title='Set as Suspended'><img src='images/green.png' /></a></td>
              </tr>
                            <tr>
                <td height="18" class="list_detail">2</td>
                <td  class="list_detail"><a href="company_detail.php?id=99">am test</a></td>
                <td  class="list_detail"></td>
                <td align="center"  class="list_detail"  ><a href="company_edit.php?id=99"><img src="images/edit.png" width="16" height="16" border="0"></a> &nbsp;<a href="company_delete_do.php?id=99" onClick="return confirm('Are You Sure You Want to Delete');"><img src="images/delete.png" width="16" height="16" border="0"></a>&nbsp;<a class="addfund" href="company_fund_add.php?uid=99&uemail=am test" ><img src="images/fund.png" width="16" height="16" border="0"> </a></td>
                <td width="113" align="center"  class="list_detail"  ><a href='action1.php?table=company&column=status&email=inziboy_@hotmail.com<br>&pass=27219688&return=company_manage.php&id=99&do=0' title='Set as Suspended'><img src='images/green.png' /></a></td>
              </tr>
                            <tr>
                <td height="18" class="list_detail">3</td>
                <td  class="list_detail"><a href="company_detail.php?id=94">EGB Systems</a></td>
                <td  class="list_detail">www.egbsystems.com</td>
                <td align="center"  class="list_detail"  ><a href="company_edit.php?id=94"><img src="images/edit.png" width="16" height="16" border="0"></a> &nbsp;<a href="company_delete_do.php?id=94" onClick="return confirm('Are You Sure You Want to Delete');"><img src="images/delete.png" width="16" height="16" border="0"></a>&nbsp;<a class="addfund" href="company_fund_add.php?uid=94&uemail=EGB Systems" ><img src="images/fund.png" width="16" height="16" border="0"> </a></td>
                <td width="113" align="center"  class="list_detail"  ><a href='action1.php?table=company&column=status&email=admin@admin.com<br>&pass=admin&return=company_manage.php&id=94&do=0' title='Set as Suspended'><img src='images/green.png' /></a></td>
              </tr>
                            <tr>
                <td height="18" class="list_detail">4</td>
                <td  class="list_detail"><a href="company_detail.php?id=93">IT</a></td>
                <td  class="list_detail">www.ITnow.com</td>
                <td align="center"  class="list_detail"  ><a href="company_edit.php?id=93"><img src="images/edit.png" width="16" height="16" border="0"></a> &nbsp;<a href="company_delete_do.php?id=93" onClick="return confirm('Are You Sure You Want to Delete');"><img src="images/delete.png" width="16" height="16" border="0"></a>&nbsp;<a class="addfund" href="company_fund_add.php?uid=93&uemail=IT" ><img src="images/fund.png" width="16" height="16" border="0"> </a></td>
                <td width="113" align="center"  class="list_detail"  ><a href='action1.php?table=company&column=status&email=ses@gmail.com<br>&pass=ses@gmail.com&return=company_manage.php&id=93&do=0' title='Set as Suspended'><img src='images/green.png' /></a></td>
              </tr>
                            <tr>
                <td height="18" class="list_detail">5</td>
                <td  class="list_detail"><a href="company_detail.php?id=98">Long chim</a></td>
                <td  class="list_detail"></td>
                <td align="center"  class="list_detail"  ><a href="company_edit.php?id=98"><img src="images/edit.png" width="16" height="16" border="0"></a> &nbsp;<a href="company_delete_do.php?id=98" onClick="return confirm('Are You Sure You Want to Delete');"><img src="images/delete.png" width="16" height="16" border="0"></a>&nbsp;<a class="addfund" href="company_fund_add.php?uid=98&uemail=Long chim" ><img src="images/fund.png" width="16" height="16" border="0"> </a></td>
                <td width="113" align="center"  class="list_detail"  ><a href='action1.php?table=company&column=status&email=ngovanvinh@yahoo.com<br>&pass=123456&return=company_manage.php&id=98&do=0' title='Set as Suspended'><img src='images/green.png' /></a></td>
              </tr>
                            <tr>
                <td height="18" class="list_detail">6</td>
                <td  class="list_detail"><a href="company_detail.php?id=92">Madison Salon & Spa</a></td>
                <td  class="list_detail">http://www.madisonsalonandspa.com</td>
                <td align="center"  class="list_detail"  ><a href="company_edit.php?id=92"><img src="images/edit.png" width="16" height="16" border="0"></a> &nbsp;<a href="company_delete_do.php?id=92" onClick="return confirm('Are You Sure You Want to Delete');"><img src="images/delete.png" width="16" height="16" border="0"></a>&nbsp;<a class="addfund" href="company_fund_add.php?uid=92&uemail=Madison Salon & Spa" ><img src="images/fund.png" width="16" height="16" border="0"> </a></td>
                <td width="113" align="center"  class="list_detail"  ><a href='action1.php?table=company&column=status&email=gm1@yopmail.com<br>&pass=12345&return=company_manage.php&id=92&do=1' title='Set as Active'><img src='images/red.png' /></a></td>
              </tr>
                            <tr>
                <td height="18" class="list_detail">7</td>
                <td  class="list_detail"><a href="company_detail.php?id=95">Nashik Automobiles</a></td>
                <td  class="list_detail"></td>
                <td align="center"  class="list_detail"  ><a href="company_edit.php?id=95"><img src="images/edit.png" width="16" height="16" border="0"></a> &nbsp;<a href="company_delete_do.php?id=95" onClick="return confirm('Are You Sure You Want to Delete');"><img src="images/delete.png" width="16" height="16" border="0"></a>&nbsp;<a class="addfund" href="company_fund_add.php?uid=95&uemail=Nashik Automobiles" ><img src="images/fund.png" width="16" height="16" border="0"> </a></td>
                <td width="113" align="center"  class="list_detail"  ><a href='action1.php?table=company&column=status&email=nashikroad@nashik.com<br>&pass=mashik&return=company_manage.php&id=95&do=0' title='Set as Suspended'><img src='images/green.png' /></a></td>
              </tr>
                            <tr>
                <td height="18" class="list_detail">8</td>
                <td  class="list_detail"><a href="company_detail.php?id=97">sdfsdfsdfg</a></td>
                <td  class="list_detail">http://site.com</td>
                <td align="center"  class="list_detail"  ><a href="company_edit.php?id=97"><img src="images/edit.png" width="16" height="16" border="0"></a> &nbsp;<a href="company_delete_do.php?id=97" onClick="return confirm('Are You Sure You Want to Delete');"><img src="images/delete.png" width="16" height="16" border="0"></a>&nbsp;<a class="addfund" href="company_fund_add.php?uid=97&uemail=sdfsdfsdfg" ><img src="images/fund.png" width="16" height="16" border="0"> </a></td>
                <td width="113" align="center"  class="list_detail"  ><a href='action1.php?table=company&column=status&email=sdfgsdfsdfg@tdfgsdfdfg.com<br>&pass=232323&return=company_manage.php&id=97&do=0' title='Set as Suspended'><img src='images/green.png' /></a></td>
              </tr>
                            <tr>
                <td height="18" class="list_detail">9</td>
                <td  class="list_detail"><a href="company_detail.php?id=100">YhDYgcDaeMj</a></td>
                <td  class="list_detail">http://ituefgupdxbb.com/</td>
                <td align="center"  class="list_detail"  ><a href="company_edit.php?id=100"><img src="images/edit.png" width="16" height="16" border="0"></a> &nbsp;<a href="company_delete_do.php?id=100" onClick="return confirm('Are You Sure You Want to Delete');"><img src="images/delete.png" width="16" height="16" border="0"></a>&nbsp;<a class="addfund" href="company_fund_add.php?uid=100&uemail=YhDYgcDaeMj" ><img src="images/fund.png" width="16" height="16" border="0"> </a></td>
                <td width="113" align="center"  class="list_detail"  ><a href='action1.php?table=company&column=status&email=aahccw@kiquke.com<br>&pass=ktBDlt&return=company_manage.php&id=100&do=0' title='Set as Suspended'><img src='images/green.png' /></a></td>
              </tr>
                            <tr>
                <td height="18" class="list_detail">10</td>
                <td  class="list_detail"><a href="company_detail.php?id=101">zKuJgvFcobYgxxjB</a></td>
                <td  class="list_detail">http://myirkvisqziv.com/</td>
                <td align="center"  class="list_detail"  ><a href="company_edit.php?id=101"><img src="images/edit.png" width="16" height="16" border="0"></a> &nbsp;<a href="company_delete_do.php?id=101" onClick="return confirm('Are You Sure You Want to Delete');"><img src="images/delete.png" width="16" height="16" border="0"></a>&nbsp;<a class="addfund" href="company_fund_add.php?uid=101&uemail=zKuJgvFcobYgxxjB" ><img src="images/fund.png" width="16" height="16" border="0"> </a></td>
                <td width="113" align="center"  class="list_detail"  ><a href='action1.php?table=company&column=status&email=wrffsf@rcnkxe.com<br>&pass=niCjY&return=company_manage.php&id=101&do=0' title='Set as Suspended'><img src='images/green.png' /></a></td>
              </tr>
                      <tr>
        	<td colspan="5" class="paging"><select name='rows' onChange="window.location.href='/clients/v3/admin/company_manage.php?rows='+this.value"><option value='5' >5</option><option value='10' >10</option><option value='20' selected>20</option><option value='40' >40</option><option value='100' >100</option></select>&nbsp;&nbsp; 1 &nbsp;&nbsp;</td>
        </tr>
          </table></td>
  </tr>
    </table></td>
    <td valign="top">&nbsp;</td>
  </tr>
  <tr> 
    <td height="1" colspan="3" valign="bottom"> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
	<td align="center">&nbsp;</td>
  </tr>
  <tr>
	<td align="left" valign="middle" class="footer_seperator"></td>
  </tr>
  
</table>    </td>
  </tr>
</table>
</asp:Content>
