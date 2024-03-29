﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegisterForm.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn.Account.RegisterForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <p>
        <asp:SiteMapPath runat="server">
        </asp:SiteMapPath>
    </p>
<link rel="stylesheet" type="text/css" href="../css/register/style.css" media="all" />	
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.6/jquery-ui.min.js"></script>
    <script type="text/javascript" src="../js/register/jquery.inputfocus-0.9.min.js"></script>
    <script type="text/javascript" src="../js/register/jquery.main.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="register">
        <form action="#" method="post">	
            <!-- #first_step -->
            <div id="first_step">
                <h1>SIGN UP FOR A FREE <span>A4 GROUPON</span> ACCOUNT</h1>

                <div class="form">
                    <input type="text" name="username" id="username" value="username" />
                    <label for="username">At least 4 characters. Uppercase letters, lowercase letters and numbers only.</label>
                    
                    <input type="password" name="password" id="password" value="password" />
                    <label for="password">At least 4 characters. Use a mix of upper and lowercase for a strong password.</label>
                    
                    <input type="password" name="cpassword" id="cpassword" value="password" />
                    <label for="cpassword">If your passwords aren’t equal, you won’t be able to continue with signup.</label>
                </div>      <!-- clearfix --><div class="clear"></div><!-- /clearfix -->
                <input class="submit" type="submit" name="submit_first" id="submit_first" value="" />
            </div>      <!-- clearfix --><div class="clear"></div><!-- /clearfix -->


            <!-- #second_step -->
            <div id="second_step">
                <h1>SIGN UP FOR A FREE <span>A4 GROUPON</span> ACCOUNT</h1>

                <div class="form">
                    <input type="text" name="firstname" id="firstname" value="first name" />
                    <label for="firstname">Your First Name. </label>
                    <input type="text" name="lastname" id="lastname" value="last name" />
                    <label for="lastname">Your Last Name. </label>
                    <input type="text" name="email" id="email" value="email address" />
                    <label for="email">Your email address. We send important administration notices to this address. </label>                    
                </div>      <!-- clearfix --><div class="clear"></div><!-- /clearfix -->
                <input class="submit" type="submit" name="submit_second" id="submit_second" value="" />
            </div>      <!-- clearfix --><div class="clear"></div><!-- /clearfix -->


            <!-- #third_step -->
            <div id="third_step">
                <h1>SIGN UP FOR A FREE <span>A4 GROUPON</span> ACCOUNT</h1>

                <div class="form">
                    <select id="age" name="age">
                        <option> 0 - 17</option>
                        <option>18 - 25</option>
                        <option>26 - 40</option>
                        <option>40+</option>
                    </select>
                    <label for="age">Your age range. </label> <!-- clearfix --><div class="clear"></div><!-- /clearfix -->

                    <select id="gender" name="gender">
                        <option>Male</option>
                        <option>Female</option>
                    </select>
                    <label for="gender">Your Gender. </label> <!-- clearfix --><div class="clear"></div><!-- /clearfix -->
                    
                    <select id="country" name="country">
                        <option>Việt Nam</option>
                        <option>United Kingdom</option>
                        <option>Canada</option>
                        <option>Serbia</option>
                        <option>Italy</option>
                    </select>
                    <label for="country">Your country. </label> <!-- clearfix --><div class="clear"></div><!-- /clearfix -->
                    
                </div>      <!-- clearfix --><div class="clear"></div><!-- /clearfix -->
                <input class="submit" type="submit" name="submit_third" id="submit_third" value="" />
                
            </div>      <!-- clearfix --><div class="clear"></div><!-- /clearfix -->
            
            
            <!-- #fourth_step -->
            <div id="fourth_step">
                <h1>SIGN UP FOR A FREE <span>A4 GROUPON</span> ACCOUNT</h1>

                <div class="form">
                    <h2>Summary</h2>
                    
                    <table>
                        <tr><td>Username</td><td></td></tr>
                        <tr><td>Password</td><td></td></tr>
                        <tr><td>Email</td><td></td></tr>
                        <tr><td>Name</td><td></td></tr>
                        <tr><td>Age</td><td></td></tr>
                        <tr><td>Gender</td><td></td></tr>
                        <tr><td>Country</td><td></td></tr>
                    </table>
                </div>      <!-- clearfix --><div class="clear"></div><!-- /clearfix -->
                <input class="send submit" type="submit" name="submit_fourth" id="submit_fourth" value="" />            
            </div>
            
        </form>
	</div>
	<div id="progress_bar">
        <div id="progress"></div>
        <div id="progress_text">0% Complete</div>
	</div>
</asp:Content>
