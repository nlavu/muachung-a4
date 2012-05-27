<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddNewCompany.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn.Admin.AddNewCompany" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <p>
        <asp:SiteMapPath runat="server">
        </asp:SiteMapPath>
    </p>
<link type="text/css" rel="stylesheet" href="css/style.css" />
    <script type="text/javascript" src="js/js.js"></script>
<script type="text/javascript" src="js/tiny_mce.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>  
<script type="text/javascript">
    $(document).ready(function () {
        //======================
        $("#btn_deal").click(function () {
            //alert("ASDFAS");
            bool = true;


            if ($("#s_country").val() == 0) {
                $("#com_t").html("<br><font color='red'>Select Country</font>");
                bool = false;
            }

            if ($("#s_state").val() == 0) {
                $("#d_t").html("<br><font color='red'>Select State</font>");
                bool = false;
            }


            if ($("#s_city").val() == 0) {
                $("#ss_t").html("<br><font color='red'>Select City</font>");
                bool = false;
            }



            if ($("#zip").val() == "") {
                //msg+="Deal Title is Manadatory\n";
                $("#fine_t").html("<br><font color='red'>Zip Code is Manadatory</font>");
                bool = false;
            }

            if ($("#add1").val() == "") {
                $("#high_t").html("<br><font color='red'>Address is Manadatory</font>");
                bool = false;
            }

            if ($("#email").val() == "") {

                $("#s_t").html("<br><font color='red'>Email is Manadatory</font>");
                bool = false;
            }

            if ($("#password").val() == "") {
                $("#e_t").html("<br><font color='red'>password is Manadatory</font>");
                bool = false;
            }

            if ($("#company_contactname").val() == "") {
                $("#ex_t").html("<br><font color='red'>Contact Name is Manadatory</font>");
                bool = false;

            }

            if ($("#company_name").val() == "") {
                $("#m_t").html("<br><font color='red'>Company Name is Manadatory</font>");
                bool = false;
            }




            if (!bool) {
                alert("There are some errors");
                return false;
            }
            else
                return true;


        });
        $("#s_country").change(function () {
            if ($("#s_country").val() == 0) {
                $("#com_t").html("<br><font color='red'>Select Country</font>");

            }
            else
                $("#com_t").html("");

        });

        $("#s_state").change(function () {
            if ($("#s_state").val() == 0) {
                $("#d_t").html("<br><font color='red'>Select State</font>");

            }
            else
                $("#d_t").html("");

        });



        $("#s_city").change(function () {
            if ($("#s_state").val() == 0) {
                $("#d_t").html("<br><font color='red'>Select State</font>");
            }
            else
                $("#d_t").html("");

        });


        $("#zip").focus(function () {
            $("#fine_t").html("");
        });
        $("#zip").blur(function () {

            if ($("#zip").val() == "")
                $("#fine_t").html("<br><font color='red'>Zip Code is Manadatory</font>");

        });


        $("#add1").focus(function () {
            $("#high_t").html("");
        });
        $("#add1").blur(function () {

            if ($("#add1").val() == "")
                $("#high_t").html("<br><font color='red'>Address is Manadatory</font>");

        });


        $("#email").focus(function () {
            $("#s_t").html("");
        });
        $("#email").blur(function () {

            if ($("#email").val() == "")
                $("#s_t").html("<br><font color='red'>Email is Manadatory</font>");

        });


        $("#password").focus(function () {
            $("#e_t").html("");
        });
        $("#password").blur(function () {

            if ($("#password").val() == "")
                $("#e_t").html("<br><font color='red'>password is Manadatory</font>");

        });


        $("#company_contactname").focus(function () {
            $("#ex_t").html("");
        });
        $("#company_contactname").blur(function () {

            if ($("#company_contactname").val() == "")
                $("#ex_t").html("<br><font color='red'>Contact Name is Manadatory</font>");

        });


        $("#company_name").focus(function () {
            $("#m_t").html("");
        });
        $("#company_name").blur(function () {

            if ($("#company_name").val() == "")
                $("#m_t").html("<br><font color='red'>Company Name is Manadatory</font>");

        });






        //======================
        $("#cancle").click(function () {
            //alert("S");
            $("#one").show();
            $("#onee").hide();
        });

        $("#canclet").click(function () {
            //alert("S");
            $("#two").show();
            $("#twoo").hide();
        });

        var a = 0;
        $("#addnew").click(function () {
            //a++;
            //if(a==1)
            //{
            $.post('add_state.php', { iddd: $("#s_country").val(), test: "durani" },
			function (data) {
			    $("#res").html(data);
			})

            $("#one").hide();
            $("#onee").show();
            //a=0;		
            //}

        });


    });

    $(document).ready(function () {

        $("#addnew2").click(function () {
            $.post('add_city.php', { stateid: $("#s_state").val(), test: "durani" },
			function (data) {
			    $("#ress").html(data);
			})
            $("#two").hide();
            $("#twoo").show();

        });
    });

    function validate() {

        if (document.getElementById("about").value == "") {
            msg += "About Company is Manadatory\n";
            bool = false;
        }
        if (!bool) {
            alert(msg);
        }
        return bool;
    }

    function getState(str) {
        //str = document.getElementById('state').options[document.getElementById('state').selectedIndex].text;
        document.getElementById('state_name').value = str;
    }

