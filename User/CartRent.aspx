<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="CartRent.aspx.cs" Inherits="QuadaceGamestore.User.CartRent" %>
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
					    <li><a href="../User/CartRent.aspx"><i class="fa fa-shopping-cart"></i> Cart</a></li>
					    <li><a href="../Login.aspx" class="active"><i class="fa fa-lock"></i> Login</a></li>
				    </ul>
			    </div>
            </div>
        </div> 
    <div style="height:5vh; margin-left:150px; margin-top:30px; text-align:center; display:flex; flex-direction:row;">
            <asp:Button ID="btn_ns" CssClass="btn_cat" runat="server" Text="Buy" OnClick="BuyClick" />
            <asp:Button ID="btn_ps" CssClass="btn_cats" runat="server" Text="Rent"  />
        </div>
    <div style="width:100%; justify-content:center; display:flex; flex-direction:column;">
        <div style="width:100%; justify-content:center; display:flex; flex-direction:row;">
            <br />
             <asp:DataGrid ID="dgCartBuy" CssClass="datagrid" runat="server" AutoGenerateColumns="false" OnCancelCommand="dgCancel_CartBuy" OnEditCommand="dgEdit_CartBuy" OnItemCommand="dgCartBuy_ItemCommand" OnItemDataBound="dgCartBuy_ItemDataBound" OnUpdateCommand="dgUpdate_CartBuy" ShowFooter="true" Width="80%" CellPadding="10" CellSpacing="30" Height="80px">
                <AlternatingItemStyle CssClass="Even_Row_User" />
                <HeaderStyle CssClass="Table_Header_User" />
                <Columns>
                    <asp:TemplateColumn>
                            <ItemTemplate>
                                <asp:Label ID="lbl_CartBuy_ID" Runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "cart_id") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="0%"/>
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Product Image">
                        <ItemTemplate>
                            <asp:Image ID="imgPd" runat="server" Height="100px"
                            ImageUrl='<%#"~/Images/"+Eval("productrent_image").ToString() %>' Width="80px" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Image ID="imgPd" runat="server" Height="100px"
                            ImageUrl='<%#"~/Images/"+Eval("productrent_image").ToString() %>' Width="80px" />
                        </EditItemTemplate>
                        <ItemStyle Width="10%"/>
                        <HeaderStyle Font-Bold="True" />
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Product Name">
                        <ItemTemplate>
                            <asp:Label ID="lbl_ProductBuy_Name" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "productrent_name") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="lbl_ProductBuy_Name" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "productrent_name") %>'></asp:Label>
                        </EditItemTemplate>
                        <FooterTemplate>
                                <asp:Label ID="lbl_depositname" Runat="server" Text="Deposit (RM50.00) "></asp:Label>
                         </FooterTemplate>
                        <ItemStyle Width="23%" />
                        <FooterStyle height="80px"/>
                        <HeaderStyle Font-Bold="True"/>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Product Price">
                        <ItemTemplate>
                            <asp:Label ID="Label3" Runat="server" Text="RM"></asp:Label>
                            <asp:Label ID="lbl_ProductBuy_Price" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "productrent_price", "{0:n}") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="Label3" Runat="server" Text="RM"></asp:Label>
                            <asp:Label ID="lbl_ProductBuy_Price" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "productrent_price", "{0:n}") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemStyle Width="13%" />
                        <HeaderStyle Font-Bold="True" />
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:Label ID="lbl_quantity" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "quantity") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox class="textbox_qtys" ID="txtbox_qty" TextMode="Number" Value='<%# DataBinder.Eval(Container.DataItem, "quantity") %>' min="1" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                                <asp:Label ID="lblx" Runat="server" Text="x "></asp:Label>
                                <asp:Label ID="lbl_totalqty" Runat="server" ></asp:Label>
                        </FooterTemplate>
                        <ItemStyle Width="5%" />
                        <HeaderStyle Font-Bold="True" />
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="From">
                        <ItemTemplate>
                            <asp:Label ID="lbl_from" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "date_from", "{0:dd/MM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>  
                        <EditItemTemplate>
                            <asp:TextBox class="txtboxdates" ID="txtbox_from" TextMode="Date" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemStyle Width="10%" />
                        <HeaderStyle Font-Bold="True" />
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="To">
                        <ItemTemplate>
                            <asp:Label ID="lbl_to" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "date_to", "{0:dd/MM/yyyy}") %>'></asp:Label>
                        </ItemTemplate> 
                        <EditItemTemplate>
                            <asp:TextBox class="txtboxdates" ID="txtbox_to" TextMode="Date" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemStyle Width="10%" />
                        <HeaderStyle Font-Bold="True" />
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Duration (day)">
                        <ItemTemplate>
                            <asp:Label ID="lbl_renting_period" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "renting_period") %>'></asp:Label> 
                        </ItemTemplate>                    
                        <ItemStyle Width="8%" />
                        <HeaderStyle Font-Bold="True" />
                    </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Total Price">
                        <ItemTemplate>
                            <asp:Label ID="Label4" Runat="server" Text="RM"></asp:Label>
                             <asp:Label ID="lbl_total_Price" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "total_price", "{0:n}") %>'></asp:Label>   
                        </ItemTemplate>
                            <EditItemTemplate>
                            <asp:Label ID="Label4" Runat="server" Text="RM"></asp:Label>
                             <asp:Label ID="lbl_total_Price" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "total_price", "{0:n}") %>'></asp:Label>   
                        </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="lblrm" Runat="server" Text="RM "></asp:Label>
                                <asp:Label ID="lbl_totaldeposit" Runat="server"></asp:Label>
                        </FooterTemplate>
                        <ItemStyle Width="10%" />
                        <HeaderStyle Font-Bold="True" />
                    </asp:TemplateColumn>
                         <asp:EditCommandColumn ButtonType="PushButton" CancelText="Cancel" EditText="Update" HeaderText="Update" UpdateText="Update"><HeaderStyle Font-Bold="True" /></asp:EditCommandColumn>
                    <asp:TemplateColumn HeaderText="Update / Delete">
                        <HeaderStyle Font-Bold="True" />
                        <ItemTemplate>                          
                            <asp:Button ID="btnDeleteCartBuy" Runat="server" CommandName="DeleteCartBuy" Text="Delete" />
                        </ItemTemplate>
                        <ItemStyle Width="50%" />
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
