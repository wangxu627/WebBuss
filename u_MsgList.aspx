<%@ Page Language="C#" AutoEventWireup="true" CodeFile="u_MsgList.aspx.cs" Inherits="u_MsgList" %>

<%@ Register Src="user_Bottom.ascx" TagName="user_Bottom" TagPrefix="uc1" %>
<%@ Register Src="user_Top.ascx" TagName="user_Top" TagPrefix="uc2" %>
<%@ Register Src="user_Left.ascx" TagName="user_Left" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>站内邮件列表查看</title>
    <link rel="Stylesheet" type="text/css" href="Css/Main.css" />
    <style type="text/css">
        .umlgv1
        {
            margin-left: 20px;
            margin-top: 10px;
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
                                站内邮件清单</div>
                        </td>
                    </tr>
                </table>
                <div id="ssdiv" style="line-height: 25px; padding-left: 50px; margin-top: 15px;">
                    <asp:LinkButton ID="LinkButton1" runat="server" ToolTip="0" OnClick="LinkButton1_Click">查看收到邮件</asp:LinkButton>&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton2" runat="server" ToolTip="1" OnClick="LinkButton1_Click">查看发出邮件</asp:LinkButton>&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton3" runat="server" ToolTip="0" OnClick="LinkButton3_Click">全部站内邮件</asp:LinkButton>&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton4" runat="server" ToolTip="1" OnClick="LinkButton3_Click">已读站内邮件</asp:LinkButton>&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton5" runat="server" ToolTip="2" OnClick="LinkButton3_Click">未读站内邮件</asp:LinkButton>
                </div>
                <asp:GridView ID="GridView1" runat="server" Width="95%" AutoGenerateColumns="False"
                    CssClass="umlgv1" OnRowDataBound="GridView1_RowDataBound" AlternatingRowStyle-BackColor="#F2F0F0"
                    BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px">
                    <Columns>
                        <asp:BoundField HeaderText="标题" HeaderStyle-BorderColor="#CCCCCC" HeaderStyle-Height="25px"
                            ItemStyle-Height="25px">
                            <HeaderStyle BackColor="#9C0203" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="25%" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="发信人-收信人">
                            <HeaderStyle BackColor="#9C0203" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="20%" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="发信时间">
                            <HeaderStyle BackColor="#9C0203" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="20%" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="是否查看">
                            <HeaderStyle BackColor="#9C0203" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                        </asp:BoundField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="WriteBack" runat="server" CausesValidation="False">查看</asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle BackColor="#9C0203" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="DelMeg" runat="server" CausesValidation="False" OnClick="DelMeg_Click">删除邮件</asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle BackColor="#9C0203" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                        </asp:TemplateField>
                    </Columns>
                    <AlternatingRowStyle BackColor="#F2F0F0"></AlternatingRowStyle>
                </asp:GridView>
                <div id="pagediv" runat="server" style="text-align: center; line-height: 25px;">
                    共有<asp:Label runat="server" ID="AllPagelb"></asp:Label>页&nbsp;&nbsp;<asp:LinkButton
                        ID="BackBt" runat="server" OnClick="left_Click" CausesValidation="False">上一页</asp:LinkButton>
                    &nbsp;&nbsp;<asp:LinkButton runat="server" ID="FromBt" OnClick="Right_Click" CausesValidation="False">下一页</asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;当前第<asp:Label
                        runat="server" ID="NowPagelb"></asp:Label>页&nbsp;&nbsp;转到第<asp:TextBox runat="server"
                            ID="pagetx" Width="40px"></asp:TextBox>页<asp:Button ID="Gobt" runat="server" Text="Go"
                                CausesValidation="False" UseSubmitBehavior="False" OnClick="Gobt_Click" Style="height: 23px" />
                    共有<asp:Label ID="allnumlb" runat="server"></asp:Label>条记录，当前显示第
                    <asp:Label ID="nownumlb" runat="server"></asp:Label>条
                </div>
            </div>
        </div>
        <div id="bottom">
            <uc1:user_Bottom ID="user_Bottom1" runat="server" />
        </div>
        </form>
    </center>
</body>
</html>
