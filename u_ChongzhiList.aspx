﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="u_ChongzhiList.aspx.cs" Inherits="u_ChongzhiList" %>

<%@ Register Src="user_Top.ascx" TagName="user_Top" TagPrefix="uc1" %>
<%@ Register Src="user_Bottom.ascx" TagName="user_Bottom" TagPrefix="uc2" %>
<%@ Register Src="user_Left.ascx" TagName="user_Left" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>充值记录</title>
    <link rel="Stylesheet" type="text/css" href="Css/Main.css" />
    <style type="text/css">
        .adtxgv1
        {
            width: 95%;
            margin-top: 30px;
            line-height: 22px;
        }
    </style>
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
                                充值记录</div>
                        </td>
                    </tr>
                </table>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="adtxgv1"
                    OnRowDataBound="GridView1_RowDataBound">
                    <Columns>
                        <asp:BoundField HeaderText="会员编号">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <HeaderStyle Height="30px" BackColor="#9C0203" ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="充值金额">
                            <HeaderStyle BackColor="#9C0203" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="实收金额">
                            <HeaderStyle BackColor="#9C0203" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="剩余货币">
                            <HeaderStyle BackColor="#9C0203" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="操作时间">
                            <HeaderStyle BackColor="#9C0203" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
                <div id="pagediv" runat="server" style="text-align: center; margin-top: 10px; margin-bottom: 10px;
                    height: 29px;">
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
