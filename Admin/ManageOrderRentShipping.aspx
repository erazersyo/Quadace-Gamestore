<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="ManageOrderRentShipping.aspx.cs" Inherits="QuadaceGamestore.Admin.ManageOrderRentShipping" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <link rel="stylesheet" type="text/css" href="../Styles/style.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div style="height:10vh"></div>
        <div class="topheader">
            <div class="header">
                <div><img alt="" src="https://i.imgur.com/mMYeIMf.png" width="300" height="75"></div>
                <div class="header_center"></div>
                <div class="right_navigator">
				    <ul>
					    <li><a href="../Login.aspx" class="active"><i class="fa fa-lock"></i> Login</a></li>
				    </ul>
			    </div>
            </div>
        </div> 
        <ul class="list">
          <li><br /></li>
          <li><a href="ManageProduct.aspx">Manage Product</a></li>
          <div class="dropdowneds">
          <li class="dropbtneds"><a href="#" class="active" >Manage Order <i class="fa fa-angle-down" style="padding-left:73px;"></i></a></li>
            <div class="dropdown-contenteds">
                <a href="ManageOrder.aspx">Buy</a>
                <a class="activesed" href="ManageOrderRent.aspx">Rent</a>
                <a href="ManageOrderTrade.aspx">Trade</a>
            </div>
          </div>
          <li><a href="ManageUser.aspx">Manage User</a></li>
          <li><a href="GenerateReport.aspx">Generate Report</a></li>
        </ul>

        <div style="margin-left:20%;padding:1px 16px;height:1000px;">
          <h2>Order List For Rent</h2>
            <div style="height:5vh; text-align:center; display:flex; flex-direction:row;">
                <asp:Button ID="btn_toship" CssClass="btn_cat" runat="server" Text="To Ship" OnClick="ToShip" />
                <asp:Button ID="btn_shipping" CssClass="btn_cats" runat="server" Text="Shipping" OnClick="Shipping"/>
                <asp:Button ID="btn_completed" CssClass="btn_cat" runat="server" Text="Renting" OnClick="Renting" />
                <asp:Button ID="btn_returned" CssClass="btn_cat" runat="server" Text="Returned" OnClick="Returned" />
                <asp:Button ID="btn_cancelled" CssClass="btn_cat" runat="server" Text="Cancelled" OnClick="Cancelled" />
            </div>
            <br /><br />
            <asp:TextBox ID="search_order" style="width:300px; height:25px; font-size:16px;" placeholder="Search..." runat="server"></asp:TextBox>
            <asp:Button ID="btn_search" runat="server" CssClass="btn_edit" Text="Search" OnClick="SearchOrder_Click" />
            <br /><br />
            <asp:DataGrid ID="dgOrderBuy" CssClass="datagrid" runat="server" AutoGenerateColumns="false"  OnItemCommand="dgOrderBuy_ItemCommand" OnItemDataBound="dgOrderBuy_ItemDataBound"  Width="1150px" CellPadding="10" CellSpacing="30" Height="80px">
                    <AlternatingItemStyle CssClass="Even_Row_User" />
                    <HeaderStyle CssClass="Table_Header_User" />
                    <Columns>
                        <asp:TemplateColumn HeaderText="Order ID">
                            <ItemTemplate>
                                <asp:Label ID="lbl_OrderBuy_ID" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "orderrent_id") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="8%"/>
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Order Date Time">
                            <ItemTemplate>
                                <asp:Label ID="lbl_OrderBuy_DateTime" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "orderrent_date") %>'></asp:Label>
                            </ItemTemplate>                           
                            <ItemStyle Width="16%" />
                            <HeaderStyle Font-Bold="True"/>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="User ID">
                            <ItemTemplate>
                                <asp:Label ID="lbl_User_ID" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "user_id") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="8%" />
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="User Name">
                            <ItemTemplate>
                                <asp:Label ID="lbl_User_Name" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "orderrent_name") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="20%" />
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="State">
                            <ItemTemplate>
                                <asp:Label ID="lbl_OrderBuy_State" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "orderrent_state") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="10%" />
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Phone">
                            <ItemTemplate>
                                <asp:Label ID="lbl_OrderBuy_Phone" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "orderrent_phone") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="10%" />
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Total Price">
                            <ItemTemplate>
                                <asp:Label ID="Label1" Runat="server" Text="RM"></asp:Label>
                                <asp:Label ID="lbl_OrderBuy_total" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "orderrent_total", "{0:n}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="10%" />
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Details">
                            <HeaderStyle Font-Bold="True" />
                            <ItemTemplate>
                                <asp:Button ID="btnOrderBuyDetails" CssClass="button" Runat="server" CommandArgument='<%# Eval("orderrent_id") %>' CommandName="OrderBuyDetails" Text="Details" />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Cancel Order">
                            <HeaderStyle Font-Bold="True" />
                            <ItemTemplate>
                                <asp:Button ID="btnCancelOrderBuy" CssClass="button" Runat="server" CommandName="CancelOrderBuy" Text="Cancel Order" />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid>
        </div>
</asp:Content>


