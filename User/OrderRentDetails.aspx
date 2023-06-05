<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="OrderRentDetails.aspx.cs" Inherits="QuadaceGamestore.User.OrderRentDetails" %>
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
                <li class="active">
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
        <h2>Order Details</h2>
        <div style="justify-content:center; display:flex; flex-direction:row;">
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Width="1200px" OnItemCommand="DataList1_ItemCommand1">
                <ItemTemplate>
                    <div class="center-blanks">
                        <div class ="left-images">
                            <table>
                                <tr>
                                    <td style="width:100px;"><asp:Label ID="Label2" style="font-weight:bold;" runat="server" Text="Order ID : "></asp:Label></td>
                                    <td><asp:Label ID="lbl_orderbuyid" runat="server" Text='<%# Bind("orderrent_id") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td><asp:Label ID="Label3" style="font-weight:bold;" runat="server" Text="User ID : "></asp:Label></td>
                                    <td><asp:Label ID="lbl_userid"  runat="server" Text='<%# Bind("user_id") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td><asp:Label ID="Label4" style="font-weight:bold;" runat="server" Text="Order date : "></asp:Label></td>
                                    <td><asp:Label ID="lbl_datetime"  runat="server" Text='<%# Bind("orderrent_date") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td><asp:Label ID="Label5" style="font-weight:bold;" runat="server" Text="Notes : "></asp:Label></td>
                                    <td><asp:Label ID="lbl_notes" runat="server" Text='<%# Bind("orderrent_notes") %>'></asp:Label></td>
                                </tr>
                            </table>
                        </div>
                        <div class="right-detailss">
                            <asp:Label ID="Label1" style="font-weight:bold;" runat="server" Text="Delivery Address :"></asp:Label><br />
                            <asp:Label ID="lbl_username" runat="server" Text='<%# Bind("orderrent_name") %>'></asp:Label>
                            <asp:Label ID="lbl_phone" runat="server" Text='<%# Bind("orderrent_phone") %>'></asp:Label><br />
                            <asp:Label ID="lbl_street" runat="server" Text='<%# Bind("orderrent_street") %>'></asp:Label><br />
                            <asp:Label ID="lbl_town" runat="server" Text='<%# Bind("orderrent_town") %>'></asp:Label><br />
                            <asp:Label ID="lbl_postcode" runat="server" Text='<%# Bind("orderrent_postcode") %>'></asp:Label>
                            <asp:Label ID="lbl_state" runat="server" Text='<%# Bind("orderrent_state") %>'></asp:Label><br />
                        </div>
                     </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QuadaceGamestoreConnectionString %>" SelectCommand="SELECT * FROM [OrderRent] WHERE ([orderrent_id] = @orderrent_id)">
            <SelectParameters>
                <asp:QueryStringParameter Name="orderrent_id" QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
            <br /><br />
            <asp:DataGrid ID="dgOrderBuyDetails" CssClass="datagrid" runat="server" AutoGenerateColumns="false" Width="1000px" CellPadding="10" CellSpacing="30" Height="80px">
                    <AlternatingItemStyle CssClass="Even_Row_User" />
                    <HeaderStyle CssClass="Table_Header_User" />
                    <Columns>
                        <asp:TemplateColumn HeaderText="Product ID">
                            <ItemTemplate>
                                <asp:Label ID="lbl_ProductBuy_ID" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "productrent_id") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="5%"/>
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Product Image">
                            <ItemTemplate>
                                <asp:Image ID="imgPd" runat="server" Height="100px"
                                ImageUrl='<%#"~/Images/"+Eval("productrent_image").ToString() %>' Width="80px" />
                            </ItemTemplate>
                            <ItemStyle Width="15%"/>
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Product Name">
                            <ItemTemplate>
                                <asp:Label ID="lbl_ProductBuy_Name" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "productrent_name") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="30%" />
                            <HeaderStyle Font-Bold="True"/>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Product Category">
                            <ItemTemplate>
                                <asp:Label ID="lbl_ProductBuy_Category" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "productrent_category") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="15%" />
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Product Price">
                            <ItemTemplate>
                                <asp:Label ID="Label6" Runat="server" Text="RM"></asp:Label>
                                <asp:Label ID="lbl_ProductBuy_Price" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "productrent_price", "{0:n}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="15%" />
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Product Quantity">
                            <ItemTemplate>
                                <asp:Label ID="lbl_ProductBuy_Quantity" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "quantity") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="8%" />
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                         <asp:TemplateColumn HeaderText="Total">
                            <ItemTemplate>
                                <asp:Label ID="Labelrm" Runat="server" Text="RM"></asp:Label>
                                <asp:Label ID="lbl_Total" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "total_price", "{0:n}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="20%" />
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid>
                <div style="width:75%;text-align:right; font-family:Arial; font-size:20px;">
                    <asp:Label ID="Label7" Runat="server" style="text-align:right;" Text="Total : RM "></asp:Label>
                    <asp:Label ID="lbl_total_Prices" Runat="server" style="text-align:right;"></asp:Label>
                </div>
            <div style="width:83%; font-family:Arial; font-size:20px;">
                <asp:Label ID="Label8" Runat="server" Text="Tracking Number: "></asp:Label>
                <asp:Label ID="lbl_tracking" Runat="server"></asp:Label>
            </div><br />
            <asp:DataGrid ID="dgTracking" CssClass="datagrid" runat="server" AutoGenerateColumns="False" Width="500px">
                    <AlternatingItemStyle CssClass="Even_Row_User" />
                    <HeaderStyle CssClass="Table_Header_User" />
                    <Columns>
                        <asp:TemplateColumn HeaderText="Time">
                        <ItemTemplate>
                            <asp:Label ID="lbl_time" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "orderrent_trackingtime") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="35%"/>
                        <HeaderStyle Font-Bold="True"/>
                    </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label ID="lbl_status" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "orderrent_status") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Font-Bold="True"/>
                            <ItemStyle Width="55%"/>
                    </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid>
            </div>
                        </div>
                    </div>
                </div>
                <div style="height:200px;"></div>
            </nav>   
    </div>    
</asp:Content>

