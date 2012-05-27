<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="DealCategory.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn.Admin.DealCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<link href="css/style.css" rel="stylesheet" type="text/css">
    <p>
        <asp:SiteMapPath runat="server">
        </asp:SiteMapPath>
    </p>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<tr> 
   	
    <td valign="top">
 
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                 <tr>
                  <td align="left" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
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
                  	<td align="center" valign="top">
                    
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <form action="deals_category_manage.php" method="post">
                                            <tr><td> <span style="color:red">   </span>
     <br><h1>Manage Deals Category</h1></td></tr>
                      <tr>
                        <td colspan="2" class="list_heading">Add Deal's Category</td>
                      </tr>
                      <tr>
                        <td class="list_detail">Title</td>
                        <td class="list_detail"><input type="text" name="title" value="" /></td>
                      </tr>
                      <tr>
                        <td colspan="2" class="list_detail"><input type="submit" name="submit" value="Add" /></td>
                      </tr>
                    </form>
                    <tr>
                  <td align="center" colspan="2" width="100%"><table width="100%" align="center" border="0" cellspacing="0" cellpadding="0">
                      
                    </table>
		<table width="100%" >
                      <td width="10%" align="center" valign="middle" class="list_heading">SN</td>
                      <td width="70%" align="center" valign="middle" class="list_heading">Title</td>
                      <td width="20%" align="center" valign="middle" class="list_heading">Action</td>
                    

						<tr>
				<td class="list_detail">1</td> 
            	<td class="list_detail"><a href="deals_manage.php?categoryid=55">Automobiles</a></td>
	            <td align="center" class="list_detail"><a href="deals_category_manage.php?id=55&tab=edit"><img src="images/edit.png" width="16" height="16" border="0"></a> &nbsp;<a href="deals_category_manage.php?id=55&tab=status&status=0"><img src="images/green.png" width="16" height="16" border="0"></a>&nbsp;<a href="deals_category_manage.php?id=55&tab=delete" onClick="return confirm('Are You Sure You Want to Delete');"><img src="images/delete.png" width="16" height="16" border="0"></a>  </td>
            </tr>

						<tr>
				<td class="list_detail">2</td> 
            	<td class="list_detail"><a href="deals_manage.php?categoryid=53">Hotels</a></td>
	            <td align="center" class="list_detail"><a href="deals_category_manage.php?id=53&tab=edit"><img src="images/edit.png" width="16" height="16" border="0"></a> &nbsp;<a href="deals_category_manage.php?id=53&tab=status&status=0"><img src="images/green.png" width="16" height="16" border="0"></a>&nbsp;<a href="deals_category_manage.php?id=53&tab=delete" onClick="return confirm('Are You Sure You Want to Delete');"><img src="images/delete.png" width="16" height="16" border="0"></a>  </td>
            </tr>

						<tr>
				<td class="list_detail">3</td> 
            	<td class="list_detail"><a href="deals_manage.php?categoryid=52">Restaurant</a></td>
	            <td align="center" class="list_detail"><a href="deals_category_manage.php?id=52&tab=edit"><img src="images/edit.png" width="16" height="16" border="0"></a> &nbsp;<a href="deals_category_manage.php?id=52&tab=status&status=0"><img src="images/green.png" width="16" height="16" border="0"></a>&nbsp;<a href="deals_category_manage.php?id=52&tab=delete" onClick="return confirm('Are You Sure You Want to Delete');"><img src="images/delete.png" width="16" height="16" border="0"></a>  </td>
            </tr>

						<tr>
				<td class="list_detail">4</td> 
            	<td class="list_detail"><a href="deals_manage.php?categoryid=54">Pedicure</a></td>
	            <td align="center" class="list_detail"><a href="deals_category_manage.php?id=54&tab=edit"><img src="images/edit.png" width="16" height="16" border="0"></a> &nbsp;<a href="deals_category_manage.php?id=54&tab=status&status=0"><img src="images/green.png" width="16" height="16" border="0"></a>&nbsp;<a href="deals_category_manage.php?id=54&tab=delete" onClick="return confirm('Are You Sure You Want to Delete');"><img src="images/delete.png" width="16" height="16" border="0"></a>  </td>
            </tr>

						<tr>
				<td class="list_detail">5</td> 
            	<td class="list_detail"><a href="deals_manage.php?categoryid=51">Spa</a></td>
	            <td align="center" class="list_detail"><a href="deals_category_manage.php?id=51&tab=edit"><img src="images/edit.png" width="16" height="16" border="0"></a> &nbsp;<a href="deals_category_manage.php?id=51&tab=status&status=0"><img src="images/green.png" width="16" height="16" border="0"></a>&nbsp;<a href="deals_category_manage.php?id=51&tab=delete" onClick="return confirm('Are You Sure You Want to Delete');"><img src="images/delete.png" width="16" height="16" border="0"></a>  </td>
            </tr>

			            </table></td></tr>
              </table></td>
                </tr>
                <tr>
                  	<td align="center">&nbsp;</td>
                </tr>
                
                </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
	<td align="center">&nbsp;</td>
  </tr>
  
</table></table>

</td>
</tr>


</asp:Content>
