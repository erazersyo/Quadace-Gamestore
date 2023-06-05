<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="Trade.aspx.cs" Inherits="QuadaceGamestore.Trade" %>
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
                            <button style="padding: 5px 20px;" class="dropbtn">Trade    <i class="fa fa-angle-down"></i></button>
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
					    <li><a href="../User/Cart.aspx"><i class="fa fa-shopping-cart"></i> Cart</a></li>
					    <li><a href="../Login.aspx" class="active"><i class="fa fa-lock"></i> Login</a></li>
				    </ul>
			    </div>
            </div>
        </div> 
            <div style="width:100%; justify-content:center; display:flex; flex-direction:column;">
        <div id="carouselExampleIndicators"  class="carousel slide" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img class="d-block w-100" src="https://imgur.com/rr2JJqc.png" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block w-100" src="https://imgur.com/GUCdV4n.png" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block w-100" src="https://imgur.com/dum6v0F.png" alt="Third slide">
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
    <div style="height:90vh; justify-content:center; align-content:center; display:flex; flex-direction:row;">
        <div style="width: 35%; height: 70%; align-content: center; margin-top: 10vh; justify-content: center; text-align:justify;">
            <br /><h2>HOW TO TRADE IN?</h2><br />
            <p style="font-size:20px;">1. Fill the form of your game / console that you wish to trade in. </p>
            <p style="font-size:20px;">2. Wait for the administrator to accept or decline your trade in offer. </p>
            <p style="font-size:20px;">3. Once your trade in offer has been accepted, administrator will give you a price.</p>
            <p style="font-size:20px;">4. If you are sastify with the price, you may proceed to deliver your product to our shop.</p>
            <p style="font-size:20px;">5. Please feel free to contact us if you have any other questions.</p>
        </div>
        <div style="width:10%;">

        </div>
        <div style="width:35%; height:77%; align-content:center; justify-content:center; margin-top:10vh; display:flex; flex-direction:row; box-shadow: rgba(14, 30, 37, 0.12) 0px 2px 4px 0px, rgba(14, 30, 37, 0.32) 0px 2px 16px 0px; ">
            <div style="margin-top:30px;">
                <h3>TRADE IN REQUEST FORM</h3><br />
                <table>
                    <tr style="height:50px;">
                        <td style="width:150px;">Product Name:</td>
                        <td><asp:TextBox id="tradeName" style="width:250px;" runat="server"></asp:TextBox>  </td>
                    </tr>
                    <tr style="height:50px;">
                        <td style="width:150px;">Product Type:</td>
                        <td><asp:DropDownList CssClass="dropdowns" ID="tradeType" runat="server">
                            <asp:ListItem>Consoles</asp:ListItem>
                            <asp:ListItem>Nintendo</asp:ListItem>
                            <asp:ListItem>Play Station</asp:ListItem>
                            <asp:ListItem>XBox</asp:ListItem>
                            <asp:ListItem>PC Gaming</asp:ListItem>
                            <asp:ListItem>Others</asp:ListItem>
                         </asp:DropDownList> </td>
                    </tr>
                    <tr style="height:50px;">
                        <td style="width:150px;">Product Condition:</td>
                        <td><asp:DropDownList CssClass="dropdowns" ID="tradeCondition" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                         </asp:DropDownList> /10 </td>
                    </tr>
                    <tr style="height:50px;">
                        <td>Image upload:</td>
                        <td><asp:FileUpload ID="imageAdd" runat="server" /></td>
                    </tr>
                    <tr style="height:130px;">
                        <td>Remarks:</td>
                        <td><asp:TextBox ID="tradeRemarks" TextMode="MultiLine" style="padding-top:10px;width:300px; height:100px;" runat="server"></asp:TextBox></td>
                    </tr>
                </table>
                <div style="justify-content:center; align-content:center; display:flex; flex-direction:row; padding-top:20px;">
                    <asp:Button ID="UpdateClick" class="button-trade" runat="server" Text="SUBMIT" OnClick="Trade_Click" />
                </div>
            </div>
        </div>
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
</asp:Content>
