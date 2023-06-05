<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="QuadaceGamestore.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Styles/Login.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height:10vh"></div>
        <div class="topheader">
            <div class="header">
                <div><img alt="" src="https://i.imgur.com/mMYeIMf.png" width=300" height="75"></div>
                <div class="header_center">
                    <div class="hc_up">
			            </div>
                </div>
                <div class="right_navigator">
				    <ul>
					    <li><a href=""><i class="fa fa-user"></i> Account</a></li>
					    <li><a href=""><i class="fa fa-shopping-cart"></i> Cart</a></li>
					    <li><a href="login.aspx" class="active"><i class="fa fa-lock"></i> Login</a></li>
				    </ul>
			    </div>
            </div>
        </div> 
        <div class="main_menu">
        </div>
    <div class="blank">
        <div class="box">
            <div class="left">
                <div class="small">
                    <table>
                        <tr>
                            <h2 class="title">Login to your account</h2>
                        </tr>
                        <tr>
                            <asp:TextBox class="textbox" ID="login_email" placeholder=" Email Address" runat="server"></asp:TextBox>
                        </tr>
                    </table>
                    <div style="height: 2vh">
                    </div>
                    <table>
                        <tr>
                            <asp:TextBox class="textbox" TextMode="Password" ID="login_pass" placeholder=" Password" runat="server"></asp:TextBox>
                        </tr>
                    </table>
                    <div style="height: 2vh">
                    </div>
                    <div>
                        <asp:Button class="button" ID="Button_Login" Text="Login" runat="server" OnClick="ButtonLogin_Click" />
                        <asp:Label ID="lblStatus" ForeColor="Red" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="centerblank">
                <div class="or">OR</div>
            </div>
            <div class="right">
                <div class="small">
                    <table>
                        <tr>
                            <h2 class="title">New User Signup!</h2>
                        </tr>
                        <tr>
                            <asp:TextBox class="textbox" ID="reg_username" ValidationGroup="RegisterFrame" placeholder=" Username" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="RegisterFrame" runat="server" ControlToValidate="reg_username" ErrorMessage=" *" ForeColor="Red"></asp:RequiredFieldValidator>  
                        </tr>
                    </table>
                    <div style="height: 2vh">
                    </div>
                    <table>
                        <tr>
                            <asp:TextBox class="textbox" TextMode="Email" ID="reg_email" ValidationGroup="RegisterFrame" placeholder=" Email Address" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="RegisterFrame" runat="server" ControlToValidate="reg_email" ErrorMessage=" *" ForeColor="Red"></asp:RequiredFieldValidator> 
                        </tr>
                    </table>
                    <div style="height: 2vh">
                    </div>
                    <table>
                        <tr>
                            <asp:TextBox class="textbox" ID="reg_pass" ValidationGroup="RegisterFrame" TextMode="Password" placeholder=" Password" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="RegisterFrame" runat="server" ControlToValidate="reg_pass" ErrorMessage=" *" ForeColor="Red"></asp:RequiredFieldValidator> 
                        </tr>
                    </table>
                    <div style="height: 2vh">
                    </div>
                    <table>
                        <tr>
                            <asp:TextBox class="textbox" TextMode="Password" ID="reg_pass2"  ValidationGroup="RegisterFrame" placeholder=" Confirm Password" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="RegisterFrame" runat="server" ControlToValidate="reg_pass2" ErrorMessage=" *" ForeColor="Red"></asp:RequiredFieldValidator> 
                        </tr>
                    </table>
                    <div style="height: 5vh">
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="reg_pass" ControlToValidate="reg_pass2" Display="Dynamic" ErrorMessage="Password does not match" ForeColor="Red" Operator="Equal" Type="String"></asp:CompareValidator>
                    </div>
                    <asp:Button class="button" ID="Button_Reg" Text="Sign Up" runat="server" ValidationGroup="RegisterFrame" OnClick="ButtonReg_Click" /><br />
                    <asp:Label ID="lblStatus3" ForeColor="Red" runat="server"></asp:Label>
                    <asp:Label ID="lblStatus2" ForeColor="Green" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
