<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="CheckoutRent.aspx.cs" Inherits="QuadaceGamestore.User.CheckoutRent" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../Styles/Login.css">
    <link rel="stylesheet" type="text/css" href="../Styles/sidebar.css" />
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
        </div> <br />
    <div style="justify-content:center; display:flex; flex-direction:row;">
        <div class="center-blank">
            <div class ="left-checkouts">
                <h3 style="font-size:24px;">Shipping Address</h3>
                <table>
                <tr>
                    <td style="width:120px;"><p>Name :</p></td>
                    <td><asp:TextBox class="textboxc" ID="name" ValidationGroup="AddressFrame" runat="server"></asp:TextBox>
                        <asp:Label ID="labelname" style="color:red;" runat="server"></asp:Label>
                        <asp:RequiredFieldValidator ID="names" ValidationGroup="AddressFrame" runat="server" ControlToValidate="name" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>  
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;"><p>Street :</p></td>
                    <td><asp:TextBox class="textboxc" ID="street" ValidationGroup="AddressFrame" runat="server" placeholder="House number and street name"></asp:TextBox>
                        <asp:Label ID="labelstreet" style="color:red;" runat="server"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="AddressFrame" runat="server" ControlToValidate="street" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>  
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;"><p>Town :</p></td>
                    <td><asp:TextBox class="textboxc" ID="town" ValidationGroup="AddressFrame" runat="server"></asp:TextBox>
                        <asp:Label ID="labeltown" style="color:red;" runat="server"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="AddressFrame" runat="server" ControlToValidate="town" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>   
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;"><p>State :</p></td>
                    <td><asp:DropDownList CssClass="dropdowns" ID="state" runat="server">
                            <asp:ListItem>Johor</asp:ListItem>
                            <asp:ListItem>Kedah</asp:ListItem>
                            <asp:ListItem>Kelantan</asp:ListItem>
                            <asp:ListItem>Malacca</asp:ListItem>
                            <asp:ListItem>Negeri Sembilan</asp:ListItem>
                            <asp:ListItem>Pahang</asp:ListItem>
                            <asp:ListItem>Penang</asp:ListItem>
                            <asp:ListItem>Perak</asp:ListItem>
                            <asp:ListItem>Perlis</asp:ListItem>
                            <asp:ListItem>Sabah</asp:ListItem>
                            <asp:ListItem>Selangor</asp:ListItem>
                            <asp:ListItem>Terengganu</asp:ListItem>
                         </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;"><p>Postcode/ZIP :</p></td>
                    <td><asp:TextBox class="textboxc" ID="postcode" ValidationGroup="AddressFrame" runat="server"></asp:TextBox>
                        <asp:Label ID="labelpostocde" style="color:red;" runat="server"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3"  ValidationGroup="AddressFrame" runat="server" ControlToValidate="postcode" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="rvclass" runat="server" ControlToValidate="postcode" ErrorMessage="Postcode must be 5 numeric digits" MaximumValue="99999" MinimumValue="10000" Type="Integer" ForeColor="Red"></asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;"><p>Phone :</p></td>
                    <td><asp:TextBox class="textboxc" ID="phone" ValidationGroup="AddressFrame" runat="server"></asp:TextBox>
                        <asp:Label ID="labelphone" style="color:red;" runat="server"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="AddressFrame" runat="server" ControlToValidate="phone" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>  
                    </td>
                </tr>
                <tr>
                    <td style="width:120px; float:left;"><p>Notes :</p></td>
                    <td><asp:TextBox class="txtdesc" ID="notes" TextMode="MultiLine" runat="server"></asp:TextBox></td>
                    <asp:Label ID="LabelAttention" runat="server" ForeColor="Red"></asp:Label>
                    <asp:Label ID="lblOrderId" runat="server" Text="Label" Visible="False"></asp:Label>
                </tr>
            </table>
            </div>
            <div class="right-checkouts">
                <br /><br />
                <div style="border:solid 1px; padding:20px 20px 20px 20px;">
                <h3>YOUR ORDER</h3>
                <asp:DataGrid ID="dgCheckout" CssClass="datagridc" runat="server" OnItemDataBound="dgCheckoutBuy_ItemDataBound" AutoGenerateColumns="False" Width="500px">
                    <AlternatingItemStyle CssClass="Even_Row_Checkout" />
                    <HeaderStyle CssClass="Table_Header_Checkout" />
                    <Columns>
                        <asp:TemplateColumn HeaderText="Product">
                        <ItemTemplate>
                            <asp:Label ID="lbl_pdid" Runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "productrent_id") %>'></asp:Label>
                            <asp:Label ID="lbl_Name" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "productrent_name") %>'></asp:Label>
                        </ItemTemplate>
                         <FooterTemplate>
                                <asp:Label ID="lbl_depositname" Runat="server" Text="Deposit (RM50.00) "></asp:Label>
                         </FooterTemplate>
                        <ItemStyle Width="28%"/>
                        <FooterStyle height="80px"/>
                        <HeaderStyle Font-Bold="True"/>
                    </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="From">
                        <ItemTemplate>
                            <asp:Label ID="lbl_from" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "date_from", "{0:dd/MM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Font-Bold="True"/>
                            <ItemStyle Width="13%"/>
                    </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="To">
                        <ItemTemplate>
                            <asp:Label ID="lbl_to" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "date_to" , "{0:dd/MM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Font-Bold="True"/>
                            <ItemStyle Width="13%"/>
                    </asp:TemplateColumn>
                        <asp:TemplateColumn>
                        <ItemTemplate>
                            <asp:Label ID="Label2" Runat="server" Text="x"></asp:Label>
                            <asp:Label ID="lbl_Amount" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "quantity") %>'></asp:Label>
                        </ItemTemplate>
                         <FooterTemplate>
                                <asp:Label ID="lblx" Runat="server" Text="x "></asp:Label>
                                <asp:Label ID="lbl_totalqty" Runat="server" ></asp:Label>
                        </FooterTemplate>
                        <HeaderStyle Font-Bold="True"/>
                            <ItemStyle Width="5%"/>
                    </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Total">
                        <ItemTemplate>
                            <asp:Label ID="Label3" Runat="server" Text="RM"></asp:Label>
                            <asp:Label ID="lbl_Total" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "total_price" , "{0:n}") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                                <asp:Label ID="lblrm" Runat="server" Text="RM "></asp:Label>
                                <asp:Label ID="lbl_totaldeposit" Runat="server"></asp:Label>
                        </FooterTemplate>
                            <ItemStyle Width="13%"/>
                        <HeaderStyle Font-Bold="True"/>
                    </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid>
                <div style="width:95%; text-align:right;">
                    <asp:Label ID="Label1" Runat="server" style="text-align:right;" Text="Total : RM "></asp:Label>
                    <asp:Label ID="lbl_total_Prices" Runat="server" style="text-align:right;"></asp:Label>
                </div><br /><br />
                <asp:CheckBox ID="CheckBox1" style="width:5px; height:5px;" runat="server" Text=" I have read and agree to the website terms and conditions *" /><br /><br />
                    <asp:Label ID="Label2" Runat="server" style="color:red; font-size:14px;"></asp:Label>
                <asp:Button ID="btnCheckout" ValidationGroup="AddressFrame" CssClass="button_po" Runat="server" Text="PLACE ORDER" OnClick="PO_Click"  OnClientClick="javascript:return confirm('Are you sure you want place the order?');"/>
                </div>
            </div>
    </div>     
</asp:Content>
