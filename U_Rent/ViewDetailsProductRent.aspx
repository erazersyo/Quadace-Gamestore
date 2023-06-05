<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="ViewDetailsProductRent.aspx.cs" Inherits="QuadaceGamestore.U_Rent.ViewDetailsProductRent" %>
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
                <div><a href="../U_Rent/ProductRent.aspx"><img alt="" src="https://i.imgur.com/mMYeIMf.png" width=300" height="75">
      </a></div>
                <div class="header_center">
                    <div class="hc_up">
                        <asp:TextBox class="searchbar" id="searchbar" placeholder="  Search" runat="server"></asp:TextBox>  
                        <asp:ImageButton ID="button_search" CssClass="button_search" runat="server" ImageUrl="https://imgur.com/t9UnNAf.png"  OnClick="Search_Click"/>
                    </div>
                    <div class="hc_ups">              
                        <div class="dropdown">
                            <button style="padding: 5px 20px;" class="dropbtn">Rent    <i class="fa fa-angle-down"></i></button>
                                <div class="dropdown-content">
                                    <a style="color: black; font-family: Arial; padding: 12px 16px; text-decoration: none; display: block;" href="../U_Buy/ProductBuy.aspx">Buy</a>
                                    <a style="color: black; font-family: Arial; padding: 12px 16px; text-decoration: none; display: block;" href="../U_Rent/ProductRent.aspx">Rent</a>
                                    <a style="color: black; font-family: Arial; padding: 12px 16px; text-decoration: none; display: block;" href="../U_Trade/Trade.aspx">Trade</a>
                                </div>
			            </div>
                    </div>
                </div>
                <div class="right_navigator">
				    <ul>
					    <li><a href="../User/Account.aspx"><i class="fa fa-user">  </i><asp:Label ID="lbl_AccountName" runat="server"></asp:Label></a></li>
					    <li><a href="../User/CartRent.aspx"><i class="fa fa-shopping-cart"></i> Cart</a></li>
					    <li><a href="../Login.aspx" class="active"><i class="fa fa-lock"></i> Login</a></li>
				    </ul>
			    </div>
            </div>
        </div> 
    <div style="justify-content:center; display:flex; flex-direction:row;">
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Width="1200px" OnItemCommand="DataList1_ItemCommand1">
                <ItemTemplate>
                <div class="center-blank">
                    <div class ="left-image">
                        <br /><br />
                        <asp:Label ID="Label4" class="detail-category" runat="server" Text='<%# Bind("productrent_category") %>'></asp:Label><br /><br />
                        <asp:Image ID="Image1" runat="server" Width="300px" Height="375px" ImageUrl='<%#"~/Images/"+Eval("productrent_image").ToString() %>' />
                    </div>
                    <div class="right-details">
                        <br /><br />
                        <asp:Label ID="Label1" class="detail-name" runat="server" Text='<%# Bind("productrent_name") %>'></asp:Label> <br />
                        <div class="detail-price">RM <asp:Label ID="Label2" runat="server" Text='<%# Bind("productrent_price", "{0:n}") %>'></asp:Label> /day</div><br />
                        <div class="detail-description">
                            <asp:Label ID="Label5" style="font-weight:bold; font-size:18px;" runat="server" Text="Description"></asp:Label><br />
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("productrent_description") %>'></asp:Label></div><br /><br />
                        <div style="justify-content:center;">
                            <asp:Label ID="Label6" style="font-weight:bold; font-size:18px;" runat="server" Text="Renting Period"></asp:Label><br /><br />
                            From: <asp:TextBox ID="date_from" class="txtboxdate" TextMode="Date" runat="server"></asp:TextBox>
                            To: <asp:TextBox ID="date_to" class="txtboxdate" TextMode="Date" runat="server"></asp:TextBox>
                            <asp:Button style="margin-left:20px;" class="btn_pm" ID="Button_minus" runat="server" Text="-" CommandName="MinusButton"/>
                            <asp:TextBox class="textbox_qty" ID="txtbox_qty" TextMode="Number" Value="1" min="1" runat="server"></asp:TextBox>
                            <asp:Button class="btn_pm" ID="Button_plus" runat="server" Text="+" CommandName="PlusButton"/><br /><br />
                            <asp:Button CssClass="button_cart" ID="ButtonCart" runat="server" Text="ADD TO CART" CommandArgument='<%# Eval("productrent_id") %>' CommandName="AddToCart"/><br /><br />
                            <asp:Label ID="Label_success" style="font-weight:bold; font-size:15px;" runat="server"></asp:Label>
                            <asp:Label ID="Label_warning" style="color:red; font-size:15px;" runat="server"></asp:Label><br /><br />
                        </div>
                    </div>
                    </div>
                    </ItemTemplate>
            </asp:DataList>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QuadaceGamestoreConnectionString %>" SelectCommand="SELECT * FROM [ProductRent] WHERE ([productrent_id] = @productrent_id)">
            <SelectParameters>
                <asp:QueryStringParameter Name="productrent_id" QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    <div class="footer">
            <div style="margin-left:50px; padding-top:50px; display: flex; flex-direction: row; justify-content: center; width:100%;">
                <div style="width:20%;">
                    <h3>SHOP BY</h3>
                    <ul>
                      <li><a href="../U_Buy/ProductBuy.aspx">Buy</a></li>
                      <li><a href="../U_Rent/ProductRent.aspx">Rent</a></li>
                      <li><a href="../U_Trade/Trade.aspx">Trade</a></li>
                    </ul>
                </div>
                <div style="width:20%;">
                    <h3>MY ORDER</h3>
                    <ul>
                      <li><a href="../User/OrderToShip.aspx">My Buy Order</a></li>
                      <li><a href="../User/OrderRentToShip.aspx">My Rent Order</a></li>
                      <li><a href="../User/TradeRequest.aspx">My Trade Request</a></li>
                    </ul>
                </div>
                <div style="width:20%;">
                    <h3>HELP</h3>
                    <ul>
                      <li><a href="../ContactUs.aspx">Contact Us</a></li>
                      <li><a href="../TermsCondition.aspx">Terms & Condition</a></li>
                    </ul>
                </div>
                <div style="width:40%" class="social-media">
                    <h3>VISIT US ON</h3><br />                    
                       <a href="https://www.facebook.com/quadace.gamestore" style="margin-left:30px;"><img alt="" src="https://imgur.com/M4fd3QD.png" width=38" height="38"></a>
                       <a href="https://www.instagram.com/quadace.gamestore"style="margin-left:5px;"><img alt="" src="https://imgur.com/qRaggCr.png" width=40" height="40"></a>
                       <a href="https://wa.me/60162207052" style="margin-left:5px;"><img alt="" src="https://imgur.com/EjVF3Ek.png" width=40" height="40"></a>
                </div>
             </div>
            <div style="margin-left:50px; margin-top:50px; color:white;">
                <asp:Label ID="Label1" runat="server" Text="© Copyright 2022 Quadace Gamestore"></asp:Label>
            </div>
            
       </div>
</asp:Content>

