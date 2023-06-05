<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="OrderDetailsProductRentReturned.aspx.cs" Inherits="QuadaceGamestore.Admin.OrderDetailsProductRentReturned" %>
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
          <li><a href="ManageProduct.aspx">Manage Product</a> 
          <li><a class="active" href="ManageOrder.aspx">Manage Order</a></li>
          <li><a href="ManageUser.aspx">Manage User</a></li>
          <li><a href="GenerateReport.aspx">Generate Report</a></li>
        </ul>
        <div>
         <div style="margin-left:20%;padding:1px 16px;height:1000px;">
          <h2>Order Details</h2>
        <div style="justify-content:center; display:flex; flex-direction:row;">
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Width="1200px">
                <ItemTemplate>
                    <div class="center-blanks">
                        <div class ="left-image">
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
                        <div class="right-details">
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
        <br /><br /><br />
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
                        <asp:TemplateColumn HeaderText="From">
                            <ItemTemplate>
                                <asp:Label ID="lbl_ProductBuy_from" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "date_from", "{0:dd/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="8%" />
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="To">
                            <ItemTemplate>
                                <asp:Label ID="lbl_ProductBuy_to" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "date_to", "{0:dd/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="8%" />
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Duration (day)">
                        <ItemTemplate>
                            <asp:Label ID="lbl_renting_period" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "renting_period") %>'></asp:Label> 
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
              <div style="width:83%;text-align:right; font-family:Arial; font-size:20px;">
                    <asp:Label ID="Label7" Runat="server" style="text-align:right;" Text="Total : RM "></asp:Label>
                    <asp:Label ID="lbl_total_Prices" Runat="server" style="text-align:right;"></asp:Label>
                </div>
        <div margin-right:10%;">
        <div style="width:83%; font-family:Arial; font-size:20px;">
                <asp:Label ID="Label8" Runat="server" Text="Tracking Number: "></asp:Label>
                <asp:Label ID="lbl_tracking" Runat="server"></asp:Label>
            </div><br <br /><br /><br /><br />
            <div class="center-blanks">
                <div class="left-imagess">
                    <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" Width="1200px">
                        <ItemTemplate>
                            <asp:Label ID="lbl_proof" runat="server" style="font-size:16px;" Text="Proof of Order Delivered: "></asp:Label><br />
                            <asp:Image runat="server" Width="300px" Height="375px" ImageUrl='<%#"~/Images/"+Eval("orderrent_image").ToString() %>'></asp:Image>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:QuadaceGamestoreConnectionString %>" SelectCommand="SELECT * FROM [OrderRent] WHERE ([orderrent_id] = @orderrent_id)">
            <SelectParameters>
                <asp:QueryStringParameter Name="orderrent_id" QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
                 </div>
                <div class="right-detailsss">
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
    </div><br /><br/>
   </div>
    </div>
</asp:Content>

