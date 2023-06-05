<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="OrderTradeAccepted.aspx.cs" Inherits="QuadaceGamestore.User.OrderTradeAccepted" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../Styles/Login.css">
    <link rel="stylesheet" type="text/css" href="../Styles/sidebar.css">
    <link rel="stylesheet" type="text/css" href="../Styles/style.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div style="height:10vh"></div>
        <div class="topheader">
            <div class="header">
                <div><a href="../U_Buy/ProductBuy.aspx"><img alt="" src="https://i.imgur.com/mMYeIMf.png" width=300" height="75">
      </a></div>
                <div class="header_center">
                    <div class="hc_up">
                        <asp:TextBox class="searchbar" id="searchbar" placeholder="  Search" runat="server"></asp:TextBox>  
                        <asp:ImageButton ID="button_search" CssClass="button_search" runat="server" ImageUrl="https://imgur.com/t9UnNAf.png"  OnClick="Search_Click"/>
                    </div>
                    <div class="hc_ups">              
                        <div class="dropdown">
                            <button style="padding: 5px 20px;" class="dropbtn">Buy    <i class="fa fa-angle-down"></i></button>
                                <div class="dropdown-content">
                                    <a style="color: black; font-family: Arial; padding: 12px 16px; text-decoration: none; display: block;" href="../U_Buy/ProductBuy.aspx">Buy</a>
                                    <a style="color: black; font-family: Arial; padding: 12px 16px; text-decoration: none; display: block;" href="../U_Rent/ProductRent.aspx">Rent</a>
                                    <a style="color: black; font-family: Arial; padding: 12px 16px; text-decoration: none; display: block;" href="trade.aspx">Trade</a>
                                </div>
			            </div>
                    </div>
                </div>
                <div class="right_navigator">
				    <ul>
					    <li><a href="../User/Account.aspx"><i class="fa fa-user">  </i><asp:Label ID="lbl_AccountName" runat="server"></asp:Label></a></li>
					    <li><a href="../User/Cart.aspx"><i class="fa fa-shopping-cart"></i> Cart</a></li>
					    <li><a href="../Login.aspx" class="active"><i class="fa fa-lock"></i> Login</a></li>
				    </ul>
			    </div>
            </div>
        </div> 
    <div class="wrapper">
        <!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3>Welcome</h3>
                <asp:Label ID="lbl_AccountName2" runat="server"></asp:Label>
            </div>
           <ul class="list-unstyled components">
                <li>
                    <a href="Account.aspx">Profile</a>
                </li>
                <li>
                    <a href="OrderToShip.aspx">My Buy Orders</a>
                </li>
                <li>
                    <a href="OrderRentToShip.aspx">My Rent Orders</a>
                </li>
                <li  class="active">
                    <a href="OrderTradeRequest.aspx">My Trade Orders</a>
                </li>
            </ul>
        </nav>

        <!-- Page Content  -->
        <div id="content">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                <div class="container-fluid">
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div style="padding-left:50px;">
             <h2>Trade Request List</h2>
            <div style="height:5vh; text-align:center; display:flex; flex-direction:row; padding-top:10px;">
                <asp:Button ID="btn_toship" CssClass="btn_cats" runat="server" Text="Pending" OnClick="Pending"/>
                <asp:Button ID="btn_shipping" CssClass="btn_cat" runat="server" Text="Accepted" OnClick="Accepted"/>
                <asp:Button ID="btn_completed" CssClass="btn_cat" runat="server" Text="Declined" OnClick="Declined" />
            </div><br /><br /><br />
               <asp:DataList ID="DataList2" runat="server" Font-Size="Small" RepeatColumns="1" RepeatDirection="Vertical" Width="1120px" >
                <ItemTemplate>
                    <div style="box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 5px 0px, rgba(0, 0, 0, 0.1) 0px 0px 1px 0px;">
                    <div class="centered">
                        <div class ="lefted">
                            <table>
                                <tr>
                                    <td style="width:150px;"><asp:Label ID="Label1" style="font-weight:bold;" runat="server" Text="Trade ID : "></asp:Label></td>
                                    <td><asp:Label ID="lbl_tradeid" runat="server" Text='<%# Bind("trade_id") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width:150px;"><asp:Label ID="Label2" style="font-weight:bold;" runat="server" Text="Product Name : "></asp:Label></td>
                                    <td><asp:Label ID="lbl_orderbuyid" runat="server" Text='<%# Bind("trade_name") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td><asp:Label ID="Label3" style="font-weight:bold;" runat="server" Text="Product Type : "></asp:Label></td>
                                    <td><asp:Label ID="lbl_userid"  runat="server" Text='<%# Bind("trade_type") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td><asp:Label ID="Label4" style="font-weight:bold;" runat="server" Text="Condition : "></asp:Label></td>
                                    <td><asp:Label ID="lbl_datetime"  runat="server" Text='<%# Bind("trade_condition") %>'></asp:Label>/10</td>
                                </tr>
                                <tr>
                                    <td><asp:Label ID="Label6" style="font-weight:bold;" runat="server" Text="Remarks: "></asp:Label></td>
                                    <td><asp:Label ID="Label7" runat="server" Text='<%# Bind("trade_remarks") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td><asp:Label ID="Label9" style="font-weight:bold;" runat="server" Text="Price: "></asp:Label></td>
                                    <td>RM <asp:Label ID="Label12" runat="server" Text='<%# Bind("trade_price" , "{0:n}") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td><asp:Label ID="Label5" style="font-weight:bold;" runat="server" Text="Status: "></asp:Label></td>
                                    <td><asp:Label ID="Label8" runat="server" Text="Accepted"></asp:Label></td>
                                </tr>
                            </table>
                                <asp:Label ID="lbl_warning" style="color:red;" runat="server"></asp:Label>
                        </div>
                        <div class="righted">
                            <asp:Label ID="lbl_proof" runat="server" style="font-size:16px; font-weight:bold;" Text="Image of the Product: "></asp:Label><br />
                            <asp:Image runat="server" Width="300px" Height="375px" ImageUrl='<%#"~/Images/"+Eval("trade_image").ToString() %>'></asp:Image><br />
                        </div>
                     </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
                </div>
                    </div>
                </div>
            </nav>
    </div>
</asp:Content>