</script>

<script type="text/javascript">
    //var ed1 = new tinyMCE.init('deal_desc',{
    // General options
    var ed1 = new tinymce.Editor('deal_desc', {

        mode: "textareas",
        theme: "advanced",
        plugins: "safari,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,wordcount",

        // Theme options
        theme_advanced_buttons1: "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
        theme_advanced_buttons2: "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
        theme_advanced_buttons3: "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
        theme_advanced_buttons4: "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak",
        theme_advanced_toolbar_location: "top",
        theme_advanced_toolbar_align: "left",
        theme_advanced_statusbar_location: "bottom",
        theme_advanced_resizing: true,

        // Example content CSS (should be your site CSS)
        //	editor_selector :"mceEditor",   
        content_css: "content.css",
        width: "100%",
        height: "300",
        // Drop lists for link/image/media/template dialogs
        template_external_list_url: "template_list.js",
        external_link_list_url: "link_list.js",
        external_image_list_url: "image_list.js",
        media_external_list_url: "media_list.js",
        editor_deselector: "mceNoEditor",
        // Replace values for the template plugin
        template_replace_values: {
            username: "Some User",
            staffid: "991234"
        }
    });


    var ed11 = new tinymce.Editor('deal_description', {

        mode: "textareas",
        theme: "advanced",
        plugins: "safari,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,wordcount",

        // Theme options
        theme_advanced_buttons1: "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
        theme_advanced_buttons2: "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
        theme_advanced_buttons3: "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
        theme_advanced_buttons4: "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak",
        theme_advanced_toolbar_location: "top",
        theme_advanced_toolbar_align: "left",
        theme_advanced_statusbar_location: "bottom",
        theme_advanced_resizing: true,

        // Example content CSS (should be your site CSS)
        //	editor_selector :"mceEditor",   
        content_css: "content.css",
        width: "100%",
        height: "300",
        // Drop lists for link/image/media/template dialogs
        template_external_list_url: "lists/template_list.js",
        external_link_list_url: "lists/link_list.js",
        external_image_list_url: "lists/image_list.js",
        media_external_list_url: "lists/media_list.js",
        editor_deselector: "mceNoEditor",
        // Replace values for the template plugin
        template_replace_values: {
            username: "Some User",
            staffid: "991234"
        }
    });

    var about = new tinymce.Editor('about', {

        mode: "textareas",
        theme: "advanced",
        plugins: "safari,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,wordcount",

        // Theme options
        theme_advanced_buttons1: "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
        theme_advanced_buttons2: "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
        theme_advanced_buttons3: "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
        theme_advanced_buttons4: "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak",
        theme_advanced_toolbar_location: "top",
        theme_advanced_toolbar_align: "left",
        theme_advanced_statusbar_location: "bottom",
        theme_advanced_resizing: true,

        // Example content CSS (should be your site CSS)
        //	editor_selector :"mceEditor",   
        content_css: "content.css",
        width: "100%",
        height: "300",
        // Drop lists for link/image/media/template dialogs
        template_external_list_url: "lists/template_list.js",
        external_link_list_url: "lists/link_list.js",
        external_image_list_url: "lists/image_list.js",
        media_external_list_url: "lists/media_list.js",
        editor_deselector: "mceNoEditor",
        // Replace values for the template plugin
        template_replace_values: {
            username: "Some User",
            staffid: "991234"
        }
    });
    var groupon_remarks = new tinymce.Editor('groupon_remarks', {

        mode: "textareas",
        theme: "advanced",
        plugins: "safari,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,wordcount",

        // Theme options
        theme_advanced_buttons1: "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
        theme_advanced_buttons2: "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
        theme_advanced_buttons3: "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
        theme_advanced_buttons4: "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak",
        theme_advanced_toolbar_location: "top",
        theme_advanced_toolbar_align: "left",
        theme_advanced_statusbar_location: "bottom",
        theme_advanced_resizing: true,

        // Example content CSS (should be your site CSS)
        //	editor_selector :"mceEditor",   
        content_css: "content.css",
        width: "100%",
        height: "300",
        // Drop lists for link/image/media/template dialogs
        template_external_list_url: "lists/template_list.js",
        external_link_list_url: "lists/link_list.js",
        external_image_list_url: "lists/image_list.js",
        media_external_list_url: "lists/media_list.js",
        editor_deselector: "mceNoEditor",
        // Replace values for the template plugin
        template_replace_values: {
            username: "Some User",
            staffid: "991234"
        }
    });
    var body1 = new tinymce.Editor('body', {

        mode: "textareas",
        theme: "advanced",
        plugins: "safari,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,wordcount",

        // Theme options
        theme_advanced_buttons1: "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
        theme_advanced_buttons2: "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
        theme_advanced_buttons3: "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
        theme_advanced_buttons4: "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak",
        theme_advanced_toolbar_location: "top",
        theme_advanced_toolbar_align: "left",
        theme_advanced_statusbar_location: "bottom",
        theme_advanced_resizing: true,

        // Example content CSS (should be your site CSS)
        //	editor_selector :"mceEditor",   
        content_css: "content.css",
        width: "100%",
        height: "300",
        // Drop lists for link/image/media/template dialogs
        template_external_list_url: "lists/template_list.js",
        external_link_list_url: "lists/link_list.js",
        external_image_list_url: "lists/image_list.js",
        media_external_list_url: "lists/media_list.js",
        editor_deselector: "mceNoEditor",
        // Replace values for the template plugin
        template_replace_values: {
            username: "Some User",
            staffid: "991234"
        }
    });
    ed1.render();
    ed11.render();
    about.render();
    groupon_remarks.render();
    body1.render();
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<tr> 
    <td valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
			        <td align="left" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
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
        <td align="left" valign="top"><form action="company_add_do.php" method="post" enctype="multipart/form-data" name="frmAdd"  onSubmit="return validate()">
          <input type="hidden" name="t" value="" /><h1 align="left">Add Company</h1>
          <table width="100%" border="0" cellpadding="0" cellspacing="1" class="list">
            <tr>
            	<td colspan="5" class="list_heading" align="left">Company Market</td>
            </tr>
            <tr>
              <td valign="top" class="list_detail"><strong>Country:<span class="note">*</span> </strong></td>
              <td colspan="4" class="list_detail"><select style="width:180px;" name="s_country" id="s_country" onChange="frame1.location.href='sstate2.php?coid='+this.value;"   >
                <option value="0">--SELECT COUNTRY--</option>
                <option  value='272' >Afghanistan</option><option  value='345' >Aland Islands</option><option  value='273' >Albania</option><option  value='275' >Algeria</option><option  value='276' >American Samoa</option><option  value='277' >Andorra</option><option  value='278' >Angola</option><option  value='459' >Anguilla</option><option  value='274' >Antarctica</option><option  value='279' >Antigua and Barbuda</option><option  value='281' >Argentina</option><option  value='287' >Armenia</option><option  value='424' >Aruba</option><option  value='282' >Australia</option><option  value='283' >Austria</option><option  value='280' >Azerbaijan</option><option  value='284' >Bahamas</option><option  value='285' >Bahrain</option><option  value='286' >Bangladesh</option><option  value='288' >Barbados</option><option  value='305' >Belarus</option><option  value='289' >Belgium</option><option  value='297' >Belize</option><option  value='330' >Benin</option><option  value='290' >Bermuda</option><option  value='291' >Bhutan</option><option  value='292' >Bolivia</option><option  value='293' >Bosnia and Herzegovina</option><option  value='294' >Botswana</option><option  value='295' >Bouvet Island</option><option  value='296' >Brazil</option><option  value='298' >British Indian Ocean Territory</option><option  value='300' >British Virgin Islands</option><option  value='301' >Brunei</option><option  value='302' >Bulgaria</option><option  value='510' >Burkina Faso</option><option  value='304' >Burundi</option><option  value='306' >Cambodia</option><option  value='307' >Cameroon</option><option  value='308' >Canada</option><option  value='309' >Cape Verde</option><option  value='310' >Cayman Islands</option><option  value='311' >Central African Republic</option><option  value='313' >Chad</option><option  value='314' >Chile</option><option  value='315' >China</option><option  value='317' >Christmas Island</option><option  value='318' >Cocos Islands</option><option  value='319' >Colombia</option><option  value='320' >Comoros</option><option  value='324' >Cook Islands</option><option  value='325' >Costa Rica</option><option  value='326' >Croatia</option><option  value='327' >Cuba</option><option  value='328' >Cyprus</option><option  value='329' >Czech Republic</option><option  value='323' >Democratic Republic of the Congo</option><option  value='331' >Denmark</option><option  value='350' >Djibouti</option><option  value='332' >Dominica</option><option  value='333' >Dominican Republic</option><option  value='449' >East Timor</option><option  value='334' >Ecuador</option><option  value='502' >Egypt</option><option  value='335' >El Salvador</option><option  value='336' >Equatorial Guinea</option><option  value='338' >Eritrea</option><option  value='339' >Estonia</option><option  value='337' >Ethiopia</option><option  value='341' >Falkland Islands</option><option  value='340' >Faroe Islands</option><option  value='343' >Fiji</option><option  value='344' >Finland</option><option  value='346' >France</option><option  value='347' >French Guiana</option><option  value='348' >French Polynesia</option><option  value='349' >French Southern Territories</option><option  value='351' >Gabon</option><option  value='353' >Gambia</option><option  value='352' >Georgia</option><option  value='355' >Germany</option><option  value='356' >Ghana</option><option  value='357' >Gibraltar</option><option  value='359' >Greece</option><option  value='360' >Greenland</option><option  value='361' >Grenada</option><option  value='362' >Guadeloupe</option><option  value='363' >Guam</option><option  value='364' >Guatemala</option><option  value='504' >Guernsey</option><option  value='365' >Guinea</option><option  value='448' >Guinea-Bissau</option><option  value='366' >Guyana</option><option  value='367' >Haiti</option><option  value='368' >Heard Island and McDonald Islands</option><option  value='370' >Honduras</option><option  value='371' >Hong Kong</option><option  value='372' >Hungary</option><option  value='373' >Iceland</option><option selected value='374' >India</option><option  value='375' >Indonesia</option><option  value='376' >Iran</option><option  value='377' >Iraq</option><option  value='378' >Ireland</option><option  value='506' >Isle of Man</option><option  value='379' >Israel</option><option  value='380' >Italy</option><option  value='381' >Ivory Coast</option><option  value='382' >Jamaica</option><option  value='383' >Japan</option><option  value='505' >Jersey</option><option  value='385' >Jordan</option><option  value='384' >Kazakhstan</option><option  value='386' >Kenya</option><option  value='358' >Kiribati</option><option  value='511' >Kosovo</option><option  value='389' >Kuwait</option><option  value='390' >Kyrgyzstan</option><option  value='391' >Laos</option><option  value='394' >Latvia</option><option  value='392' >Lebanon</option><option  value='393' >Lesotho</option><option  value='395' >Liberia</option><option  value='396' >Libya</option><option  value='397' >Liechtenstein</option><option  value='398' >Lithuania</option><option  value='399' >Luxembourg</option><option  value='400' >Macao</option><option  value='501' >Macedonia</option><option  value='401' >Madagascar</option><option  value='402' >Malawi</option><option  value='403' >Malaysia</option><option  value='404' >Maldives</option><option  value='405' >Mali</option><option  value='406' >Malta</option><option  value='437' >Marshall Islands</option><option  value='407' >Martinique</option><option  value='408' >Mauritania</option><option  value='409' >Mauritius</option><option  value='321' >Mayotte</option><option  value='410' >Mexico</option><option  value='436' >Micronesia</option><option  value='413' >Moldova</option><option  value='411' >Monaco</option><option  value='412' >Mongolia</option><option  value='414' >Montenegro</option><option  value='415' >Montserrat</option><option  value='416' >Morocco</option><option  value='417' >Mozambique</option><option  value='303' >Myanmar</option><option  value='419' >Namibia</option><option  value='420' >Nauru</option><option  value='421' >Nepal</option><option  value='422' >Netherlands</option><option  value='423' >Netherlands Antilles</option><option  value='425' >New Caledonia</option><option  value='427' >New Zealand</option><option  value='428' >Nicaragua</option><option  value='429' >Niger</option><option  value='430' >Nigeria</option><option  value='431' >Niue</option><option  value='432' >Norfolk Island</option><option  value='387' >North Korea</option><option  value='434' >Northern Mariana Islands</option><option  value='433' >Norway</option><option  value='418' >Oman</option><option  value='439' >Pakistan</option><option  value='438' >Palau</option><option  value='354' >Palestinian Territory</option><option  value='440' >Panama</option><option  value='441' >Papua New Guinea</option><option  value='442' >Paraguay</option><option  value='443' >Peru</option><option  value='444' >Philippines</option><option  value='445' >Pitcairn</option><option  value='446' >Poland</option><option  value='447' >Portugal</option><option  value='450' >Puerto Rico</option><option  value='451' >Qatar</option><option  value='322' >Republic of the Congo</option><option  value='452' >Reunion</option><option  value='453' >Romania</option><option  value='454' >Russia</option><option  value='455' >Rwanda</option><option  value='456' >Saint Barth�lemy</option><option  value='457' >Saint Helena</option><option  value='458' >Saint Kitts and Nevis</option><option  value='460' >Saint Lucia</option><option  value='461' >Saint Martin</option><option  value='462' >Saint Pierre and Miquelon</option><option  value='463' >Saint Vincent and the Grenadines</option><option  value='516' >Samoa</option><option  value='464' >San Marino</option><option  value='465' >Sao Tome and Principe</option><option  value='466' >Saudi Arabia</option><option  value='467' >Senegal</option><option  value='468' >Serbia</option><option  value='518' >Serbia and Montenegro</option><option  value='469' >Seychelles</option><option  value='470' >Sierra Leone</option><option  value='471' >Singapore</option><option  value='472' >Slovakia</option><option  value='474' >Slovenia</option><option  value='299' >Solomon Islands</option><option  value='475' >Somalia</option><option  value='476' >South Africa</option><option  value='342' >South Georgia and the South Sandwich Islands</option><option  value='388' >South Korea</option><option  value='478' >Spain</option><option  value='312' >Sri Lanka</option><option  value='480' >Sudan</option><option  value='481' >Suriname</option><option  value='482' >Svalbard and Jan Mayen</option><option  value='483' >Swaziland</option><option  value='484' >Sweden</option><option  value='485' >Switzerland</option><option  value='486' >Syria</option><option  value='316' >Taiwan</option><option  value='487' >Tajikistan</option><option  value='507' >Tanzania</option><option  value='488' >Thailand</option><option  value='489' >Togo</option><option  value='490' >Tokelau</option><option  value='491' >Tonga</option><option  value='492' >Trinidad and Tobago</option><option  value='494' >Tunisia</option><option  value='495' >Turkey</option><option  value='496' >Turkmenistan</option><option  value='497' >Turks and Caicos Islands</option><option  value='498' >Tuvalu</option><option  value='509' >U.S. Virgin Islands</option><option  value='499' >Uganda</option><option  value='500' >Ukraine</option><option  value='493' >United Arab Emirates</option><option  value='503' >United Kingdom</option><option  value='508' >United States</option><option  value='435' >United States Minor Outlying Islands</option><option  value='512' >Uruguay</option><option  value='513' >Uzbekistan</option><option  value='426' >Vanuatu</option><option  value='369' >Vatican</option><option  value='514' >Venezuela</option><option  value='473' >Vietnam</option><option  value='515' >Wallis and Futuna</option><option  value='479' >Western Sahara</option><option  value='517' >Yemen</option><option  value='519' >Zambia</option><option  value='477' >Zimbabwe</option>              </select><label id="com_t">&nbsp; </label></td>
            </tr>
            
            <tr>
          
              <td colspan="5" valign="top" class="list_detail">
              
              <div id="one" style="width:100%; height:auto;">	
             <table width="100%" border="0" cellpadding="0" cellspacing="0">
             	<tr>
                	<td width="12%">
              <strong>State:<span class="note">*</span></strong> </td>
              
              <td width="27%">
                   <div id="divstate">
                <select style="width:180px;" name="s_state" id="s_state" onChange="frame2.location.href='scity2.php?cid='+this.value;"  >
                  <option value="0">--SELECT STATE--</option>
                  <option  value='109' >Bomby</option><option  value='111' >Gujarat</option><option  value='132' >Maharashtra</option><option  value='128' >tama</option><option  value='127' >Tamil Nadu</option>                  </select><label id="d_t">&nbsp; </label>
                  					
                </div>               
                	</td>
             		 <td width="61%"> <div id="addnew"  style=" ; width:250px; cursor:pointer" ><b>  Add New State </b></div></td>
                    </tr>
                </table>
                </div>
                 
                  <div id="onee" style="background-color:#FFFFFF; width:100%; height:auto; font-size:12px; display:none">
                 <table width="100%" border="0" cellpadding="0" cellspacing="0">
                	<tr>
                    	<td width="90%"> 
                  <label id="res" style="font-size:15px"> </label>
                 		</td>
                        <td id="cancle" valign="top" align="right" style="cursor:pointer">
                        	<b> Cancle </b>
                        </td>
                    </tr>
                 </table>
                 </div>
                 	
                </td>
             	
              </tr>
          
        </div>
          
            <tr>
              <td colspan="5" valign="top" class="list_detail">
              
               <div id="two" style="width:100%; height:auto;">
               <table width="100%" border="0" cellpadding="0" cellspacing="0">
             	<tr>
                	<td width="12%">
              <strong>City:<span class="note">*</span></strong> </td>
              
              <td width="27%">
                   <div id="divstate">
                <div id="divcity" style="width:180px">
                <select style="width:180px;" name="s_city" id="s_city"   >
                  <option value="0">--SELECT CITY--</option>
                </select>
                <label id="ss_t">&nbsp; </label>
                
              </div>
                  					
                </div>               
                	</td>
             		 <td width="61%"><div id="addnew2"  ><b> Add New City </b></div></td>
                    </tr>
                </table>
              
              
              </div>
              
               <div id="twoo" style="background-color:#FFFFFF; width:100%; height:auto; font-size:12px; display:none">
               <table width="100%" border="0" cellpadding="0" cellspacing="0">
                	<tr>
                    	<td width="60%"> 
             			     <label id="ress"> </label>
                 		</td>
                        <td id="canclet" valign="top" align="left" style="cursor:pointer">
                        	<b> Cancle </b>
                        </td>
                    </tr>
                 </table>
               </div>
              
              
              
              </td>
              </tr>
       
            <tr>
              <td valign="top" class="list_detail"><strong>Zip Code:<span class="note">*</span></strong></td>
              <td colspan="2" class="list_detail"><input name="zip" type="text"   id="zip" size="18">   <label id="fine_t">&nbsp; </label>             </td>
              <td width="56%" class="list_detail">&nbsp;</td>
              <td class="list_detail">&nbsp;</td>
            </tr>
            <tr>
              <td valign="top" class="list_detail"><strong>Address 1:<span class="note">*</span></strong></td>
              <td colspan="4" class="list_detail"><input name="add1" type="text"   id="add1" size="50"><label id="high_t">&nbsp; </label>   </td>
            </tr>
            <tr>
              <td valign="top" class="list_detail"><strong>Address 2:</strong></td>
              <td colspan="4" class="list_detail"><input name="add2" type="text"   id="add2" size="50"></td>
            </tr>
            <tr>
              <td valign="top" class="list_detail"><strong>Categories<span class="note">*</span></strong></td>
              <td colspan="4" class="list_detail">                  <input id="categoryid" type="checkbox"   name="categoryid[]" value="55"  />
                Automobiles<br />
                                    <input id="categoryid" type="checkbox"   name="categoryid[]" value="53"  />
                Hotels<br />
                                    <input id="categoryid" type="checkbox"   name="categoryid[]" value="52"  />
                Restaurant<br />
                                    <input id="categoryid" type="checkbox"   name="categoryid[]" value="54"  />
                Pedicure<br />
                                    <input id="categoryid" type="checkbox"   name="categoryid[]" value="51"  />
                Spa<br />
                                </td>
            </tr>
            <tr>
              <td colspan="5" class="list_heading" align="left">Company Details</td>
            </tr>
            <tr>
              <td class="list_detail"><strong>Email <span class="note">*</span></strong></td>
              <td colspan="4" class="list_detail"><input type="text" name="email" id="email"   /><label id="s_t">&nbsp; </label></td>
            </tr>
            <tr>
              <td class="list_detail"><strong>Password <span class="note">*</span></strong></td>
              <td colspan="4" class="list_detail"><input type="password" name="password" id="password"   /><label id="e_t">&nbsp; </label></td>
            </tr>
            <tr>
              <td class="list_detail"><strong>Contact Name <span class="note">*</span></strong></td>
              <td colspan="4" class="list_detail"><input name="company_contactname" type="text" id="company_contactname" size="50" maxlength="50"  ><label id="ex_t">&nbsp; </label></td>
            </tr>
            <tr>
              <td width="12%" class="list_detail"><strong>Company Name<span class="note">*</span></strong></td>
              <td colspan="4" class="list_detail"><input name="company_name" type="text" id="company_name" value="" size="50" maxlength="50"  ><label id="m_t">&nbsp; </label></td>
            </tr>
            <tr>
              <td class="list_detail"><strong>Live Url</strong></td>
              <td colspan="4" class="list_detail"><input name="url" type="text" id="url" value="" size="50" maxlength="200"  ></td>
            </tr>
            <!--<tr>
            
              <td class="list_detail"><strong>Map Url<span class="note">*</span></strong></td>
              <td class="list_detail"><input name="map_url" type="text" id="map_url" value="" size="50" maxlength="200"></td>
            </tr> -->
            <tr>
              <td class="list_detail"><strong>Telephone No.</strong></td>
              <td colspan="4" class="list_detail"><input name="tel_no" type="text" id="tel_no" value="" size="50" maxlength="20"  ></td>
            </tr>
            <tr>
              <td class="list_detail"><strong>Fax No.</strong></td>
              <td colspan="4" class="list_detail"><input name="fax_no" type="text" id="fax_no" value="" size="50" maxlength="20"  ></td>
            </tr>
            <tr>
              <td class="list_detail"><strong>About Company<span class="note">*</span></strong></td>
              <td colspan="4" class="list_detail"><textarea name="about" cols="40" rows="10" id="about" >Not Available</textarea><label id="mz_t">&nbsp; </label></td>
            </tr>
            <tr>
              <td class="list_detail"><strong> Remarks</strong></td>
              <td colspan="4" class="list_detail"><textarea name="groupon_remarks" cols="40" rows="10" id="groupon_remarks"  ></textarea></td>
            </tr>
            <tr>
              <td colspan="5" class="list_detail"><input type="submit" name="btn_deal" value="Submit" id="btn_deal"  ></td>
            </tr>
          </table>
        </form></td>
      </tr>
      <tr>
        <td colspan="2" align="center">&nbsp;</td>
      </tr>
    </table>
    </td>
  </tr>
  <tr> 
    <td height="1" valign="bottom"> 
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
