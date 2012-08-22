<%@ Page Language="C#" AutoEventWireup="true" CodeFile="u_ClearAwardList.aspx.cs"
    Inherits="u_ClearAwardList" %>

<%@ Register Src="user_Left.ascx" TagName="user_Left" TagPrefix="uc1" %>
<%@ Register Src="user_Bottom.ascx" TagName="user_Bottom" TagPrefix="uc2" %>
<%@ Register Src="user_Top.ascx" TagName="user_Top" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>奖金查看</title>
    <link rel="Stylesheet" type="text/css" href="Css/Main.css" />
    <style type="text/css">
        .gv1
        {
            width: 95%;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <center>
        <form id="form1" runat="server">
        <div id="top">
            <uc3:user_Top ID="user_Top1" runat="server" />
        </div>
        <div id="main">
            <div id="left">
                <uc1:user_Left ID="user_Left1" runat="server" />
            </div>
            <div id="right">
                <table width="1000" height="80" border="0" align="center" cellpadding="0" cellspacing="0"
                    background="images/imagdsde3.jpg">
                    <tr>
                        <td>
                            <div class="k1">
                                奖金查看</div>
                        </td>
                    </tr>
                </table>
                <img src="images/tongji_001.png" /><br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="gv1"
                    OnRowDataBound="GridView1_RowDataBound">
                    <Columns>
                        <asp:BoundField HeaderText="会员账号">
                            <HeaderStyle Height="23px" BackColor="#9C0203" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="直接销售奖">
                            <HeaderStyle Height="23px" BackColor="#9C0203" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="市场推广奖">
                            <HeaderStyle Height="23px" BackColor="#9C0203" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="销售管理奖">
                            <HeaderStyle Height="23px" BackColor="#9C0203" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="分红奖">
                            <HeaderStyle Height="23px" BackColor="#9C0203" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="总奖金">
                            <HeaderStyle Height="23px" BackColor="#9C0203" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="强制钱包">
                            <HeaderStyle Height="23px" BackColor="#9C0203" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="现金账户">
                            <HeaderStyle Height="23px" BackColor="#9C0203" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="详细">
                            <ItemTemplate>
                                <asp:LinkButton ID="ToSee" runat="server">查看</asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle BackColor="#9C0203" ForeColor="White" />
                            <ItemStyle Height="23px" HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div id="bottom">
            <uc2:user_Bottom ID="user_Bottom1" runat="server" />
        </div>
        </form>
    </center>
</body>
</html>
