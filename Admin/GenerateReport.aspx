<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="GenerateReport.aspx.cs" Inherits="QuadaceGamestore.Admin.GenerateReport" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
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
          <div class="dropdowned">
          <li class="dropbtned"><a href="#">Manage Order <i class="fa fa-angle-down" style="padding-left:73px;"></i></a></li>
            <div class="dropdown-contented">
                <a href="ManageOrder.aspx">Buy</a>
                <a href="ManageOrderRent.aspx">Rent</a>
                <a href="ManageOrderTrade.aspx">Trade</a>
            </div>
          </div>
          <li><a href="ManageUser.aspx">Manage User</a></li>
          <li><a class="active" href="GenerateReport.aspx">Generate Report</a></li>
        </ul>

        <div style="margin-left:20%;padding:1px 16px;height:800px;">
          <h2>Generate Report</h2>
            <div class="centereds">
                <div class="lefteds">
                    <asp:DataList ID="DataList1" runat="server"  Width="250px" >         
                        <ItemTemplate>
                                 <asp:Label ID="lbl_todaybuy" style="font-weight:bold;" runat="server" Text="Today's Buy Order: "></asp:Label><br /><br />
                                 <asp:Label ID="lbl_tradeid1" style="padding-left:50px;" runat="server" Text='<%# Bind("todaybuy") %>'></asp:Label>
                        </ItemTemplate>       
                    </asp:DataList>
                </div>
                <div class="leftright">
                    <asp:DataList ID="DataList2" runat="server" Width="250px" >         
                        <ItemTemplate>
                            <div>
                                 <asp:Label ID="lbl_todayrent" style="font-weight:bold;" runat="server" Text="Today's Rent Order: "></asp:Label><br /><br />
                                 <asp:Label ID="lbl_tradeid2" style="padding-left:50px;" runat="server" Text='<%# Bind("todayrent") %>'></asp:Label>
                            </div>
                        </ItemTemplate>       
                    </asp:DataList>
                </div>
                <div class="righteds">
                    <asp:DataList ID="DataList3" runat="server" Width="250px" >         
                        <ItemTemplate>
                                 <asp:Label ID="lbl_todaysale" style="font-weight:bold;" runat="server" Text="Today's Sales : "></asp:Label><br /><br />
                                 RM<asp:Label ID="lbl_tradeid3" style="padding-left:50px;" runat="server" Text='<%# Bind("todaysale", "{0:n}") %>'></asp:Label>
                        </ItemTemplate>       
                    </asp:DataList>
                </div>
            </div>
            <br /><br />
        <div class="centeredz">
            <div class="leftedz">
                <h3 style="padding-left:15px;">Total Buy Sales According to Date</h3>
                    <asp:Chart ID="Chart1" runat="server" Width="488px">  
                    <series>  
                        <asp:Series Name="Series1" XValueMember="0" YValueMembers="1">  
                        </asp:Series>  
                    </series>  
                    <chartareas>  
                        <asp:ChartArea Name="ChartArea1">  
                        </asp:ChartArea>  
                    </chartareas>  
                </asp:Chart>
            </div>
            <div class="rightedz">
                <h3 style="padding-left:15px;">Total Buy Order According to Date</h3>
                    <asp:Chart ID="Chart2" runat="server" Width="488px">  
                    <series>  
                        <asp:Series Name="Series2" XValueMember="0" YValueMembers="1">  
                        </asp:Series>  
                    </series>  
                    <chartareas>  
                        <asp:ChartArea Name="ChartArea1">  
                        </asp:ChartArea>  
                    </chartareas>  
                </asp:Chart>
            </div>
        </div><br />
                    <div class="centeredz">
            <div class="leftedz">
                <h3 style="padding-left:15px;">Total Rent Sales According to Date</h3>
                    <asp:Chart ID="Chart3" runat="server" Width="488px">  
                    <series>  
                        <asp:Series Name="Series1" XValueMember="0" YValueMembers="1">  
                        </asp:Series>  
                    </series>  
                    <chartareas>  
                        <asp:ChartArea Name="ChartArea1">  
                        </asp:ChartArea>  
                    </chartareas>  
                </asp:Chart>
            </div>
            <div class="rightedz">
                <h3 style="padding-left:15px;">Total Rent Order According to Date</h3>
                    <asp:Chart ID="Chart4" runat="server" Width="488px">  
                    <series>  
                        <asp:Series Name="Series2" XValueMember="0" YValueMembers="1">  
                        </asp:Series>  
                    </series>  
                    <chartareas>  
                        <asp:ChartArea Name="ChartArea1">  
                        </asp:ChartArea>  
                    </chartareas>  
                </asp:Chart>
            </div>
        </div>
            <br /><br /><br />
        </div>
    
</asp:Content>

