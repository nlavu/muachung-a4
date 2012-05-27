<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="SiteConfig.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn.Admin.SiteConfig" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <p>
        <asp:SiteMapPath runat="server">
        </asp:SiteMapPath>
    </p>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/js.js"></script>

<style>
.list_headingg
{
	color:#FFFFFF;
	background:#3366CC;
	font-weight:bold;
	vertical-align:middle;
	padding:7px;
}
label
{	
	font-size:13px;
}
td
{
	padding:3px;
}

.list_detaillll
{
	/*background:#F1F1F1;*/
	padding:5px;
	vertical-align:middle;
	font-size:12px;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<tr>
      <td align="left" valign="top">      
        <table width="100%" border="0" cellspacing="0" cellpadding="0">

  <tr>
    <td width="25%" height="249" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
		<td valign="top" width="267"><table width="267" border="0">
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
    <!-- Contant start -->
   
    <td width="75%" valign="top"  style="padding:10px">
     <form action="config_do.php?do=general" method="post" enctype="multipart/form-data">
    <table width="100%" border="1" cellspacing="0" cellpadding="0">
      <tr>
        <td height="47" bgcolor="#999999" style="padding-left:10px; color:#FFFFFF">
   
        <h2> General Settings </h2></td>
      </tr>
      <tr>
        <td height="115" style="padding:10px;" valign="top"> 
        	           
            
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td colspan="2" class="list_headingg">Website Information</td>
              </tr>
            <tr>
              <td width="29%"><label>Site Title</label></td>
              <td width="71%"><span class="list_detailll">
                <input name="site_title" type="text" id="site_title" value="Groupon V3" size="60" maxlength="100">
              </span></td>
            </tr>
            <tr>
              <td><label>Site Url</label></td>
              <td valign="middle"><span class="list_detailll">
                <input name="site_url" type="text" id="site_url" value="http://comclone.com/clients/v3/" size="60" maxlength="100">
              </span></td>
            </tr>
            <tr>
              <td><label>Admin Email</label></td>
              <td><span class="list_detailll">
                <input name="admin_email" type="text" id="admin_email" value="info@comclone.com" size="60" maxlength="100">
              </span></td>
            </tr>
            <tr>
              <td><label>Sales Email</label></td>
              <td><span class="list_detailll">
                <input name="sales_email" type="text" id="sales" value="sales@comclone.com" size="60" maxlength="100">
              </span></td>
            </tr>
            <tr>
              <td><label>Support Email</label></td>
              <td><span class="list_detailll">
                <input name="support_email" type="text" id="support_email" value="support@comclone.com" size="60" maxlength="100">
              </span></td>
            </tr>
            <tr>
              <td><label>Upload your logo</label></td>
              <td><input type="file" name="site_logo"   id="site_logo"></td>
            </tr>
            <tr>
              <td></td>
              <td>
               <div style="width:279px; height:96px;">
               <img src="http://comclone.com/clients/v3/images/logo/logo.png" height="96" width="279">                
               </div>
              
              </td>
            </tr>
          </table>
          <br>
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td colspan="2" class="list_headingg">Website Configuration</td>
              </tr>
            <tr>
              <td width="28%"><label>Deal Images</label></td>
              <td width="72%"><span class="list_detailll">Width
                  <input type="text" name="lrg_thmb_img_width" value="440" />
                 
                  Height
<input type="text" name="lrg_thmb_img_height" value="267"/>
              </span></td>
            </tr>
            <tr>
              <td><label>Deal Thumb</label></td>
              <td><span class="list_detailll">Width
                  <input type="text" name="sml_thmb_img_width" value="160"/>
                  
                  Height
<input type="text" name="sml_thmb_img_height" value="140"/>
              </span></td>
            </tr>
            <tr>
              <td><label>Friend Referral Amount</label></td>
              <td><span class="list_detailll">
                Rs<input name="ref_amount" type="text" value="13" size="60" maxlength="100" />
              </span></td>
            </tr>
            <tr>
              <td><label>Affiliate Amount</label></td>
              <td><input name="affamount" type="text" value="5" size="30" maxlength="50" />
              &nbsp;  &nbsp; &nbsp;
              <select name="afftype" id="afftype">
                  <option value="percent">Percent(%)</option>
                  <option value="amount">Amount</option>
                </select></td>
            </tr>
            
            <tr>
              <td><label>Default Area</label></td>
              <td><span class="list_detailll">
                <select name="defaultareaid">
                  <option  value='22' >chennai</option><option  value='24' >Dallas</option><option  value='25' >Maharashtra</option><option selected value='21' >New York</option><option  value='23' >Vadapalani</option>                </select>
              </span></td>
            </tr>
            <tr style="display:none">
              <td><label>Show Groups</label></td>
              <td><span class="list_detailll">
                <select name="group_mode" id="group_mode">
                  <option value="1"selected>ON</option>
                  <option value="0">OFF</option>
                </select>
              </span></td>
            </tr>
            <tr>
              <td class="list_detailll">Auto Login</td>
              <td><span class="list_detailll">
                <select name="auto_login" id="auto_login">
                  <option value="1">Yes</option>
                  <option value="0"selected>No</option>
                </select>
              </span></td>
            </tr>
            <tr>
              <td class="list_detailll">Auto Fund Request from Merchants</td>
              <td><span class="list_detailll">
                <select name="auto_fund" id="auto_fund">
                  <option value="1"selected>Yes</option>
                  <option value="0">No</option>
                </select>
              </span></td>
            </tr>
            <tr>
              <td><label>Show Startup Module</label></td>
              <td><span class="list_detailll">
                <select name="startup_module" id="starup_module">
                  <option value="1">ON</option>
                  <option value="0"selected>OFF</option>
                </select>
              </span></td>
            </tr>
            <tr>
              <td><label>Facebook Application Id</label></td>
              <td><label for="fb_id"></label>
                <input name="fb_id" type="text" id="fb_id" value="290487697644701" size="60"></td>
            </tr>
            <tr>
              <td><label>Facebook Application Secret</label></td>
              <td><label for="fb_secret"></label>
                <input name="fb_secret" type="text" id="fb_secret" value="1a69c49980e0b191bf5847a38b6d317e" size="60"></td>
            </tr>
          </table>
         	<br>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td colspan="2" class="list_headingg">Locale Configurations</td>
              </tr>
            <tr>
              <td width="28%"><label>Default Country</label></td>
              <td width="72%"><span class="list_detailll">
                <select name="defaultcountryid">
           <option  value='272' >Afghanistan</option><option  value='345' >Aland Islands</option><option  value='273' >Albania</option><option  value='275' >Algeria</option><option  value='276' >American Samoa</option><option  value='277' >Andorra</option><option  value='278' >Angola</option><option  value='459' >Anguilla</option><option  value='274' >Antarctica</option><option  value='279' >Antigua and Barbuda</option><option  value='281' >Argentina</option><option  value='287' >Armenia</option><option  value='424' >Aruba</option><option  value='282' >Australia</option><option  value='283' >Austria</option><option  value='280' >Azerbaijan</option><option  value='284' >Bahamas</option><option  value='285' >Bahrain</option><option  value='286' >Bangladesh</option><option  value='288' >Barbados</option><option  value='305' >Belarus</option><option  value='289' >Belgium</option><option  value='297' >Belize</option><option  value='330' >Benin</option><option  value='290' >Bermuda</option><option  value='291' >Bhutan</option><option  value='292' >Bolivia</option><option  value='293' >Bosnia and Herzegovina</option><option  value='294' >Botswana</option><option  value='295' >Bouvet Island</option><option  value='296' >Brazil</option><option  value='298' >British Indian Ocean Territory</option><option  value='300' >British Virgin Islands</option><option  value='301' >Brunei</option><option  value='302' >Bulgaria</option><option  value='510' >Burkina Faso</option><option  value='304' >Burundi</option><option  value='306' >Cambodia</option><option  value='307' >Cameroon</option><option  value='308' >Canada</option><option  value='309' >Cape Verde</option><option  value='310' >Cayman Islands</option><option  value='311' >Central African Republic</option><option  value='313' >Chad</option><option  value='314' >Chile</option><option  value='315' >China</option><option  value='317' >Christmas Island</option><option  value='318' >Cocos Islands</option><option  value='319' >Colombia</option><option  value='320' >Comoros</option><option  value='324' >Cook Islands</option><option  value='325' >Costa Rica</option><option  value='326' >Croatia</option><option  value='327' >Cuba</option><option  value='328' >Cyprus</option><option  value='329' >Czech Republic</option><option  value='323' >Democratic Republic of the Congo</option><option  value='331' >Denmark</option><option  value='350' >Djibouti</option><option  value='332' >Dominica</option><option  value='333' >Dominican Republic</option><option  value='449' >East Timor</option><option  value='334' >Ecuador</option><option  value='502' >Egypt</option><option  value='335' >El Salvador</option><option  value='336' >Equatorial Guinea</option><option  value='338' >Eritrea</option><option  value='339' >Estonia</option><option  value='337' >Ethiopia</option><option  value='341' >Falkland Islands</option><option  value='340' >Faroe Islands</option><option  value='343' >Fiji</option><option  value='344' >Finland</option><option  value='346' >France</option><option  value='347' >French Guiana</option><option  value='348' >French Polynesia</option><option  value='349' >French Southern Territories</option><option  value='351' >Gabon</option><option  value='353' >Gambia</option><option  value='352' >Georgia</option><option  value='355' >Germany</option><option  value='356' >Ghana</option><option  value='357' >Gibraltar</option><option  value='359' >Greece</option><option  value='360' >Greenland</option><option  value='361' >Grenada</option><option  value='362' >Guadeloupe</option><option  value='363' >Guam</option><option  value='364' >Guatemala</option><option  value='504' >Guernsey</option><option  value='365' >Guinea</option><option  value='448' >Guinea-Bissau</option><option  value='366' >Guyana</option><option  value='367' >Haiti</option><option  value='368' >Heard Island and McDonald Islands</option><option  value='370' >Honduras</option><option  value='371' >Hong Kong</option><option  value='372' >Hungary</option><option  value='373' >Iceland</option><option selected value='374' >India</option><option  value='375' >Indonesia</option><option  value='376' >Iran</option><option  value='377' >Iraq</option><option  value='378' >Ireland</option><option  value='506' >Isle of Man</option><option  value='379' >Israel</option><option  value='380' >Italy</option><option  value='381' >Ivory Coast</option><option  value='382' >Jamaica</option><option  value='383' >Japan</option><option  value='505' >Jersey</option><option  value='385' >Jordan</option><option  value='384' >Kazakhstan</option><option  value='386' >Kenya</option><option  value='358' >Kiribati</option><option  value='511' >Kosovo</option><option  value='389' >Kuwait</option><option  value='390' >Kyrgyzstan</option><option  value='391' >Laos</option><option  value='394' >Latvia</option><option  value='392' >Lebanon</option><option  value='393' >Lesotho</option><option  value='395' >Liberia</option><option  value='396' >Libya</option><option  value='397' >Liechtenstein</option><option  value='398' >Lithuania</option><option  value='399' >Luxembourg</option><option  value='400' >Macao</option><option  value='501' >Macedonia</option><option  value='401' >Madagascar</option><option  value='402' >Malawi</option><option  value='403' >Malaysia</option><option  value='404' >Maldives</option><option  value='405' >Mali</option><option  value='406' >Malta</option><option  value='437' >Marshall Islands</option><option  value='407' >Martinique</option><option  value='408' >Mauritania</option><option  value='409' >Mauritius</option><option  value='321' >Mayotte</option><option  value='410' >Mexico</option><option  value='436' >Micronesia</option><option  value='413' >Moldova</option><option  value='411' >Monaco</option><option  value='412' >Mongolia</option><option  value='414' >Montenegro</option><option  value='415' >Montserrat</option><option  value='416' >Morocco</option><option  value='417' >Mozambique</option><option  value='303' >Myanmar</option><option  value='419' >Namibia</option><option  value='420' >Nauru</option><option  value='421' >Nepal</option><option  value='422' >Netherlands</option><option  value='423' >Netherlands Antilles</option><option  value='425' >New Caledonia</option><option  value='427' >New Zealand</option><option  value='428' >Nicaragua</option><option  value='429' >Niger</option><option  value='430' >Nigeria</option><option  value='431' >Niue</option><option  value='432' >Norfolk Island</option><option  value='387' >North Korea</option><option  value='434' >Northern Mariana Islands</option><option  value='433' >Norway</option><option  value='418' >Oman</option><option  value='439' >Pakistan</option><option  value='438' >Palau</option><option  value='354' >Palestinian Territory</option><option  value='440' >Panama</option><option  value='441' >Papua New Guinea</option><option  value='442' >Paraguay</option><option  value='443' >Peru</option><option  value='444' >Philippines</option><option  value='445' >Pitcairn</option><option  value='446' >Poland</option><option  value='447' >Portugal</option><option  value='450' >Puerto Rico</option><option  value='451' >Qatar</option><option  value='322' >Republic of the Congo</option><option  value='452' >Reunion</option><option  value='453' >Romania</option><option  value='454' >Russia</option><option  value='455' >Rwanda</option><option  value='456' >Saint Barth�lemy</option><option  value='457' >Saint Helena</option><option  value='458' >Saint Kitts and Nevis</option><option  value='460' >Saint Lucia</option><option  value='461' >Saint Martin</option><option  value='462' >Saint Pierre and Miquelon</option><option  value='463' >Saint Vincent and the Grenadines</option><option  value='516' >Samoa</option><option  value='464' >San Marino</option><option  value='465' >Sao Tome and Principe</option><option  value='466' >Saudi Arabia</option><option  value='467' >Senegal</option><option  value='468' >Serbia</option><option  value='518' >Serbia and Montenegro</option><option  value='469' >Seychelles</option><option  value='470' >Sierra Leone</option><option  value='471' >Singapore</option><option  value='472' >Slovakia</option><option  value='474' >Slovenia</option><option  value='299' >Solomon Islands</option><option  value='475' >Somalia</option><option  value='476' >South Africa</option><option  value='342' >South Georgia and the South Sandwich Islands</option><option  value='388' >South Korea</option><option  value='478' >Spain</option><option  value='312' >Sri Lanka</option><option  value='480' >Sudan</option><option  value='481' >Suriname</option><option  value='482' >Svalbard and Jan Mayen</option><option  value='483' >Swaziland</option><option  value='484' >Sweden</option><option  value='485' >Switzerland</option><option  value='486' >Syria</option><option  value='316' >Taiwan</option><option  value='487' >Tajikistan</option><option  value='507' >Tanzania</option><option  value='488' >Thailand</option><option  value='489' >Togo</option><option  value='490' >Tokelau</option><option  value='491' >Tonga</option><option  value='492' >Trinidad and Tobago</option><option  value='494' >Tunisia</option><option  value='495' >Turkey</option><option  value='496' >Turkmenistan</option><option  value='497' >Turks and Caicos Islands</option><option  value='498' >Tuvalu</option><option  value='509' >U.S. Virgin Islands</option><option  value='499' >Uganda</option><option  value='500' >Ukraine</option><option  value='493' >United Arab Emirates</option><option  value='503' >United Kingdom</option><option  value='508' >United States</option><option  value='435' >United States Minor Outlying Islands</option><option  value='512' >Uruguay</option><option  value='513' >Uzbekistan</option><option  value='426' >Vanuatu</option><option  value='369' >Vatican</option><option  value='514' >Venezuela</option><option  value='473' >Vietnam</option><option  value='515' >Wallis and Futuna</option><option  value='479' >Western Sahara</option><option  value='517' >Yemen</option><option  value='519' >Zambia</option><option  value='477' >Zimbabwe</option>                </select>
              </span></td>
            </tr>
            <tr>
              <td><label>Currency</label></td>
              <td><span class="list_detailll">
                <input type="text" value="Rs" name="currency" />
              </span></td>
            </tr>
            <tr>
              <td>Currency Iso</td>
              <td><span class="list_detailll">
                <input type="text" value="INR" name="currency_isoo" />
              </span></td>
            </tr>
            </table> 
          
          <br>
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td colspan="2" class="list_headingg">SEO Configurations</td>
              </tr>
            <tr>
              <td width="28%"><label>Global Meta Description</label></td>
              <td width="72%"><span class="list_detailll">
                <input name="global_description" type="text" id="global_description" value="openbox.com.my is your ticket to ride…the entire city! Our daily deals cater to you – the savvy saver – by offering goods and services of all varieties including fine restaurants, upscale hair salons, relaxing massages, sports events, and more! Let openbox.com.my be the little voice that guides you to the best and brightest your city has to offer. " size="60">
              </span></td>
            </tr>
            <tr>
              <td><label>Global Meta Keywords</label></td>
              <td><span class="list_detailll">
                <input name="global_keywords" type="text" id="global_keywords" value="Group Bulk Buy Offers groupon voucher discount food " size="60">
              </span></td>
            </tr>
            <tr>
              <td><label>Show SEO Urls</label></td>
              <td><label>ON</label></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><input type="submit" name="Submit"   value="Save Configuration"></td>
            </tr>
          </table>
          
          
          </td>
      </tr>
    </table>
    	 </form>   <!--End General Configuation -->
         
         <br>
         <form action="config_do.php?do=payment" method="post">   
         	<table width="100%" border="1" cellspacing="0" cellpadding="0">
      <tr>
        <td height="47" bgcolor="#999999" style="padding-left:10px; color:#FFFFFF"><h2> Payment Configuration</h2></td>
      </tr>
      <tr>
        <td height="115" style="padding:10px;" valign="top"> 
        	           
            
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td colspan="2" class="list_headingg">Payment Information</td>
              </tr>
            <tr>
              <td width="29%"><span class="list_detaill">
                <input type="radio"  name="payment_gateway" value="paypal" />
                <strong> Paypal Pro</strong></span></td>
              <td width="71%">&nbsp;</td>
            </tr>
            <tr>
              <td><span class="list_detaill">Server Type:</span></td>
              <td valign="middle"><select name="paypal_servertype" id="paypal_servertype">
                <option selected value="Test Server">Test Server</option>
                <option  value="Live Server">Live Server</option>
              </select></td>
            </tr>
            <tr>
              <td><span class="list_detaill">API Username: </span></td>
              <td><span class="list_detaill">
                <input name="paypal_api_username" type="text" id="paypal_api_username" value="kashif3_api1.gmail.com" size="60" maxlength="50">
              </span></td>
            </tr>
            <tr>
              <td><span class="list_detaill">API Password: </span></td>
              <td><span class="list_detaill">
                <input name="paypal_api_password" type="text" id="paypal_api_password" value="NCZ5GSB4SCLYPY8Y" size="60" maxlength="100">
              </span></td>
            </tr>
            <tr>
              <td><span class="list_detaill">API Signature: </span></td>
              <td><span class="list_detaill">
                <input name="paypal_api_signature" type="text" id="paypal_api_signature" value="AxNk0L6n1-hU0H1uCBIvzgu8uvilASKvvBGvV33Fyxv.CMeC0C2R.tD8 " size="60" maxlength="100">
              </span></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td><span class="list_detaill"><strong>
                  <input type="radio" checked name="payment_gateway" value="paypal_strnd" />
PayPal Standard:</span></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td><span class="list_detaill">Server Type: </span></td>
              <td><select name="paypal_strnd_sertype" id="paypal_strnd_sertype">
                <option  value="Test Server">Test Server</option>
                <option selected value="Live Server">Live Server</option>
              </select></td>
            </tr>
            <tr>
              <td><span class="list_detaill">Paypal Email: </span></td>
              <td><span class="list_detaill">
                <input name="paypal_standard_email" type="text" id="paypal_standard_email" value="suppor_1297980148_biz@comclone.com" size="60" maxlength="100">
              </span></td>
            </tr>
            <tr style="display:none">
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr style="display:none">
              <td><strong>
            <input type="radio"  name="payment_gateway" value="authorize" /> 
            Authorize.net </strong></td>
              <td>&nbsp;</td>
            </tr>
            <tr style="display:none">
              <td>Server Type:
             
              </td>
              <td><label>
            <select name="authorize_servertype" id="authorize_servertype">
              <option selected   value="Test Server">Test Server</option>
              <option  value="Live Server">Live Server</option>
            </select>
          </label></td>
            </tr>
            <tr style="display:none">
              <td>API Username:</td>
              <td><input name="authorize_api_username" type="text" id="authorize_api_username" value="6834s6PeDqPW" size="60" maxlength="100"></td>
            </tr>
            <tr style="display:none">
              <td>API Transaction Key: </td>
              <td>
                <input name="authorize_api_transaction_key" type="text" id="authorize_api_transaction_key" value="33Y5ReMN8b6ft58f" size="60">
              </td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><span class="list_detaill">
                <input type="submit" name="Submit2"   value="Save Configuration">
              </span></td>
            </tr>
          </table>
          </td>
      </tr>
    </table>
         </form>   <!--End payment -->
 		<br>
        <form action="config_do.php?do=facebook" method="post">
          <table width="100%" border="1" cellspacing="0" cellpadding="0">
            <tr>
              <td height="47" bgcolor="#999999" style="padding-left:10px; color:#FFFFFF"><h2> Social Sharing</h2></td>
            </tr>
            <tr>
              <td height="115" style="padding:10px;" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td colspan="2" class="list_headingg">Facebook Information</td>
                </tr>
                <tr>
                  <td width="29%"><span class="list_detaill">Facebook Page: </span></td>
                  <td width="71%"><span class="list_detaill">
                    <input name="facebook_page" type="text" id="facebook_page" value="http://www.facebook.com/pages/OpenBox/208253869209802" size="60">
                  </span></td>
                </tr>
                <tr>
                  <td><span class="list_detaill">Facebook Live Feed: </span></td>
                  <td valign="middle"><textarea name="facebook_livefeed" id="facebook_livefeed" cols="45" rows="5"><iframe src="http://www.facebook.com/plugins/activity.php?site=comclone.com&width=214&height=360&header=true&colorscheme=light&border_color=%23eeeeee&recommendations=false" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:214px; height:360px;" allowTransparency="true"></iframe></textarea></td>
                </tr>
                <tr>
                  <td><span class="list_detaill">Facebook Share: </span></td>
                  <td><textarea name="facebook_share" id="facebook_share" cols="45" rows="5"><script src="http://connect.facebook.net/en_US/all.js#xfbml=1"></script><fb:like href="domain" show_faces="false" width="350" font="trebuchet ms"></fb:like></textarea></td>
                </tr>
                <tr>
                  <td><span class="list_detaill">Facebook Like: </span></td>
                  <td><textarea name="facebook_like" id="facebook_like" cols="45" rows="5"><script src="http://connect.facebook.net/en_US/all.js#xfbml=1"></script><fb:like href="domain" show_faces="false" width="350" font="trebuchet ms"></fb:like></textarea></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                </table>
                <br>
                
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td colspan="2" class="list_headingg">Twitter Information</td>
                </tr>
                <tr>
                  <td width="29%"><span class="list_detaill">Twitter Page:</span></td>
                  <td width="71%"><span class="list_detaill">
                    <input name="twitter_page" type="text" id="twitter_page" value="http://www.twitter.com/dealsprocket/" size="60">
                  </span></td>
                </tr>
                <tr>
                  <td><span class="list_detaill">Twitter Live Feed: </span></td>
                  <td valign="middle"><span class="list_detaill">
                    <textarea name="twitter_livefeed" id="twitter_livefeed" cols="45" rows="5">uyttuu</textarea>
                  </span></td>
                </tr>
                <tr>
                  <td><span class="list_detaill">Twitter Share: </span></td>
                  <td><textarea name="twitter_share" id="twitter_share" cols="45" rows="5">javascript:void(window.open('http://twitter.com/home?status=Excellent offers Fellows - '+encodeURIComponent(document.location.toString()),'ptm','height=450,width=440').focus())</textarea></td>
                </tr>
                </table>
             
               
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                
                <tr>
                  <td width="32%">&nbsp;</td>
                  <td width="68%"><span class="list_detaill">
                    <input type="submit" name="Submit7"   value="Save Configuration">
                  </span></td>
                </tr>
              </table>
                
                </td>
            </tr>
          </table>
             <!-- -->
        </form>
 	   
        
            
    </td>
    <!-- Contant start -->
   
  </tr>
</table>
      </td>
      </tr>
        <tr>
      <td align="left" height="1"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
	<td align="center">&nbsp;</td>
  </tr>
  
  
</table></td>
    </tr>
  </table>
</asp:Content>
