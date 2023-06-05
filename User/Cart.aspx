<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="QuadaceGamestore.User.Cart" %>
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
    <div style="height:5vh; margin-left:150px; margin-top:30px; text-align:center; display:flex; flex-direction:row;">
            <asp:Button ID="btn_ns" CssClass="btn_cats" runat="server" Text="Buy"  />
            <asp:Button ID="btn_ps" CssClass="btn_cat" runat="server" Text="Rent" OnClick="RentClick" />
        </div>
    <div style="width:100%; justify-content:center; display:flex; flex-direction:column;">
        <div style="width:100%; justify-content:center; display:flex; flex-direction:row;">
            <br />
            <asp:DataGrid ID="dgCartBuy" CssClass="datagrid" runat="server" AutoGenerateColumns="false" OnItemCommand="dgCartBuy_ItemCommand" OnItemDataBound="dgCartBuy_ItemDataBound" Width="80%" CellPadding="10" CellSpacing="30" Height="80px">
                <AlternatingItemStyle CssClass="Even_Row_User" />
                <HeaderStyle CssClass="Table_Header_User" />
                <Columns>
                    <asp:TemplateColumn>
                            <ItemTemplate>
                                <asp:Label ID="lbl_CartBuy_ID" Runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "cart_id") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="1%"/>
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Product Image">
                        <ItemTemplate>
                            <asp:Image ID="imgPd" runat="server" Height="100px"
                            ImageUrl='<%#"~/Images/"+Eval("productbuy_image").ToString() %>' Width="80px" />
                        </ItemTemplate>
                        <ItemStyle Width="15%"/>
                        <HeaderStyle Font-Bold="True" />
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Product Name">
                        <ItemTemplate>
                            <asp:Label ID="lbl_ProductBuy_Name" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "productbuy_name") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="25%" />
                        <HeaderStyle Font-Bold="True"/>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Product Price">
                        <ItemTemplate>
                            <asp:Label ID="Label3" Runat="server" Text="RM"></asp:Label>
                            <asp:Label ID="lbl_ProductBuy_Price" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "productbuy_price", "{0:n}") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="10%" />
                        <HeaderStyle Font-Bold="True" />
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:TextBox class="textbox_qtys" ID="txtbox_qty" TextMode="Number" Value='<%# DataBinder.Eval(Container.DataItem, "quantity") %>' min="1" runat="server"></asp:TextBox>
                        </ItemTemplate>                    
                        <ItemStyle Width="12%" />
                        <HeaderStyle Font-Bold="True" />
                    </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Total Price">
                        <ItemTemplate>
                            <asp:Label ID="Label4" Runat="server" Text="RM"></asp:Label>
                             <asp:Label ID="lbl_total_Price" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "total_price", "{0:n}") %>'></asp:Label>   
                        </ItemTemplate>
                        <FooterTemplate>
                            
                        </FooterTemplate>
                        <ItemStyle Width="15%" />
                        <HeaderStyle Font-Bold="True" />
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Update / Delete">
                        <HeaderStyle Font-Bold="True" />
                        <ItemTemplate>
                            <asp:Button ID="btnUpdateCartBuy" CssClass="button_action" Runat="server" CommandName="UpdateCartBuy" Text="Update" />
                            <asp:Button ID="btnDeleteCartBuy" CssClass="button_action" Runat="server" CommandName="DeleteCartBuy" Text="Delete" />
                        </ItemTemplate>
                        <ItemStyle Width="40%" />
                    </asp:TemplateColumn>
                </Columns>
            </asp:DataGrid>           
            </div><br />
            <div style="width:100%; justify-content:center; display:flex; flex-direction:row;">
                <div style="width:75%; text-align:right; font-size:28px;">
                    <asp:Label ID="text" Runat="server" Text="Total: RM "></asp:Label> 
                    <asp:Label ID="lbl_total_Prices" Runat="server"></asp:Label>
                    <asp:Button ID="btnCheckout" CssClass="button_checkout" Runat="server" Text="CHECKOUT" OnClick="Checkout_Click" />
                </div>
            </div>
        <br /><br />
        </div>
</asp:Content>