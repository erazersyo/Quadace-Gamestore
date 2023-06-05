<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="ManageProduct.aspx.cs" Inherits="QuadaceGamestore.Admin.ManageProduct" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../Styles/style.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div style="height:10vh"></div>
        <div class="topheader">
            <div class="header">
                <div><img alt="" src="https://i.imgur.com/mMYeIMf.png" width=300" height="75"></div>
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
          <li><a class="active" href="ManageProduct.aspx">Manage Product</a></li>
          <div class="dropdowned">
          <li class="dropbtned"><a href="#">Manage Order <i class="fa fa-angle-down" style="padding-left:73px;"></i></a></li>
            <div class="dropdown-contented">
                <a href="ManageOrder.aspx">Buy</a>
                <a href="ManageOrderRent.aspx">Rent</a>
                <a href="ManageOrderTrade.aspx">Trade</a>
            </div>
          </div>
          <li><a href="ManageUser.aspx">Manage User</a></li>
          <li><a href="GenerateReport.aspx">Generate Report</a></li>
        </ul>

        <div style="margin-left:20%;padding:1px 16px;height:1000px;">
          <h2>Manage Product</h2>
            <div class="dropdown">
                <button class="dropbtn">Buy    <i class="fa fa-angle-down"></i></button>
                    <div class="dropdown-content">
                        <a href="ManageProduct.aspx">Buy</a>
                        <a href="ManageProductRent.aspx">Rent</a>
                    </div>
			 </div>
            <br /><br />
            <asp:TextBox ID="search_product" style="width:300px; height:25px; font-size:16px;" placeholder="Search..." runat="server"></asp:TextBox>
            <asp:Button ID="btn_search" runat="server" CssClass="btn_edit" Text="Search" OnClick="SearchProduct_Click" />
            <asp:Button ID="btn_add" runat="server" CssClass="btn_add" Text="Add" OnClick="Add_Click" />
            <br /><br />

            <asp:DataGrid ID="dgProductBuy" CssClass="datagrid" runat="server" AllowPaging="True" AutoGenerateColumns="false" OnCancelCommand="dgCancel_ProductBuy" OnEditCommand="dgEdit_ProductBuy" OnItemCommand="dgProductBuy_ItemCommand" OnItemDataBound="dgProductBuy_ItemDataBound" OnPageIndexChanged="dgProductBuy_PageIndexChanged" OnUpdateCommand="dgUpdate_ProductBuy" PageSize="10" ShowFooter="true" Width="1150px" CellPadding="10" CellSpacing="30" Height="80px">
                    <AlternatingItemStyle CssClass="Even_Row_User" />
                    <HeaderStyle CssClass="Table_Header_User" />
                    <Columns>
                        <asp:TemplateColumn HeaderText="Product ID">
                            <ItemTemplate>
                                <asp:Label ID="IDProductBuy" Runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "productbuy_id") %>'></asp:Label>
                                <asp:Label ID="lbl_ProductBuy_ID" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "productbuy_id") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="5%"/>
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Product Image">
                            <ItemTemplate>
                                <asp:Image ID="imgPd" runat="server" Height="100px"
                                ImageUrl='<%#"~/Images/"+Eval("productbuy_image").ToString() %>' Width="80px" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:FileUpload ID="FileUploadGV" runat="server" />
                            </EditItemTemplate>
                            <ItemStyle Width="15%"/>
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Product Name">
                            <ItemTemplate>
                                <asp:Label ID="lbl_ProductBuy_Name" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "productbuy_name") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_ProductBuy_Name" runat="server" MaxLength="50" class="update_textbox" Text='<%# DataBinder.Eval(Container.DataItem, "productbuy_name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemStyle Width="35%" />
                            <HeaderStyle Font-Bold="True"/>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Product Category">
                            <ItemTemplate>
                                <asp:Label ID="lbl_ProductBuy_Category" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "productbuy_category") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddledit_ProductBuy" runat="server">
                                    <asp:ListItem>Nintendo</asp:ListItem>
                                    <asp:ListItem>Play Station</asp:ListItem>
                                    <asp:ListItem>XBox</asp:ListItem>
                                    <asp:ListItem>PC Gaming</asp:ListItem>
                                    <asp:ListItem>Others</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemStyle Width="15%" />
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Product Price">
                            <ItemTemplate>
                                <asp:Label ID="lbl_ProductBuy_Price" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "productbuy_price", "{0:n}") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_ProductBuy_Price" runat="server" MaxLength="50" class="update_textbox" Text='<%# DataBinder.Eval(Container.DataItem, "productbuy_price", "{0:n}") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemStyle Width="15%" />
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Product Quantity">
                            <ItemTemplate>
                                <asp:Label ID="lbl_ProductBuy_Quantity" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "productbuy_quantity") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_ProductBuy_Quantity" runat="server" MaxLength="50" class="update_textbox" Text='<%# DataBinder.Eval(Container.DataItem, "productbuy_quantity") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemStyle Width="8%" />
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                         <asp:TemplateColumn HeaderText="Product Description">
                            <ItemTemplate>
                                
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_ProductBuy_Description" runat="server" TextMode="MultiLine" class="update_textbox" Text='<%# DataBinder.Eval(Container.DataItem, "productbuy_description") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemStyle Width="20%" />
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                         <asp:EditCommandColumn ButtonType="PushButton" CancelText="Cancel" EditText="Update" HeaderText="Update" UpdateText="Update"><HeaderStyle Font-Bold="True" /></asp:EditCommandColumn>
                        <asp:TemplateColumn HeaderText="Delete">
                            <HeaderStyle Font-Bold="True" />
                            <ItemTemplate>
                                <asp:Button ID="btnDeleteProductBuy" CssClass="button" Runat="server" CommandName="DeleteProductBuy" Text="Delete" />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                    <PagerStyle Mode="NumericPages" />
                </asp:DataGrid>
            <asp:Label ID="lblAttention" runat="server"></asp:Label>
</asp:Content>


