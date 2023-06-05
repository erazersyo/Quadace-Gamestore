<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="DeliveryCompletedDetails.aspx.cs" Inherits="QuadaceGamestore.DeliveryMan.DeliveryCompletedDetails" %>
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
    <div>
    <h2 style="margin-left:10%">Order Details</h2>
        <div style="justify-content:center; display:flex; flex-direction:row;">
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Width="1200px">
                <ItemTemplate>
                    <div class="center-blanks">
                        <div class ="left-image">
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
                        <div class="right-details">
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
        <div style="margin-left:10%;margin-right:10%;">
        <div style="width:83%; font-family:Arial; font-size:20px;">
                <asp:Label ID="Label7" Runat="server" Text="Tracking Number: "></asp:Label>
                <asp:Label ID="lbl_tracking" Runat="server"></asp:Label>
            </div><br <br /><br />
            <div class="center-blank">
                <div class="left-images">
                    <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" Width="1200px">
                        <ItemTemplate>
                            <asp:Label ID="lbl_proof" runat="server" style="font-size:16px;" Text="Proof of Order Delivered: "></asp:Label><br />
                            <asp:Image runat="server" Width="300px" Height="375px" ImageUrl='<%#"~/Images/"+Eval("orderbuy_image").ToString() %>'></asp:Image>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:QuadaceGamestoreConnectionString %>" SelectCommand="SELECT * FROM [OrderBuy] WHERE ([orderbuy_id] = @orderbuy_id)">
            <SelectParameters>
                <asp:QueryStringParameter Name="orderbuy_id" QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
                 </div>
                <div class="right-detailss">
    <asp:DataGrid ID="dgTracking" CssClass="datagrid" runat="server" AutoGenerateColumns="False" Width="500px">
                    <AlternatingItemStyle CssClass="Even_Row_User" />
                    <HeaderStyle CssClass="Table_Header_User" />
                    <Columns>
                        <asp:TemplateColumn HeaderText="Time">
                        <ItemTemplate>
                            <asp:Label ID="lbl_time" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "orderbuy_trackingtime") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="35%"/>
                        <HeaderStyle Font-Bold="True"/>
                    </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label ID="lbl_status" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "orderbuy_status") %>'></asp:Label>
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
</asp:Content>

