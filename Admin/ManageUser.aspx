<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="ManageUser.aspx.cs" Inherits="QuadaceGamestore.Admin.ManageUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../Styles/style.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
             <div style="height:10vh"></div>
        <div class="topheader">
            <div class="header">
                <div><img alt="" src="https://i.imgur.com/mMYeIMf.png" width="300" height="75"></a></div>
                <div class="header_center"></div>
                <div class="right_navigator">
				    <ul>
					    <li><a href="../Login.aspx"><i class="fa fa-lock"></i> Login</a></li>
				    </ul>
			    </div>
            </div>
        </div> 
        <ul class="list">
          <li><br /></li>
          <li><a href="ManageProduct.aspx">Manage Product</a></li>
          <div class="dropdowned">
          <li class="dropbtned"><a href="#">Manage Order <i class="fa fa-angle-down" style="padding-left:73px;"></i></a></li>
            <div class="dropdown-contented">
                <a href="ManageOrder.aspx">Buy</a>
                <a href="ManageOrderRent.aspx">Rent</a>
                <a href="ManageOrderTrade.aspx">Trade</a>
            </div>
          </div>
          <li><a class="active" href="ManageUser.aspx">Manage User</a></li>
          <li><a href="GenerateReport.aspx">Generate Report</a></li>
        </ul>

        <div style="margin-left:20%;padding:1px 16px;height:1000px;">
          <h2>Manage User</h2>
           <asp:TextBox ID="search_user" style="width:300px; height:25px; font-size:16px;" placeholder="Search..." runat="server"></asp:TextBox> 
            <asp:Button ID="btn_search" runat="server" CssClass="btn_edit" Text="Search" OnClick="Search_Click" />
            <br /><br />
            <asp:DataGrid ID="dgUser" CssClass="datagrid" runat="server" AllowPaging="True" AutoGenerateColumns="false" OnCancelCommand="dgCancel_User" OnEditCommand="dgEdit_User" OnItemCommand="dgUser_ItemCommand" OnItemDataBound="dgUser_ItemDataBound" OnPageIndexChanged="dgUser_PageIndexChanged" OnUpdateCommand="dgUpdate_User" PageSize="20" ShowFooter="true" Width="1150px" CellPadding="10" CellSpacing="30" Height="80px">
                    <AlternatingItemStyle CssClass="Even_Row_User" />
                    <HeaderStyle CssClass="Table_Header_User" />
                    <Columns>
                        <asp:TemplateColumn HeaderText="No">
                            <ItemTemplate>
                                <asp:Label ID="IDUser" Runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "user_id") %>'></asp:Label>
                                <asp:Label ID="lbl_User_ID" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "user_id") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_IDUser" runat="server" Visible="false" Text='<%#DataBinder.Eval(Container.DataItem, "user_id") %>'></asp:TextBox>
                                <asp:TextBox ID="txt_User_ID" runat="server" MaxLength="50" class="update_textbox" Text='<%# DataBinder.Eval(Container.DataItem, "user_id") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemStyle Width="8%"/>
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Username">
                            <ItemTemplate>
                                <asp:Label ID="lbl_User_Name" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "user_name") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_User_Name" runat="server" MaxLength="50" class="update_textbox" Text='<%# DataBinder.Eval(Container.DataItem, "user_name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txt_User_Name_New" MaxLength="50" class="update_textbox" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemStyle Width="25%" />
                            <HeaderStyle Font-Bold="True"/>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="User Email">
                            <ItemTemplate>
                                <asp:Label ID="lbl_User_Email" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "user_email") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_User_Email" runat="server" MaxLength="50" class="update_textbox" Text='<%# DataBinder.Eval(Container.DataItem, "user_email") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txt_User_Email_New" MaxLength="50" class="update_textbox" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemStyle Width="25%" />
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="User Password">
                            <ItemTemplate>
                                <asp:Label ID="lbl_User_Password" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "user_pass") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_User_Pass" runat="server" MaxLength="50" class="update_textbox" Text='<%# DataBinder.Eval(Container.DataItem, "user_pass") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txt_User_Pass_New" class="update_textbox" MaxLength="50"  runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemStyle Width="25%" />
                            <HeaderStyle Font-Bold="True" />
                        </asp:TemplateColumn>
                         <asp:EditCommandColumn ButtonType="PushButton" CancelText="Cancel" EditText="Update" HeaderText="Update" UpdateText="Update"><HeaderStyle Font-Bold="True" /></asp:EditCommandColumn>
                        <asp:TemplateColumn HeaderText="Delete">
                            <HeaderStyle Font-Bold="True" />
                            <ItemTemplate>
                                <asp:Button ID="btnDeleteUser" CssClass="button" Runat="server" CommandName="DeleteUser" Text="Delete" />
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:Button ID="btnAddUser" CssClass="button" Runat="server" CommandName="AddUser" Text="Add" />
                            </FooterTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                    <PagerStyle Mode="NumericPages" />
                </asp:DataGrid>
                <asp:Label ID="lblAttention" runat="server" CssClass="Note"></asp:Label>
        </div>
</asp:Content>

