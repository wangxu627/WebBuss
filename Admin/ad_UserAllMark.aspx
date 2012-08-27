<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ad_UserAllMark.aspx.cs" Inherits="Admin_ad_UserAllMark" %>

<%@ Register Src="admin_Top.ascx" TagName="admin_Top" TagPrefix="uc1" %>
<%@ Register Src="admin_Left.ascx" TagName="admin_Left" TagPrefix="uc2" %>
<%@ Register Src="admin_Bottom.ascx" TagName="admin_Bottom" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>会员信息管理</title>
    <link rel="Stylesheet" type="text/css" href="Css/Main.css" />
    <style type="text/css">
        .gv1
        {
            width: 100%;
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
    <form id="form1" runat="server">
    <div id="top">
        <uc1:admin_Top ID="admin_Top1" runat="server" />
    </div>
    <div id="main">
        <div id="left">
            <uc2:admin_Left ID="admin_Left1" runat="server" />
        </div>
        <div id="right">
            <div class="k">
                会员信息管理</div>
            <br />
            <asp:Button ID="Button6" runat="server" Text="全部会员" ToolTip="0" OnClick="Button4_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="Button4" runat="server" Text="未审核" ToolTip="2" OnClick="Button4_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="Button5" runat="server" Text="已审核" ToolTip="1" OnClick="Button4_Click" />
            &nbsp;&nbsp; 账号:&nbsp;&nbsp;
            <asp:TextBox ID="untx" runat="server" MaxLength="50" Width="100px"></asp:TextBox>
            &nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="按会员编号" ToolTip="1" OnClick="Button1_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="按推荐人" ToolTip="2" OnClick="Button1_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="Button3" runat="server" Text="按指定日期" ToolTip="3" OnClick="Button1_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="Button7" runat="server" Text="按注册人" ToolTip="4" OnClick="Button1_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="Button8" runat="server" Text="按姓名" ToolTip="5" OnClick="Button1_Click" />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="gv1"
                OnRowDataBound="GridView1_RowDataBound">
                <Columns>
                    <asp:BoundField HeaderText="开户姓名">
                        <ItemStyle BorderColor="#D3CDD0" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center"
                            VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="会员编号">
                        <ItemStyle BorderColor="#D3CDD0" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center"
                            VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="推荐人">
                        <ItemStyle BorderColor="#D3CDD0" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center"
                            VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="安置人">
                        <ItemStyle BorderColor="#D3CDD0" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center"
                            VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="注册人">
                        <ItemStyle BorderColor="#D3CDD0" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center"
                            VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="级别">
                        <ItemStyle BorderColor="#D3CDD0" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center"
                            VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="入单时间">
                        <ItemStyle BorderColor="#D3CDD0" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center"
                            VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="联系电话">
                        <ItemStyle BorderColor="#D3CDD0" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center"
                            VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="注册钱包">
                        <ItemStyle BorderColor="#D3CDD0" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center"
                            VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="空单标记">
                        <ItemStyle BorderColor="#D3CDD0" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center"
                            VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="审核">
                        <ItemTemplate>
                            <asp:LinkButton ID="ToSen" runat="server" CausesValidation="False" OnClick="ToSen_Click">审核</asp:LinkButton>&nbsp;&nbsp;
                            <asp:LinkButton ID="ToDel" runat="server" CausesValidation="False" OnClick="ToDel_Click">删除</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="查看前台">
                        <ItemTemplate>
                            <asp:LinkButton ID="ToFirst" runat="server" CausesValidation="False" OnClick="ToFirst_Click">查看</asp:LinkButton>&nbsp;&nbsp;
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <div id="pagediv" runat="server" style="text-align: center; margin-top: 10px">
                共有<asp:Label runat="server" ID="AllPagelb"></asp:Label>页&nbsp;&nbsp;<asp:LinkButton
                    ID="BackBt" runat="server" OnClick="left_Click" CausesValidation="False">上一页</asp:LinkButton>
                &nbsp;&nbsp;<asp:LinkButton runat="server" ID="FromBt" OnClick="Right_Click" CausesValidation="False">下一页</asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;当前第<asp:Label
                    runat="server" ID="NowPagelb"></asp:Label>页&nbsp;&nbsp;转到第<asp:TextBox runat="server"
                        ID="pagetx" Width="40px"></asp:TextBox>页<asp:Button ID="Gobt" runat="server" Text="Go"
                            CausesValidation="False" UseSubmitBehavior="False" OnClick="Gobt_Click" Style="height: 26px" />
                共有<asp:Label ID="allnumlb" runat="server"></asp:Label>条记录，当前显示第
                <asp:Label ID="nownumlb" runat="server"></asp:Label>条
            </div>
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">导出Excel</asp:LinkButton>
        </div>
    </div>
    <div id="bottom">
        <uc3:admin_Bottom ID="admin_Bottom1" runat="server" />
    </div>
    </form>
</body>
</html>
