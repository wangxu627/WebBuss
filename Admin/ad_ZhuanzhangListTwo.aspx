<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ad_ZhuanzhangListTwo.aspx.cs"
    Inherits="Admin_ad_ZhuanzhangListTwo" %>

<%@ Register Src="admin_Bottom.ascx" TagName="admin_Bottom" TagPrefix="uc1" %>
<%@ Register Src="admin_Top.ascx" TagName="admin_Top" TagPrefix="uc2" %>
<%@ Register Src="admin_Left.ascx" TagName="admin_Left" TagPrefix="uc3" %>
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
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="top">
        <uc2:admin_Top ID="admin_Top1" runat="server" />
    </div>
    <div id="main">
        <div id="left">
            <uc3:admin_Left ID="admin_Left1" runat="server" />
        </div>
        <div id="right">
            <div class="k">
                注册钱包转账记录</div>
            <div style="margin-top: 10px; margin-left: 4%">
                <asp:LinkButton ID="LinkButton2" runat="server" ToolTip="0" OnClick="LinkButton3_Click">转出记录</asp:LinkButton>&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="LinkButton1" runat="server" ToolTip="1" OnClick="LinkButton3_Click">转入记录</asp:LinkButton>&nbsp;&nbsp;&nbsp;
                &nbsp; &nbsp;&nbsp; 账号/时间:&nbsp;&nbsp;<asp:TextBox ID="untx" runat="server" MaxLength="50"
                    Width="100px"></asp:TextBox>
                &nbsp;&nbsp; &nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" Text="全部记录" ToolTip="2" OnClick="Button1_Click" />
                &nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Text="按日期" ToolTip="0" OnClick="Button1_Click" />
                &nbsp;&nbsp;
                <asp:Button ID="Button3" runat="server" Text="按账号" ToolTip="1" OnClick="Button1_Click" />
            </div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="adtxgv1"
                OnRowDataBound="GridView1_RowDataBound">
                <Columns>
                    <asp:BoundField HeaderText="转出账号">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="20%" />
                        <HeaderStyle Height="30px" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="转入账号">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="20%" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="转账金额">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="20%" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="转账时间">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="30%" />
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
            <label id="zongJiLb" runat="server" style="line-height: 23px; text-align: center">
            </label>
            <br />
            <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton1_Click">导出Excel</asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="button" name="Submit4" value="打印帐单" onclick="javascript:window.print()" />
        </div>
    </div>
    <div id="bottom">
        <uc1:admin_Bottom ID="admin_Bottom1" runat="server" />
    </div>
    </form>
</body>
</html>
