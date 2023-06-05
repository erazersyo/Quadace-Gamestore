<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="DeliveryShip.aspx.cs" Inherits="QuadaceGamestore.DeliveryMan.DeliveryShip" %>
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
    <div style="margin-left:10%; margin-right:10%; margin-top:1%;padding:5px 16px;height:200px;">
        <div style="height:5vh; text-align:center; display:flex; flex-direction:row;">
                <asp:Button ID="btn_shipping" CssClass="btn_cats" runat="server" Text="Shipping" />
                <asp:Button ID="btn_completed" CssClass="btn_cat" runat="server" Text="Completed" OnClick="Completed_Click" />
         </div><br /><br /><br />
       <h2>Buy</h2> 
        <asp:DataGrid ID="dgOrderBuy" CssClass="datagrid" runat="server" AutoGenerateColumns="false"  OnItemCommand="dgOrderBuy_ItemCommand" OnItemDataBound="dgOrderBuy_ItemDataBound" Width="1150px" CellPadding="10" CellSpacing="30" Height="80px">
                    <AlternatingItemStyle CssClass="Even_Row_User" />
                    <HeaderStyle CssClass="Table_Header_User" />
                    <Columns>
                        <asp:TemplateColumn HeaderText="Tracking Number">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Tracking_ID" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "orderbuy_tracking") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="10%"/>
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Order ID">
                            <ItemTemplate>
                                <asp:Label ID="lbl_OrderBuy_ID" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "orderbuy_id") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="10%"/>
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
                            <ItemStyle Width="15%" />
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Details">
                            <HeaderStyle Font-Bold="True" />
                            <ItemTemplate>
                                <asp:Button ID="btnOrderBuyDetails" CssClass="button" Runat="server" CommandArgument='<%# Eval("orderbuy_id") %>' CommandName="OrderBuyDetails" Text="Details" />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid>
        <h2>Rent</h2> 
        <asp:DataGrid ID="dgOrderRent" CssClass="datagrid" runat="server" AutoGenerateColumns="false"  OnItemCommand="dgOrderBuy_ItemCommand2" Width="1150px" CellPadding="10" CellSpacing="30" Height="80px">
                    <AlternatingItemStyle CssClass="Even_Row_User" />
                    <HeaderStyle CssClass="Table_Header_User" />
                    <Columns>
                        <asp:TemplateColumn HeaderText="Tracking Number">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Tracking_ID2" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "orderrent_tracking") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="10%"/>
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Order ID">
                            <ItemTemplate>
                                <asp:Label ID="lbl_OrderBuy_ID2" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "orderrent_id") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="10%"/>
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Order Date Time">
                            <ItemTemplate>
                                <asp:Label ID="lbl_OrderBuy_DateTime2" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "orderrent_date") %>'></asp:Label>
                            </ItemTemplate>                           
                            <ItemStyle Width="20%" />
                            <HeaderStyle Font-Bold="True"/>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="User Name">
                            <ItemTemplate>
                                <asp:Label ID="lbl_User_Name2" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "orderrent_name") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="20%" />
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="State">
                            <ItemTemplate>
                                <asp:Label ID="lbl_OrderBuy_State2" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "orderrent_state") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="10%" />
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Phone">
                            <ItemTemplate>
                                <asp:Label ID="lbl_OrderBuy_Phone2" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "orderrent_phone") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="15%" />
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Details">
                            <HeaderStyle Font-Bold="True" />
                            <ItemTemplate>
                                <asp:Button ID="btnOrderBuyDetails2" CssClass="button" Runat="server" CommandArgument='<%# Eval("orderrent_id") %>' CommandName="OrderBuyDetails2" Text="Details" />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid>
        <br /><br /><br />
    </div>
</asp:Content>
