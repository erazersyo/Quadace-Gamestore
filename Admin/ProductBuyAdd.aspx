<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProductBuyAdd.aspx.cs" Inherits="QuadaceGamestore.Admin.ProductBuyAdd" %>
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
          <li><a href="ManageOrder.aspx">Manage Order</a></li>
          <li><a href="ManageUser.aspx">Manage User</a></li>
          <li><a href="GenerateReport.aspx">Generate Report</a></li>
        </ul>

        <div style="margin-left:20%;padding:1px 16px;height:1000px;">
          <h1>Add Product for Buy</h1>
            <table class="tables">
                <tr>
                    <td style="width:100px;"><p>Image:</p></td>
                    <td><asp:FileUpload ID="imageAdd" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="width:00px;"><p>Name:</p></td>
                    <td><asp:TextBox style="width:350px; height:25px;" ID="nameAdd" ValidationGroup="ProductAdd" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator" ValidationGroup="ProductAdd" runat="server" ControlToValidate="nameAdd" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>  
                    </td>
                </tr>
                <tr>
                    <td style="width:100px;"><p>Category:</p></td>
                    <td><asp:DropDownList CssClass="dropdowns" ID="categoryAdd" runat="server">
                            <asp:ListItem>Nintendo</asp:ListItem>
                            <asp:ListItem>Play Station</asp:ListItem>
                            <asp:ListItem>XBox</asp:ListItem>
                            <asp:ListItem>PC Gaming</asp:ListItem>
                            <asp:ListItem>Others</asp:ListItem>
                         </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width:100px;"><p>Price:</p></td>
                    <td><asp:TextBox class="textbox" ID="priceAdd" ValidationGroup="ProductAdd" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="ProductAdd" runat="server" ControlToValidate="priceAdd" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>  
                    </td>
                </tr>
                <tr>
                    <td style="width:100px;"><p>Quantity:</p></td>
                    <td><asp:TextBox class="textbox" ID="quantityAdd" ValidationGroup="ProductAdd" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="ProductAdd" runat="server" ControlToValidate="quantityAdd" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>  
                    </td>
                </tr>
                <tr>
                    <td style="width:100px; float:left;"><p>Description:</p></td>
                    <td><asp:TextBox class="txtdesc" ID="descriptionAdd" ValidationGroup="ProductAdd" TextMode="MultiLine" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="ProductAdd" runat="server" ControlToValidate="descriptionAdd" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>  
                    </td>
                </tr>
            </table>
            <br />
            <asp:Button ID="UpdateClick" ValidationGroup="ProductAdd" CssClass="btn_edit" runat="server" Text="Add" OnClick="Add_Click" />
            <br /><br />
            <asp:Button ID="BackClick" CssClass="btn_edit" runat="server" Text="Back" OnClick="Back_Click" />
</asp:Content>
