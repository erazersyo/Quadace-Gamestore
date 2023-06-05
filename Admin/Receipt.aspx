<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="Receipt.aspx.cs" Inherits="QuadaceGamestore.Admin.Receipt" EnableEventValidation="false"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div><img alt="" src="https://imgur.com/Je8dGiU.png" width="300" height="75"></div>
    <h2 style="padding-left:300px;">Receipt</h2>
        <div style="display:flex; flex-direction:row;">
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Width="1200px">
                <ItemTemplate>
                    <div style="width: 70%; display: flex; flex-direction: row; font-family: Arial; font-size: 16px; line-height: 22px;">
                        <div style="width: 70%; height: 100%;">
                            <table>
                                <tr>
                                    <td style="width:100px;"><asp:Label ID="Label2" style="font-weight:bold;" runat="server" Text="Order ID : "></asp:Label></td>
                                    <td><asp:Label ID="lbl_orderbuyid" runat="server" Text='<%# Bind("orderbuy_id") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td><asp:Label ID="Label3" style="font-weight:bold;" runat="server" Text="User ID : "></asp:Label></td>
                                    <td><asp:Label ID="lbl_userid"  runat="server" Text='<%# Bind("user_id") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td><asp:Label ID="Label4" style="font-weight:bold;" runat="server" Text="Order date : "></asp:Label></td>
                                    <td><asp:Label ID="lbl_datetime"  runat="server" Text='<%# Bind("orderbuy_date") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td><asp:Label ID="Label5" style="font-weight:bold;" runat="server" Text="Notes : "></asp:Label></td>
                                    <td><asp:Label ID="lbl_notes" runat="server" Text='<%# Bind("orderbuy_notes") %>'></asp:Label></td>
                                </tr>
                            </table>
                        </div>
                        <div style=" width: 40%; height: 100%; justify-content: left;">
                            <asp:Label ID="Label1" style="font-weight:bold;" runat="server" Text="Delivery Address :"></asp:Label><br />
                            <asp:Label ID="lbl_username" runat="server" Text='<%# Bind("orderbuy_name") %>'></asp:Label>
                            <asp:Label ID="lbl_phone" runat="server" Text='<%# Bind("orderbuy_phone") %>'></asp:Label><br />
                            <asp:Label ID="lbl_street" runat="server" Text='<%# Bind("orderbuy_street") %>'></asp:Label><br />
                            <asp:Label ID="lbl_town" runat="server" Text='<%# Bind("orderbuy_town") %>'></asp:Label><br />
                            <asp:Label ID="lbl_postcode" runat="server" Text='<%# Bind("orderbuy_postcode") %>'></asp:Label>
                            <asp:Label ID="lbl_state" runat="server" Text='<%# Bind("orderbuy_state") %>'></asp:Label><br />
                        </div>
                     </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QuadaceGamestoreConnectionString %>" SelectCommand="SELECT * FROM [OrderBuy] WHERE ([orderbuy_id] = @orderbuy_id)">
            <SelectParameters>
                <asp:QueryStringParameter Name="orderbuy_id" QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br /><br /><br />
             <asp:DataGrid ID="dgOrderBuyDetails" CssClass="datagrid" runat="server" AutoGenerateColumns="false" Width="750px" CellPadding="10" CellSpacing="30" Height="80px" style="font-family:Arial;">
                 <Columns>
                        <asp:TemplateColumn HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="lbl_ProductBuy_Name" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "productbuy_name") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="30%" />
                            <HeaderStyle Font-Bold="True"/>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Price">
                            <ItemTemplate>
                                <asp:Label ID="Label6" Runat="server" Text="RM"></asp:Label>
                                <asp:Label ID="lbl_ProductBuy_Price" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "productbuy_price") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="15%" />
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Quantity">
                            <ItemTemplate>
                                <asp:Label ID="lbl_ProductBuy_Quantity" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "quantity") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="8%" />
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                         <asp:TemplateColumn HeaderText="Total">
                            <ItemTemplate>
                                <asp:Label ID="Labelrm" Runat="server" Text="RM"></asp:Label>
                                <asp:Label ID="lbl_Total" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "total_price") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="20%" />
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid>
              <div style="width:50%;text-align:right; font-family:Arial; font-size:20px;">
                    <asp:Label ID="Label1" Runat="server" style="text-align:right;" Text="Total : RM "></asp:Label>
                    <asp:Label ID="lbl_total_Prices" Runat="server" style="text-align:right;"></asp:Label><br /><br />
                </div>
</asp:Content>
