<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="QRCode.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>后台管理</title>
    <link href="Styles/admin.css" rel="stylesheet" />
    <script type="text/javascript" src="Script/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="Script/comm.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="setBrand">
            <h1>品牌商管理</h1>
            <p>已有品牌</p>
            <div style="display: block; float: none; overflow: hidden;">
                <ul class="brandList">
                    <%
                        foreach (var item in ListBrand)
                        {
                    %>
                    <li><%= item.Brand %>  -  <%=item.Norms %></li>
                    <%
                        } %>
                </ul>
            </div>
            <div style="display: block; float: none; overflow: hidden;">
                选择品牌：<asp:DropDownList ID="ddlBrand" runat="server">
                </asp:DropDownList>
                输入规格<asp:TextBox runat="server" ID="txtBrand" />
                <asp:Button Text="新增" runat="server" ID="btnAddBrand" OnClick="btnAddBrand_Click" />
            </div>
        </div>
        <div id="setUrl">
            选择品牌规格：<asp:DropDownList ID="ddlBrandNorms" runat="server">
            </asp:DropDownList>
            数量：
            <asp:TextBox runat="server" ID="txtCount" />
            <asp:Button Text="生成二维码链接" runat="server" ID="btnCreate" OnClick="btnCreate_Click" />
            <div>
                <table class="tbScan">
                    <tr>
                        <th>编码
                        </th>
                        <th>品牌
                        </th>
                        <th>访问地址
                        </th>
                        <th>扫码数量
                        </th>
                    </tr>
                    <%
                        foreach (var item in scanList)
                        {
                    %>
                    <tr>
                        <td>
                            <%=item.Code %>
                        </td>
                        <td>
                            <%= Common.Main.GetBrandStr(item.Brand) %>
                        </td>
                        <td>
                            <%=item.URL %>
                        </td>
                        <td>
                            <%=item.Count %>
                        </td>
                    </tr>
                    <%
                        } %>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
