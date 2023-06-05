<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="PlayStationBuy.aspx.cs" Inherits="QuadaceGamestore.U_Buy.PlayStationBuy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../Styles/Login.css">
    <link rel="stylesheet" type="text/css" href="../Styles/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div style="height:10vh"></div>
        <div class="topheader">
            <div class="header">
                <div><a href="ProductBuy.aspx"><img alt="" src="https://i.imgur.com/mMYeIMf.png" width=300" height="75">
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
                                    <a style="color: black; font-family: Arial; padding: 12px 16px; text-decoration: none; display: block;" href="ProductBuy.aspx">Buy</a>
                                    <a style="color: black; font-family: Arial; padding: 12px 16px; text-decoration: none; display: block;" href="../U_Rent/ProductRent.aspx">Rent</a>
                                    <a style="color: black; font-family: Arial; padding: 12px 16px; text-decoration: none; display: block;" href="../U_Trade/Trade.aspx">Trade</a>
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
    <div style="height:100vh;">
        <div style="width:100%; justify-content:center; display:flex; flex-direction:column;">
        <div id="carouselExampleIndicators"  class="carousel slide" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img class="d-block w-100" src="https://imgur.com/yyWnuyJ.png" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block w-100" src="https://imgur.com/n35klD0.png" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block w-100" src="https://imgur.com/hZGKzOc.png" alt="Third slide">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
        </div>
        <br /><br />
        <div style="height:5vh; justify-content:center; text-align:center; display:flex; flex-direction:row;">
            <asp:Button ID="btn_ns" CssClass="btn_cat" runat="server" Text="Nintendo Switch" OnClick="NS_Click" />
            <asp:Button ID="btn_ps" CssClass="btn_cats" runat="server" Text="Play Station" OnClick="PS_Click" />
            <asp:Button ID="btn_xbox" CssClass="btn_cat" runat="server" Text="XBox" OnClick="Xbox_Click" />
            <asp:Button ID="btn_pc" CssClass="btn_cat" runat="server" Text="PC Gaming" OnClick="PC_Click" />
            <asp:Button ID="btn_others" CssClass="btn_cat" runat="server" Text="Others" OnClick="Ot_Click" />
        </div>
        <br /><br /><br />
        <div style="justify-content:center; display:flex; flex-direction:row;" class="text-center">
            <asp:DataList ID="DataList1" runat="server"  Font-Size="Small" RepeatColumns="5" RepeatDirection="Horizontal" Width="1200px" OnItemCommand="DataList1_ItemCommand1" >
                <ItemStyle ForeColor="Black"/>
                <ItemTemplate>
                            <div style="box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 5px 0px, rgba(0, 0, 0, 0.1) 0px 0px 1px 0px;">
                                <div style="height:20px;"></div>
                                <div class="title">
                                    <h3 class="titles">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("productbuy_name") %>'></asp:Label>
                                    </h3>
                                </div>
                                <div>
                                    <asp:Image ID="imgPhoto" runat="server" Width="100px" Height="125px" ImageUrl='<%#"~/Images/"+Eval("productbuy_image").ToString() %>'  />
                                </div>
                                <div class="price">
                                    RM<asp:Label ID="Label2" runat="server" Text='<%# Bind("productbuy_price", "{0:n}") %>'></asp:Label>
                                </div>
                                <br />
                                <asp:Button ID="DetailsClick" CssClass="button_details" runat="server" Text="Details" CommandArgument='<%# Eval("productbuy_id") %>' CommandName="ViewDetails" />
                                <div style="height:20px;"></div>
                        </div>
                </ItemTemplate>
            </asp:DataList>
         </div>
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
       </div>
</asp:Content>

