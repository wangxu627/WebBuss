<%@ Page Language="C#" AutoEventWireup="true" CodeFile="u_ZhuanzhangListTwo.aspx.cs"
    Inherits="u_ZhuanzhangListTwo" %>

<%@ Register Src="user_Bottom.ascx" TagName="user_Bottom" TagPrefix="uc1" %>
<%@ Register Src="user_Top.ascx" TagName="user_Top" TagPrefix="uc2" %>
<%@ Register Src="user_Left.ascx" TagName="user_Left" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>注册钱包转账记录</title>
    <link rel="Stylesheet" type="text/css" href="Css/Main.css" />
    <style type="text/css">
        .adtxgv1
        {
            width: 90%;
            margin-top: 15px;
            line-height: 22px;
        }
    </style>
</head>
<body>
    <center>
        <form id="form1" runat="server">
        <div id="top">
            <uc2:user_Top ID="user_Top1" runat="server" />
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
                                注册钱包转账记录</div>
                        </td>
                    </tr>
                </table>
                <div style="margin-top: 10px; margin-left: 6%">
                    <asp:LinkButton ID="LinkButton1" runat="server" ToolTip="0" OnClick="LinkButton1_Click">转出记录</asp:LinkButton>&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton2" runat="server" ToolTip="1" OnClick="LinkButton1_Click">转入记录</asp:LinkButton>
                </div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="adtxgv1"
                    OnRowDataBound="GridView1_RowDataBound" AlternatingRowStyle-BackColor="#F2F0F0"
                    BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px">
                    <Columns>
                        <asp:BoundField HeaderText="转出账号" HeaderStyle-BorderColor="#CCCCCC" HeaderStyle-Height="25px"
                            ItemStyle-Height="25px">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <HeaderStyle Height="30px" BackColor="#9C0203" ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="转入账号">
                            <HeaderStyle BackColor="#9C0203" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="转账金额">
                            <HeaderStyle BackColor="#9C0203" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="转账时间">
                            <HeaderStyle BackColor="#9C0203" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="备注">
                            <HeaderStyle BackColor="#9C0203" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                    </Columns>
                    <AlternatingRowStyle BackColor="#F2F0F0"></AlternatingRowStyle>
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
                <label id="zongJiLb" runat="server" style="line-height: 23px; text-align: center">
                </label>
            </div>
        </div>
        <div id="bottom">
            <uc1:user_Bottom ID="user_Bottom1" runat="server" />
        </div>
        </form>
    </center>
</body>
</html>
