<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="OrderCancelled.aspx.cs" Inherits="QuadaceGamestore.User.OrderCancelled" %>
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
                <li class="active">
                    <a href="OrderToShip.aspx">My Buy Orders</a>
                </li>
                <li>
                    <a href="OrderRentToShip.aspx">My Rent Orders</a>
                </li>
                <li>
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
                        <div class="center">
                               <h2>Order List</h2>
            <div style="height:5vh; text-align:center; display:flex; flex-direction:row;">
                <asp:Button ID="btn_toship" CssClass="btn_cat" runat="server" Text="To Ship"  OnClick="ToShip"/>
                <asp:Button ID="btn_shipping" CssClass="btn_cat" runat="server" Text="Shipping" OnClick="Shipping"/>
                <asp:Button ID="btn_completed" CssClass="btn_cat" runat="server" Text="Completed"  OnClick="Completed"/>
                <asp:Button ID="btn_cancelled" CssClass="btn_cats" runat="server" Text="Cancelled"  />
            </div>
            <asp:DataGrid ID="dgOrderBuy" CssClass="datagrid" runat="server" AutoGenerateColumns="false"  OnItemCommand="dgOrderBuy_ItemCommand" OnItemDataBound="dgOrderBuy_ItemDataBound"  Width="1000px" CellPadding="10" CellSpacing="30" Height="80px">
                    <AlternatingItemStyle CssClass="Even_Row_User" />
                    <HeaderStyle CssClass="Table_Header_User" />
                    <Columns>
                        <asp:TemplateColumn HeaderText="Order ID">
                            <ItemTemplate>
                                <asp:Label ID="lbl_OrderBuy_ID" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "orderbuy_id") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="8%"/>
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Order Date Time">
                            <ItemTemplate>
                                <asp:Label ID="lbl_OrderBuy_DateTime" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "orderbuy_date") %>'></asp:Label>
                            </ItemTemplate>                           
                            <ItemStyle Width="20%" />
                            <HeaderStyle Font-Bold="True"/>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="User Name">
                            <ItemTemplate>
                                <asp:Label ID="lbl_User_Name" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "orderbuy_name") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="20%" />
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="State">
                            <ItemTemplate>
                                <asp:Label ID="lbl_OrderBuy_State" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "orderbuy_state") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="10%" />
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Phone">
                            <ItemTemplate>
                                <asp:Label ID="lbl_OrderBuy_Phone" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "orderbuy_phone") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="10%" />
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Total Price">
                            <ItemTemplate>
                                <asp:Label ID="Label1" Runat="server" Text="RM"></asp:Label>
                                <asp:Label ID="lbl_OrderBuy_total" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "orderbuy_total", "{0:n}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="10%" />
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Details">
                            <HeaderStyle Font-Bold="True" />
                            <ItemTemplate>
                                <asp:Button ID="btnOrderBuyDetails" Runat="server" CommandArgument='<%# Eval("orderbuy_id") %>' CommandName="OrderBuyDetails" Text="Details" />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid>
                        </div>
                    </div>
                </div>
            </nav>
    </div>
</asp:Content>

