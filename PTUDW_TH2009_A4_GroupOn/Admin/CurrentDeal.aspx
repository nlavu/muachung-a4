<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="CurrentDeal.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn.Admin.CurrentDeal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<link href="css/style.css" rel="stylesheet" type="text/css">
    <p>
        <asp:SiteMapPath runat="server">
        </asp:SiteMapPath>
    </p>
<script language="javascript"  type="text/javascript">

    var xmlhttp;



    function search_records(q) {

        //alert(file);

        xmlhttp = GetXmlHttpObject();

        if (xmlhttp == null) {

            alert("Browser does not support HTTP Request");

            return;

        }

        var url = file;

        //	url=url+str;

        xmlhttp.onreadystatechange = stateChanged;

        xmlhttp.open("GET", url, true);

        xmlhttp.send(null);

    }



    function stateChanged() {

        if (xmlhttp.readyState == 4) {

            document.getElementById('subjDiv').innerHTML = xmlhttp.responseText;

        }

    }

    function GetXmlHttpObject() {

        if (window.XMLHttpRequest) {

            // code for IE7+, Firefox, Chrome, Opera, Safari

            return new XMLHttpRequest();

        }

        if (window.ActiveXObject) {

            // code for IE6, IE5

            return new ActiveXObject("Microsoft.XMLHTTP");

        }

        return null;

    }

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

    <td valign="top"><h1 align="left">Manage Deals</h1>

      <table width="96%" border="0" cellspacing="0" cellpadding="0" align="center">

        <tr>

        
        <td align="center" width="9%" style=" border-style:ridge; border-color:#3366CC;"  height="30px" ><a href="deals_manage.php?current=1">Current</a></td>

        
        
          <td width="10%" align="center"><a href="deals_manage.php?tipped=1">Tipped</a></td> 

          

          <td width="10%" align="center"><a href="deals_manage.php?is_cancelled=1">Cancelled</a></td>
          

          <td width="10%" align="center"><a href="deals_manage.php?all=1">All</a></td>
          <td width="65%" align="center">&nbsp;</td>

        </tr>

      </table>

      <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">

      

        <tr>

          <td align="center"><table width="100%" border="0" cellpadding="0" cellspacing="1" class="list">

              <tr>

                <td width="32" align="center" valign="middle" class="list_heading">SN</td>

                <td width="317" align="center" valign="middle" class="list_heading">Title</td>

                <td width="126" align="center" valign="middle" class="list_heading">Start Time</td>

                <td width="55" align="center" valign="middle" class="list_heading">Price</td>

                <td width="85" align="center" valign="middle" class="list_heading">Actions</td>

              </tr>

              				
              <tr>

                <td height="18" class="list_detail">1</td>

                <td  class="list_detail"><a href="deals_detail.php?id=252">Around the World – Mount Pearl</a>
                <div style="color:#000; font-size:11px; font-weight:bold;; margin:5px 0px 5px 0px; "> 
                	View = 2 | Bought =                   3                </div>
                </td>

				<td  class="list_detail"><span title="End Time: 2012-12-31 20:25:43">2012-01-09 20:25:40</span></td>

                <td  class="list_detail">10.00</td>

                <td align="center"  class="list_detail"><br /> <a href="deals_edit.php?id=252"><img src="images/edit.png" width="16" height="16" border="0"></a> &nbsp;<a href="?do=del&id=252" onClick="return confirm('Are You Sure You Want to Delete');"><img src="images/delete.png" width="16" height="16" border="0"></a> <a href='action.php?table=deals&column=status&return=deals_manage.php&id=252&do=0' title='Set as Suspended'><img src='images/green.png' /></a> <a href="comments.php?dealid=252"><img src="images/comments.gif" title="Comments on the deal" /></a> </td>

              </tr>

              
        <tr>

        	<td colspan="5" class="paging"><select name='rows' onChange="window.location.href='/clients/v3/admin/deals_manage.php?rows='+this.value"><option value='5' >5</option><option value='10' >10</option><option value='20' selected>20</option><option value='40' >40</option><option value='100' >100</option></select>&nbsp;&nbsp; 1 &nbsp;&nbsp;</td>

        </tr>

          </table></td>

        </tr>

    </table>

      </td>

    	<td valign="top" align="right" width="240"><table cellpadding="0" cellspacing="0" width="240">

  <tr>

           <td><form name="form1" method="get">

              <table width="" border="0" cellspacing="1" cellpadding="0">

                <tr>

                  <td class="list_detail">Search:</td>

                  <td class="list_detail"><input type="text" name="q" maxlength="20" onKeyUp="search_records("+this.value+")" /></td>

                  <td class="list_detail"><input type="submit" value=" Go! " /></td>

                </tr>

                <tr>

                	<td><div id="search_reasult">

                    

                    </div></td>

                </tr>

                
              </table>

          </form></td> 

        </tr>

        <tr>

            <td align="left" class="list_detail"><a href="deals_add.php">Add New Deal</a></td>

        </tr>

        <tr>

        	<td class="list_heading">Deal's Categories</td>

        </tr>

        <tr>

       		<td align="left" class="list_detail"></td>

        </tr>
      
       

				<tr>

                	<td align="left" class="list_detail">
       <select name="deals_cate" onChange="window.location.href='deals_manage.php?categoryid='+this.value" id="deals_cate">
       <option value="">All</option>
       <option  value='55' >Automobiles</option><option  value='53' >Hotels</option><option  value='52' >Restaurant</option><option  value='54' >Pedicure</option><option  value='51' >Spa</option>       </select>
                    </td>

          </tr>

			

        <tr>

        	<td class="list_heading">Deal's Companies</td>

        </tr>

        <tr>

       		<td align="left" class="list_detail"></td>

        </tr>
        
        
        

       
       

				<tr>

                	<td align="left" class="list_detail" style="font-weight:bold">
                    
       <select name="deals_comp" onChange="window.location.href='deals_manage.php?companyid='+this.value" id="deals_comp">
       <option value="0">All</option> 
       <option  value='95' >Nashik Automobiles</option><option  value='96' >ABC Spa Ltd</option><option  value='97' >sdfsdfsdfg</option><option  value='94' >EGB Systems</option><option  value='100' >YhDYgcDaeMj</option><option  value='101' >zKuJgvFcobYgxxjB</option><option  value='98' >Long chim</option><option  value='99' >am test</option><option  value='93' >IT</option>       </select>
                    
                    </td>

          </tr>

			
            

        <tr style="display:none">

            	<td class="list_heading" style="display:none">Reseller</td>

            </tr>

            <tr style="display:none">

                <td align="left" class="list_detail" style="font-weight:bold"><a href="deals_manage.php?resellerid=">All</a></td>

          </tr>

            <tr>
      
                <td align="left" class="list_detail"></td>

          </tr>

		
					<tr style="display:none">

                    	<td align="left" class="list_detail">
                         <select name="reseller" onChange="window.location.href='deals_manage.php?resellerid='+this.value" id="reseller">
       <option value="0">Administrator</option> 
              </select>

                        
                        </td>

          </tr>

				
		

            
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
            

    </table></td>

	

  </tr>

  <tr> 

    <td height="1" colspan="3" valign="bottom"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
	<td align="center">&nbsp;</td>
  </tr>
  
</table></td>

  </tr>

</table>
</asp:Content>
