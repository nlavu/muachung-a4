<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddNewDeal.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn.Admin.AddNewDeal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/ui.css" rel="stylesheet" type="text/css" />
    <p>
        <asp:SiteMapPath runat="server">
        </asp:SiteMapPath>
    </p>
<style>
.error
{
	color:red;
}
</style>

<script type="text/javascript" src="js/datetimepicker_css.js"></script>
<script type="text/javascript" src="js/tiny_mce.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>	
<script type="text/javascript" src="js/jquery.validate.js"></script>

<script type="text/javascript" src="js/editor_plugin.js"></script>
<script type="text/javascript" src="js/editor_template.js"></script>

<script type="text/javascript">
    var xmlhttp
    function update_company(str) {
        xmlhttp = GetXmlHttpObject();
        if (xmlhttp == null) {
            alert("Your browser does not support XMLHTTP!");
            return;
        }
        var url = "getCompany.php";
        url = url + "?id=" + str;
        url = url + "&sid=" + Math.random();
        xmlhttp.onreadystatechange = stateChanged;
        xmlhttp.open("GET", url, true);
        xmlhttp.send(null);
    }

    function stateChanged() {
        if (xmlhttp.readyState == 4) {
            //alert("asd"+xmlhttp.responseText);
            document.getElementById("companyid1").innerHTML = xmlhttp.responseText;
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

    function cal_commission1() {
        cv = parseFloat((document.getElementById("commission_percentage").value / 100) * document.getElementById("price").value).toFixed(2);
        document.getElementById("commission_amount").value = cv;
        //alert(document.getElementById('webamount').innerHTML);
        document.getElementById('webamount').innerHTML = cv;
        document.getElementById('meramount').innerHTML = parseFloat(document.getElementById('price').value - cv).toFixed(2);
        document.getElementById('pwa').innerHTML = document.getElementById("commission_percentage").value;
        document.getElementById('pma').innerHTML = 100 - document.getElementById("commission_percentage").value;


        //old_1=document.getElementById("commission_amount").value;
    }
    function cal_commission1aa() {
        document.getElementById("commission_amount").value = parseFloat((document.getElementById("commission_percentage").value / 100) * document.getElementById("price").value).toFixed(2);
        old_1 = document.getElementById("commission_amount").value;
    } function cal_commission1aa() {
        document.getElementById("commission_amount").value = parseFloat((document.getElementById("commission_percentage").value / 100) * document.getElementById("price").value).toFixed(2);
        old_1 = document.getElementById("commission_amount").value;
    }

    //=================================== Jquery Valdiation 

    $(document).ready(function () {

        $("#btn_deal").click(function () {
            //alert("ASDFAS");


            bool = true;
            msg = "";

            if ($("#categoryid").val() == 0) {
                //msg+="Deal Title is Manadatory\n";
                $("#categoryiderr").html("<br><font color='red'>Deal Category is Manadatory</font>");
                bool = false;
            }
            if ($("#deal_title").val() == "") {
                //msg+="Deal Title is Manadatory\n";
                $("#d_t").html("<br><font color='red'>Deal Title is Manadatory</font>");
                bool = false;
            }

            if ($("#short_deal").val() == "") {
                $("#ss_t").html("<br><font color='red'>Short Title is Manadatory</font>");
                bool = false;
            }

            if ($("#start_time").val() == "") {
                $("#s_t").html("<br><font color='red'>Start Time is Manadatory</font>");
                bool = false;
            }
            if ($('input[id=chkcity]:checked').size() == 0) {
                $("#cc_t").html("<br><font color='red'>Location is Manadatory</font>");

                bool = false;
            }
            /*	if($("#companyid1").html())
            {
            alert("please select adress");
            bool=false;	
            }*/

            if ($("#end_time").val() == "") {
                $("#e_t").html("<br><font color='red'>End Time is Manadatory</font>");
                bool = false;
            }

            if ($("#min_orders").val() == "") {
                $("#m_t").html("<br><font color='red'>Min Orders is Manadatory</font>");
                bool = false;

            }

            if ($("#max_orders").val() == "") {
                $("#mz_t").html("<br><font color='red'>Max Orders is Manadatory</font>");
                bool = false;
            }

            if ($("#per_user_max_orders").val() == "") {
                $("#p_t").html("<br><font color='red'>Max Orders Per User Orders is Manadatory</font>");
                bool = false;
            }

            if ($("#purchases").val() == "") {
                $("#pu_t").html("<br><font color='red'>Original Price is Manadatory</font>");
                bool = false;
            }

            if ($("#discount").val() == "") {
                $("#dis_t").html("<br><font color='red'>Discount is Manadatory</font>");
                bool = false;
            }

            if ($("#expire_date").val() == "") {
                $("#ex_t").html("<br><font color='red'>End Time is Manadatory</font>");
                bool = false;
            }

            if ($("#fineprints").val() == "") {

                $("#fine_t").html("<br><font color='red'>Fineprint is Manadatory</font>");
                bool = false;
            }
            if ($("#highlights").val() == "") {
                $("#high_t").html("<br><font color='red'>highlights is Manadatory</font>");
                bool = false;
            }

            if ($("#companyid").val() == 0) {
                $("#com_t").html("<br><font color='red'>Select Company</font>");
                bool = false;
            }

            if (!bool) {
                alert("There are some errors");
                return false;
            }
            else
                return true;


        });
        $("#deal_title").focus(function () {
            $("#d_t").html("");
        });
        $("#deal_title").blur(function () {

            if ($("#deal_title").val() == "")
                $("#d_t").html("<br><font color='red'>Deal Title is Manadatory</font>");

        });



        $("#short_deal").focus(function () {
            $("#ss_t").html("");
        });
        $("#short_deal").blur(function () {

            if ($("#short_deal").val() == "")
                $("#ss_t").html("<br><font color='red'>Short Title is Manadatory</font>");

        });




        $("#fineprints").focus(function () {
            $("#fine_t").html("");
        });
        $("#fineprints").blur(function () {

            if ($("#fineprints").val() == "")
                $("#fine_t").html("<br><font color='red'>Fineprint is Manadatory</font>");

        });



        $("#highlights").focus(function () {
            $("#high_t").html("");
        });
        $("#highlights").blur(function () {

            if ($("#highlights").val() == "")
                $("#high_t").html("<br><font color='red'>Fineprint is Manadatory</font>");

        });



        $("#highlights").focus(function () {
            $("#high_t").html("");
        });
        $("#highlights").blur(function () {

            if ($("#highlights").val() == "")
                $("#high_t").html("<br><font color='red'>Fineprint is Manadatory</font>");

        });



        $("#start_time").focus(function () {
            $("#s_t").html("");
        });
        $("#start_time").blur(function () {

            if ($("#start_time").val() == "")
                $("#s_t").html("<br><font color='red'>Start Time is Manadatory</font>");

        });


        $("#end_time").focus(function () {
            $("#e_t").html("");
        });
        $("#end_time").blur(function () {

            if ($("#end_time").val() == "")
                $("#e_t").html("<br><font color='red'>End Time is Manadatory</font>");

        });


        $("#expire_date").focus(function () {
            $("#ex_t").html("");
        });
        $("#expire_date").blur(function () {

            if ($("#expire_date").val() == "")
                $("#ex_t").html("<br><font color='red'>expire Date is Manadatory</font>");

        });



        $("#min_orders").focus(function () {
            $("#m_t").html("");
        });
        $("#min_orders").blur(function () {

            if ($("#min_orders").val() == "")
                $("#m_t").html("<br><font color='red'>Min Orders is Manadatory</font>");

        });


        $("#max_orders").focus(function () {
            $("#mz_t").html("");
        });
        $("#max_orders").blur(function () {

            if ($("#min_orders").val() == "")
                $("#mz_t").html("<br><font color='red'>Max Orders is Manadatory</font>");

        });



        $("#per_user_max_orders").focus(function () {
            $("#p_t").html("");
        });
        $("#per_user_max_orders").blur(function () {

            if ($("#per_user_max_orders").val() == "")
                $("#p_t").html("<br><font color='red'>Max Orders Per User Orders is Manadatory</font>");

        });


        $("#purchases").focus(function () {
            $("#pu_t").html("");
        });
        $("#purchases").blur(function () {

            if ($("#purchases").val() == "") {
                $("#pu_t").html("<br><font color='red'>Original Price is Manadatory</font>");

            }


        });




        $("#discount").focus(function () {
            $("#dis_t").html("");
        });
        $("#discount").blur(function () {

            if ($("#discount").val() == "") {
                $("#dis_t").html("<br><font color='red'>Discount is Manadatory</font>");

            }


        });


        $("#companyid").change(function () {
            if ($("#companyid").val() == 0)
                $("#com_t").html("<br><font color='red'>Select Company</font>");
            else
                $("#com_t").html("");
        });




    });


    //==================================
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
        content_css: "css/content.css",
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
        content_css: "css/content.css",
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
        content_css: "css/content.css",
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
        content_css: "css/content.css",
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
        content_css: "css/content.css",
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
        <form action="deals_add_do.php" method="post" enctype="multipart/form-data" name="frmAdd" id="frmAdd" onSubmit="return validatee()">
          <input type="hidden" name="id" value="" />
         <h1 align="left">Deal Add</h1> 
          <table width="100%" border="0" cellpadding="0" cellspacing="1" class="list">
         
            <tr>
              <td width="17%" class="list_detail"><strong>Deal Category<span class="note">*</span></strong></td>
              <td colspan="3" class="list_detail"><select name="categoryid" onChange="update_company(this.value)" id="categoryid">
                  <option value="0"> All </option>
				  
				                    <option value="55" >Automobiles</option>
                                    <option value="53" >Hotels</option>
                                    <option value="52" >Restaurant</option>
                                    <option value="54" >Pedicure</option>
                                    <option value="51" >Spa</option>
                                  </select>     <label id="categoryiderr"></label>       </td>
          </tr>
            <tr>
              <td class="list_detail"><strong>Company <span class="note">*</span></strong></td>
              <td colspan="3" class="list_detail">
              <span id="companyid1">
              <select id="companyid" name="companyid" onChange="frame1.location.href='deal_load_cities.php?id='+this.value;" >
                  <option value="0">--SELECT COMPANY--</option>
                                    <option value="95">Nashik Automobiles</option>
                                    <option value="96">ABC Spa Ltd</option>
                                    <option value="97">sdfsdfsdfg</option>
                                    <option value="94">EGB Systems</option>
                                    <option value="100">YhDYgcDaeMj</option>
                                    <option value="101">zKuJgvFcobYgxxjB</option>
                                    <option value="98">Long chim</option>
                                    <option value="99">am test</option>
                                    <option value="93">IT</option>
                                  </select>  
                </span>
                
               <label id="com_t">&nbsp; </label> 
                            </td>
            </tr>
            <tr>
              <td class="list_detail"><strong>Location <span class="note">*</span></strong></td>
              <td colspan="3" class="list_detail"><div id="divCity" name="divCity"></div><label id="cc_t">&nbsp; </label>
              
              </td>
            </tr>
            <tr>
              <td class="list_detail"><strong>Deal Title<span class="note">*</span></strong></td>
              <td colspan="3" class="list_detail"><input name="deal_title" type="text" id="deal_title"  size="100" maxlength="255"><label id="d_t">&nbsp; </label> </font></td>
            </tr>
            <tr style="">
              <td class="list_detail"><strong>Short Title<span class="note">*</span></strong></td>
              <td colspan="3" class="list_detail"><input name="short_deal" type="text" id="short_deal" size="27"><label id="ss_t">&nbsp; </label></td>
            </tr>
            <tr style="">
              <td class="list_detail"><strong>Meta Keyword </strong></td>
              <td colspan="3" class="list_detail"><input name="meta_keyword" type="text" id="meta_keyword" size="27"></td>
            </tr>
            <tr style="">
              <td class="list_detail"><strong>Meta Description </strong></td>
              <td colspan="3" class="list_detail"><input name="meta_desc" type="text" id="meta_desc" size="27"></td>
            </tr>
            <tr style="">
              <td class="list_detail"><strong>You Tube Link</strong></td>
              <td colspan="3" class="list_detail"><input name="youtube" type="text" id="youtube" size="27" /></td>
            </tr>
            <tr style="">
              <td class="list_detail"><strong>Deal Area <span class="note">*</span></strong></td>
              <td colspan="3" class="list_detail">                  <input type="checkbox" name="area[]"  id="area"   checked value="22" />
                  chennai<br>
                                    <input type="checkbox" name="area[]"  id="area"    value="24" />
                  Dallas<br>
                                    <input type="checkbox" name="area[]"  id="area"    value="25" />
                  Maharashtra<br>
                                    <input type="checkbox" name="area[]"  id="area"    value="21" />
                  New York<br>
                                    <input type="checkbox" name="area[]"  id="area"    value="23" />
                  Vadapalani<br>
                                </td>
            </tr>
            <tr>
              <td class="list_detail"><strong>Deals <span class="note">*</span></strong></td>
              <td colspan="3" class="list_detail"><label>
              <select name="ismain" id="ismain">
                <option value="1">Main Deal</option>
                <option value="2">Side Deal</option>
              </select>
              </label></td>
            </tr>
            <tr>
              <td class="list_detail"><strong>Deal Description</strong></td>
              <td colspan="3" class="list_detail"><div>
                <textarea name="deal_description" id="deal_description" value="" cols="98" rows="20" >Not available.</textarea>
              </div></td>
            </tr>
            <tr>
              <td class="list_detail"><strong>Deal Image</strong></td>
              <td colspan="3" class="list_detail"><p>
                  <input type="file" name="image"  id="image">
                </p>                  </td>
            </tr>
            <tr>
              <td class="list_detail"><strong>Fine Prints / Highlights</strong></td>
              <td colspan="3" class="list_detail"><table>
                  <tr>
                    <td align="center"><strong>FINE PRINTS</strong></td>
                    <td>&nbsp;</td>
                    <td align="center"><strong>HIGHTLIGHTS</strong></td>
                  </tr>
                  <tr>
                    <td><textarea name="fineprints" cols="30" rows="6" wrap="off" class="mceNoEditor" id="fineprints"></textarea>     <label id="fine_t">&nbsp; </label>               </td>
                    <td>&nbsp;</td>
                    <td><textarea name="highlights" cols="30" rows="6" wrap="off" class="mceNoEditor" id="highlights"></textarea>      <label id="high_t">&nbsp; </label>              </td>
                  </tr>
                </table>
                  <div style="width:400px; padding:10px; background-color:#FFFFEE;"> Please enter each fineprint or highlight in new line.</div></td>
            </tr>
            <tr>
              <td class="list_detail"><strong>Start Time<span class="note">*</span></strong></td>
              <td colspan="3" class="list_detail">
              <a href="javascript:NewCssCal('start_time','yyyymmdd','dropdown',true,24,false)"> <input type="Text" id="start_time" name="start_time" maxlength="25" size="25" readonly> 
               <!--<a href="javascript:NewCssCal('start_time','yyyymmdd','dropdown',true,24,false)">--> <img src="images/cal.gif" width="16" height="16" alt="Pick a date"></a>
              <label id="s_t"> <span style="font-size:11px;"> Current Time   On Server = <strong>
                Sunday 8th of April 2012 02:09:03 AM </strong> </span>
              </label></td>
            </tr>
            <tr>
              <td class="list_detail"><strong>End Time<span class="note">*</span></strong></td>
              <td colspan="3" class="list_detail">
              <a href="javascript:NewCssCal('end_time','yyyymmdd','dropdown',true,24,false)"><input type="text" id="end_time" name="end_time" maxlength="25" size="25" readonly>
                <!--<a href="javascript:NewCssCal('end_time','yyyymmdd','dropdown',true,24,false)"> --><img src="images/cal.gif" width="16" height="16" alt="Pick a date"></a><label id="e_t">&nbsp; </label></td>
            </tr>
            <tr>
              <td class="list_detail"><strong>Expire Date<span class="note">*</span></strong></td>
              <td colspan="3" class="list_detail"><a href="javascript:NewCssCal('expire_date','yyyymmdd','dropdown',true,24,false)"> <input type="Text" id="expire_date" name="expire_date" maxlength="25" size="25" readonly>
                <!--<a href="javascript:NewCssCal('expire_date','yyyymmdd','dropdown',true,24,false)">--> <img src="images/cal.gif" width="16" height="16" alt="Pick a date"></a><label id="ex_t">&nbsp; </label></td>
            </tr>
            <tr>
              <td class="list_detail"><strong>Min Orders<span class="note">*</span></strong></td>
              <td colspan="3" class="list_detail"><input name="min_orders" type="text" id="min_orders" size="10" maxlength="10"><label id="m_t">&nbsp; </label></td>
            </tr>
            <tr>
              <td class="list_detail"><strong>Max Orders<span class="note">*</span></strong></td>
              <td colspan="3" class="list_detail"><input name="max_orders" type="text" id="max_orders" size="10" maxlength="10"><label id="mz_t">&nbsp; </label></td>
            </tr>
            <tr>
              <td class="list_detail"><strong>Max Orders Per User<span class="note">*</span></strong></td>
              <td colspan="3" class="list_detail"><input name="per_user_max_orders" type="text" id="per_user_max_orders" size="10" maxlength="10"><label id="p_t">&nbsp; </label></td>
            </tr>
            <tr>
              <td class="list_detail"><strong>Original Price<span class="note">*</span></strong></td>
              <td width="30%" class="list_detail"><input name="purchases" type="text" id="purchases" size="10" maxlength="10" onKeyUp="calculate_price();">
                Rs<label id="pu_t">&nbsp; </label></td>
              <td width="37%" rowspan="5" class="list_detail"><p>Amount per sell = <strong> Rs<span id="sellamount">0.00</span></strong></p>
              <p>You will earn (<span id="pwa">0</span>%) = <strong> Rs<span id="webamount">0.00 </span> </strong></p>
                <p>Merchant wil earn (<span id="pma">0</span>%) = <strong>Rs<span id="meramount">0.00 </span></strong> </p>
                <p>Affiliate will earn <strong>Rs<span id="affamount">5 </span></strong></p></td>
              <td width="16%" class="list_detail">&nbsp;</td>
            </tr>
            <script type="text/javascript">
                function calculate_price() {
                    purchase = document.getElementById('purchases').value;
                    discount = document.getElementById('discount').value;
                    //parseFloat((document.getElementById("commission_percentage").value/100)*document.getElementById("price").value).toFixed(2);
                    v = parseFloat(purchase - purchase * discount / 100).toFixed(2);
                    document.getElementById("price").value = v;
                    document.getElementById('sellamount').innerHTML = v;
                }
            </script>
            <tr>
              <td class="list_detail"><strong>Discount<span class="note">*</span></strong></td>
              <td class="list_detail"><input name="discount" type="text" id="discount" size="10" maxlength="10" onKeyUp="calculate_price();">
                %<label id="dis_t">&nbsp; </label></td>
              <td class="list_detail">&nbsp;</td>
            </tr>
            <tr>
              <td class="list_detail"><strong>Price<span class="note">*</span></strong></td>
              <td class="list_detail"><input name="price" type="text" id="price" size="10" maxlength="10" readonly>
                Rs</td>
              <td class="list_detail">&nbsp;</td>
            </tr>
            <tr>
              <td class="list_detail">Commision Percentage:</td>
              <td class="list_detail"><input name="commission_percentage" type="text" id="commission_percentage" size="10" maxlength="10" value="0" onKeyUp="cal_commission1();"  >
                %</td>
              <td class="list_detail">&nbsp;</td>
            </tr>
            <tr>
              <td class="list_detail">Commision Amount:</td>
              <td class="list_detail"><input name="commission_amount" type="text" id="commission_amount" size="10" maxlength="10" value="0" onKeyUp="cal_commission2();"  readonly>
                Rs</td>
              <td class="list_detail">&nbsp;</td>
            </tr>
            <tr>
              <td class="list_detail"><strong>Deal Status<span class="note">*</span></strong></td>
              <td colspan="3" class="list_detail"><label for="dealactive"></label>
                <select name="statuss" id="statuss">
<option value="0">Deactive</option>
<option value="1">Active</option>
                </select></td>
            </tr>
            <tr>
              <td class="list_detail"><strong>Accept Affiliate<span class="note">*</span></strong></td>
              <td colspan="3" class="list_detail"><select name="affiliate" id="affiliate">
                <option value="1">Yes</option>
                <option value="0">No</option>
              </select></td>
            </tr>
            <tr>
              <td colspan="4" class="list_detail"><input type="submit" name="btn_deal" value="Submit" id="btn_deal"></td>
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
  
</table>
</asp:Content>
