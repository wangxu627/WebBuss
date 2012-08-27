<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ad_DetailAward.aspx.cs" Inherits="Admin_ad_DetailAward" %>

<%@ Register Src="admin_Top.ascx" TagName="admin_Top" TagPrefix="uc1" %>
<%@ Register Src="admin_Bottom.ascx" TagName="admin_Bottom" TagPrefix="uc2" %>
<%@ Register Src="admin_Left.ascx" TagName="admin_Left" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>详细奖金纪录</title>
    <link rel="Stylesheet" type="text/css" href="Css/Main.css" />
    <style type="text/css">
        .gv1
        {
            width: 98%;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <center>
        <form id="form1" runat="server">
        <div id="top">
            <uc1:admin_Top ID="admin_Top1" runat="server" />
        </div>
        <div id="main">
            <div id="left">
                <uc3:admin_Left ID="admin_Left1" runat="server" />
            </div>
            <div id="right">
                <div class="k">
                    详细奖金纪录</div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="gv1"
                    OnRowDataBound="GridView1_RowDataBound">
                    <Columns>
                        <asp:BoundField HeaderText="会员编号">
                            <HeaderStyle Height="23px" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" ForeColor="#0080FF" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="奖金来源">
                            <HeaderStyle Height="23px" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="直接销售奖">
                            <HeaderStyle Height="23px" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="市场推广奖">
                            <HeaderStyle Height="23px" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="销售管理奖">
                            <HeaderStyle Height="23px" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="分红奖">
                            <HeaderStyle Height="23px" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="总奖金">
                            <HeaderStyle Height="23px" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="强制钱包">
                            <HeaderStyle Height="23px" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="现金账户">
                            <HeaderStyle Height="23px" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="时间">
                            <HeaderStyle Height="23px" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
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
                <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton1_Click">导出Excel</asp:LinkButton>
            </div>
        </div>
        <div id="bottom">
            <uc2:admin_Bottom ID="admin_Bottom1" runat="server" />
        </div>
        </form>
    </center>
</body>
</html>
