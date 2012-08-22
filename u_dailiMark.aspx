<%@ Page Language="C#" AutoEventWireup="true" CodeFile="u_dailiMark.aspx.cs" Inherits="u_dailiMark" %>

<%@ Register Src="user_Top.ascx" TagName="user_Top" TagPrefix="uc1" %>
<%@ Register Src="user_Bottom.ascx" TagName="user_Bottom" TagPrefix="uc2" %>
<%@ Register Src="user_Left.ascx" TagName="user_Left" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>会员管理</title>
    <link rel="Stylesheet" type="text/css" href="Css/Main.css" />
    <style type="text/css">
        .gv1
        {
            width: 95%;
            margin-top: 20px;
            line-height: 22px;
        }
        .aduaDiv
        {
            width: 90%;
            margin-top: 30px;
            margin-left: 30px;
            padding-left: 15px;
            font-size: 13px;
            vertical-align: bottom;
        }
    </style>
    <script type="text/javascript">
        function isSen() {
            if (confirm("您确定要审核吗？")) {
                return true;
            }
            else {
                return false;
            }
        }

        function isDel() {
            if (confirm("您确定要删除吗？")) {
                return true;
            }
            else {
                return false;
            }
        }
    </script>
</head>
<body>
    <center>
        <form id="form1" runat="server">
        <div id="top">
            <uc1:user_Top ID="user_Top1" runat="server" />
        </div>
        <div id="main">
            <div id="left">
                <uc3:user_Left ID="user_Left1" runat="server" />
            </div>
            <div id="right">
                <table width="1000" height="80" border="0" align="center" cellpadding="0" cellspacing="0"
                    background="images/imagdsde3.jpg">
                    <tr>
                        <td>
                            <div class="k1">
                                会员管理</div>
                        </td>
                    </tr>
                </table>
                <br />
                <div class="zi" id="ShowMsg" runat="server">
                </div>
                <br />
                <asp:Button ID="Button1" runat="server" Text="全部会员" ToolTip="0" OnClick="Button4_Click" />
                &nbsp;&nbsp;
                <asp:Button ID="Button4" runat="server" Text="未审核" ToolTip="2" OnClick="Button4_Click" />
                &nbsp;&nbsp;
                <asp:Button ID="Button5" runat="server" Text="已审核" ToolTip="1" OnClick="Button4_Click" />
                &nbsp;&nbsp;
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="gv1"
                    OnRowDataBound="GridView1_RowDataBound">
                    <Columns>
                        <asp:BoundField HeaderText="会员账号">
                            <HeaderStyle BackColor="#9C0203" ForeColor="White" />
                            <ItemStyle BorderColor="#D3CDD0" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center"
                                VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="推荐人账号">
                            <HeaderStyle BackColor="#9C0203" ForeColor="White" />
                            <ItemStyle BorderColor="#D3CDD0" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center"
                                VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="安置人">
                            <HeaderStyle BackColor="#9C0203" ForeColor="White" />
                            <ItemStyle BorderColor="#D3CDD0" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center"
                                VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="级别">
                            <HeaderStyle BackColor="#9C0203" ForeColor="White" />
                            <ItemStyle BorderColor="#D3CDD0" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center"
                                VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="昵称">
                            <HeaderStyle BackColor="#9C0203" ForeColor="White" />
                            <ItemStyle BorderColor="#D3CDD0" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center"
                                VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="入单时间">
                            <HeaderStyle BackColor="#9C0203" ForeColor="White" />
                            <ItemStyle BorderColor="#D3CDD0" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center"
                                VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="联系电话">
                            <HeaderStyle BackColor="#9C0203" ForeColor="White" />
                            <ItemStyle BorderColor="#D3CDD0" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center"
                                VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="审核">
                            <ItemTemplate>
                                <asp:LinkButton ID="ToSen" runat="server" CausesValidation="False" OnClick="ToSen_Click">审核</asp:LinkButton>&nbsp;&nbsp;
                                <asp:LinkButton ID="ToDel" runat="server" CausesValidation="False" OnClick="ToDel_Click">删除</asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle BackColor="#9C0203" ForeColor="White" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <div id="pagediv" runat="server" style="text-align: center; margin-top: 10px; margin-bottom: 10px">
                    共有<asp:Label runat="server" ID="AllPagelb"></asp:Label>页&nbsp;&nbsp;<asp:LinkButton
                        ID="BackBt" runat="server" OnClick="left_Click" CausesValidation="False">上一页</asp:LinkButton>
                    &nbsp;&nbsp;<asp:LinkButton runat="server" ID="FromBt" OnClick="Right_Click" CausesValidation="False">下一页</asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;当前第<asp:Label
                        runat="server" ID="NowPagelb"></asp:Label>页&nbsp;&nbsp;转到第<asp:TextBox runat="server"
                            ID="pagetx" Width="40px"></asp:TextBox>页<asp:Button ID="Gobt" runat="server" Text="Go"
                                CausesValidation="False" UseSubmitBehavior="False" OnClick="Gobt_Click" Style="height: 26px" />
                    共有<asp:Label ID="allnumlb" runat="server"></asp:Label>条记录，当前显示第
                    <asp:Label ID="nownumlb" runat="server"></asp:Label>条
                </div>
            </div>
        </div>
        <div id="bottom">
            <uc2:user_Bottom ID="user_Bottom1" runat="server" />
        </div>
        </form>
    </center>
</body>
</html>
