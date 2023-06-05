<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="ManageOrderTradeDeclined.aspx.cs" Inherits="QuadaceGamestore.Admin.ManageOrderTradeDeclined" %>
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
                <a href="ManageOrderRent.aspx">Rent</a>
                <a class="activesed" href="ManageOrderTrade.aspx">Trade</a>
            </div>
          </div>
          <li><a href="ManageUser.aspx">Manage User</a></li>
          <li><a href="GenerateReport.aspx">Generate Report</a></li>
        </ul>

        <div style="margin-left:20%;padding:1px 16px;height:1000px;">
          <h2>Request List For Trade</h2>
            <div style="height:5vh; text-align:center; display:flex; flex-direction:row;">
                <asp:Button ID="btn_toship" CssClass="btn_cat" runat="server" Text="Pending" OnClick="Pending"/>
                <asp:Button ID="btn_shipping" CssClass="btn_cat" runat="server" Text="Accepted" OnClick="Accepted"/>
                <asp:Button ID="btn_completed" CssClass="btn_cats" runat="server" Text="Declined" OnClick="Declined" />
            </div><br /><br /><br />
               <asp:DataList ID="DataList2" runat="server"  Font-Size="Small" RepeatColumns="1" RepeatDirection="Vertical" Width="1120px" >
                <ItemTemplate>
                    <div style="box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 5px 0px, rgba(0, 0, 0, 0.1) 0px 0px 1px 0px;">
                    <div class="centered">
                        <div class ="lefted">
                            <table>
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
                                    <td><asp:Label ID="Label5" style="font-weight:bold;" runat="server" Text="User ID : "></asp:Label></td>
                                    <td><asp:Label ID="lbl_notes" runat="server" Text='<%# Bind("user_id") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td><asp:Label ID="Label6" style="font-weight:bold;" runat="server" Text="Remarks: "></asp:Label></td>
                                    <td><asp:Label ID="Label7" runat="server" Text='<%# Bind("trade_remarks") %>'></asp:Label></td>
                                </tr>
                            </table>
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
</asp:Content>
