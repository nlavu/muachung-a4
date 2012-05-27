<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn.Admin.Admin1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <p>
        <asp:SiteMapPath runat="server">
        </asp:SiteMapPath>
    </p>

    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <script type="text/javascript" src="js/js.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <tr>
      <td align="center" valign="top">
      <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
      <tr>
      	<td align="center" valign="top" ><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
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
    	<td align="center" valign="top" ><script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript" src="fancybox/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
<script type="text/javascript" src="fancybox/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="fancybox/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<script language="javascript"  type="text/javascript">
    $(document).ready(function () {
        $(".addfund").fancybox();
        $(".addfund1").fancybox();

    });
</script>
<div align="center">
<style>
#div_dashboard a
{
	color:#0066FF;
	text-decoration:none;
	
}
#div_dashboard a:hover
{
	text-decoration:underline;
}
.db_td
{
	border:solid 1px #89B4D4;
	border-top:none;
	border-left:none;
	color:#0066FF;
}
.db_td2
{
	border-left:solid 1px #89B4D4;
	border-bottom:solid 1px #89B4D4;
}
.db_th
{
	background-color:#6BAAEA;
	color:#ffffff;
	font-weight:bold;
}
.db_lefthd
{
	color:#444444;
}
</style>
<script type="text/javascript" src="datetimepicker_css.js"></script>
<table width="800" align="center">
    <tr>
		<td align="left"><span style="color:#0066FF; font-size:17px; font-weight:bold;" >Reports</span></td>
    </tr>
    
    <tr>
    <td>
       <form id="form1" name="form1" method="post" action="#">

    <table>
    <tr>
      
      <td width="135" align="left"><span style="font-size: 17px; color: #0066FF">Search </span></td>
      <td width="229" align="left">
        <select name="cate" id="cate" onchange="window.location.href='?cate='+this.value">
          <option value="0">-Select-</option>
          <option value="1">Media Partner</option>
          <option value="2">Referral Amount</option>
          <option value="3">Merchants / Ccompany</option>
          <option value="4">Users</option>
        </select>
      </td>
      </tr>
    </table>
    </form>
    </td>
    </tr>
    <tr>
      <td align="center">
      <div id="div_dashboard" style="width:800px; margin:auto;"> 
          <table width="800" cellspacing="0" cellpadding="8">
   	    <tr class="db_th">
                	<td height="24" colspan="2" class="db_td2 db_td">&nbsp;</td>
              <td width="12%" align="center" class="db_td" style="color:#ffffff;"><strong>Today</strong></td>
           	  <td width="11%" align="center" class="db_td" style="color:#ffffff;"><strong>This week</strong></td>
           	  <td width="11%" align="center" class="db_td" style="color:#ffffff;"><strong>This month</strong></td>
           	  <td width="11%" align="center" class="db_td" style="color:#ffffff;"><strong>Total</strong></td>
            </tr>
            	<tr>
				                <td colspan="2" class="db_td db_td2 db_lefthd" align="right">Users</td>
                <td align="center" class="db_td"><a href="user_manage.php" >0</a></td>
                <td align="center" class="db_td"><a href="user_manage.php" >1</a></td>
                <td align="center" class="db_td"><a href="user_manage.php" >1</a></td>
                <td align="center" class="db_td"><a href="user_manage.php" >3792</a></td>
          	  </tr>
            	<tr>
				                <td colspan="2" class="db_td db_td2 db_lefthd" align="right">Companies</td>
                <td align="center" class="db_td"><a href="company_manage.php">0</a></td>
                <td align="center" class="db_td"><a href="company_manage.php">0</a></td>
                <td align="center" class="db_td"><a href="company_manage.php">0</a></td>
                <td align="center" class="db_td"><a href="company_manage.php">10</a></td>
       	    </tr>
            	<tr>
                                    <td width="19%" rowspan="3" class="db_td db_td2 db_lefthd" align="center" valign="middle">Deals</td>
            	  <td width="36%" class="db_td db_lefthd" align="right">Open</td>
            	  <td align="center" class="db_td"><a href="report_deal.php?date=1&open=1">1</a></td>
            	  <td align="center" class="db_td"><a href="report_deal.php?date=7&open=7">0</a></td>
            	  <td align="center" class="db_td"><a href="report_deal.php?date=30&open=30">0</a></td>
            	  <td align="center" class="db_td"><a href="report_deal.php">1</a></td>
          	  </tr>
            	<tr>
                                    <td align="right" class="db_td db_lefthd">Tipped And Close</td>
            	  <td align="center" class="db_td"><a href="report_deal.php?date=1&tipped=1">0</a></td>
            	  <td align="center" class="db_td"><a href="report_deal.php?date=7&tipped=1">0</a></td>
            	  <td align="center" class="db_td"><a href="report_deal.php?date=30&tipped=1">0</a></td>
            	  <td align="center" class="db_td"><a href="report_deal.php">1</a></td>
          	  </tr>
            	<tr>
                                    <td align="right" class="db_td db_lefthd">Cancel and Close</td>
            	  <td align="center" class="db_td"><a href="report_deal.php?date=1&close=1">0</a></td>
            	  <td align="center" class="db_td"><a href="report_deal.php?date=7&close=1">0</a></td>
            	  <td align="center" class="db_td"><a href="report_deal.php?date=30&close=1">0</a></td>
            	  <td align="center" class="db_td"><a href="report_deal.php">1</a></td>
          	  </tr>
            	<tr>
                                    <td rowspan="3" class="db_td db_td2 db_lefthd" align="center" valign="middle">Transactions (Rs)</td>
            	  <td class="db_td db_lefthd" align="right">Paid Referral Amount</td>
            	  <td align="center" class="db_td"><a href="report_referral.php?date=1">0.00</a></td>
            	  <td align="center" class="db_td"><a href="report_referral.php?date=7">0.00</a></td>
            	  <td align="center" class="db_td"><a href="report_referral.php?date=30">0.00</a></td>
            	  <td align="center" class="db_td"><a href="report_referral.php">0.00</a></td>
          	  </tr>
            	<tr>
                                    <td align="right" class="db_td db_lefthd">Paid Amount to Companies</td>
            	  <td align="center" class="db_td"><a href="report_paid_company.php?date=1">0.00</a></td>
            	  <td align="center" class="db_td"><a href="report_paid_company.php?date=7">0.00</a></td>
            	  <td align="center" class="db_td"><a href="report_paid_company.php?date=30">0.00</a></td>
            	  <td align="center" class="db_td"><a href="report_paid_company.php">699.05</a></td>
          	  </tr>
            	<tr>
                                    <td align="right" class="db_td db_lefthd">Withdrawn Amount by Companies</td>
            	   <td align="center" class="db_td"><a href="report_receive_company.php?date=1">0.00</a></td>
            	  <td align="center" class="db_td"><a href="report_receive_company.php?date=7">0.00</a></td>
            	  <td align="center" class="db_td"><a href="report_receive_company.php?date=30">0.00</a></td>
            	  <td align="center" class="db_td"><a href="report_receive_company.php">88.00</a></td>
          	  </tr>
            	<tr>
            	  <td colspan="2" align="right">&nbsp;</td>
            	  <td align="center">&nbsp;</td>
            	  <td align="center">&nbsp;</td>
            	  <td align="center">&nbsp;</td>
            	  <td align="center">&nbsp;</td>
          	  </tr>
          </table>
        </div>
      </td>
  </tr>
</table>
	<br />
     	        
        </div></td></tr></table>
    <br />
    
     	        </div>
       </td>
      </tr>        
      </table></td>
    </tr>
    <tr>
      <td align="left" height="1"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
	<td align="center">&nbsp;</td>
  </tr>
  <tr>
	<td align="left" valign="middle" class="footer_seperator"></td>
  </tr>
  
</table></td>
    </tr>
  </table>
</asp:Content>
