<%@ Page Language="C#" AutoEventWireup="true" CodeFile="u_AddGroup.aspx.cs" Inherits="u_AddGroup" %>

<%@ Register Src="user_Top.ascx" TagName="user_Top" TagPrefix="uc1" %>
<%@ Register Src="user_Bottom.ascx" TagName="user_Bottom" TagPrefix="uc2" %>
<%@ Register Src="user_Left.ascx" TagName="user_Left" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>会员晋级</title>
    <link rel="Stylesheet" type="text/css" href="Css/Main.css" />
    <style type="text/css">
        .uautb1
        {
            width: 65%;
            margin-left: 10%;
            margin-top: 20px;
            line-height: 23px;
        }
        .uautd1
        {
            text-align: center;
            line-height: 23px;
        }
        .uautd2
        {
            text-align: left;
            line-height: 23px;
        }
        .uautx1
        {
            width: 130px;
        }
        .uautd3
        {
            width: 55%;
            text-align: left;
        }
    </style>
    <script type="text/javascript">
        function ShowSunbit() {
            var groupId = document.getElementById("DropDownList1").value;
            var groupName = "";
            var newMoney = 0;

            switch (groupId) {
                case "1":
                    groupName = document.getElementById("oneGroupNameInput").value;
                    newMoney = document.getElementById("oneGroupMoneyInput").value;
                    break;
                case "2":
                    groupName = document.getElementById("twoGroupNameInput").value;
                    newMoney = document.getElementById("twoGroupMoneyInput").value;
                    break;
                case "3":
                    groupName = document.getElementById("thrGroupNameInput").value;
                    newMoney = document.getElementById("thrGroupMoneyInput").value;
                    break;
                case "4":
                    groupName = document.getElementById("forGroupNameInput").value;
                    newMoney = document.getElementById("forGroupMoneyInput").value;
                    break;
                default:
                    break;
            }

            if (confirm("您确定要花费  " + newMoney + "  升级到  " + groupName + "  么？")) {
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
                            会员晋级</div>
                    </td>
                </tr>
            </table>
            <table class="uautb1" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="right" class="td3">
                        晋级点位:
                    </td>
                    <td align="left" class="td3">
                        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td3">
                        当前级别:
                    </td>
                    <td align="left" class="td3">
                        <asp:Label ID="groupLb" runat="server"></asp:Label>
                        <input type="hidden" id="oneGroupMoneyInput" runat="server" />
                        <input type="hidden" id="twoGroupMoneyInput" runat="server" />
                        <input type="hidden" id="thrGroupMoneyInput" runat="server" />
                        <input type="hidden" id="forGroupMoneyInput" runat="server" />
                        <input type="hidden" id="oneGroupNameInput" runat="server" />
                        <input type="hidden" id="twoGroupNameInput" runat="server" />
                        <input type="hidden" id="thrGroupNameInput" runat="server" />
                        <input type="hidden" id="forGroupNameInput" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td3">
                        现金账户:
                    </td>
                    <td align="left" class="td3">
                        <asp:Label ID="lastMoneyLb" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td3">
                        注册账户:
                    </td>
                    <td align="left" class="td3">
                        <asp:Label ID="ficitLb" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="uautd1">
                        选择级别:
                    </td>
                    <td class="uautd2" colspan="2">
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem Value="0" Selected="True">请先检测账号</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="uautd1" colspan="2">
                        <asp:Button ID="addUserBtn" runat="server" Text="升级" OnClick="addUserBtn_Click" OnClientClick="return ShowSunbit()" />
                    </td>
                    <td class="uautd3">
                        &nbsp;
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div id="bottom">
        <uc2:user_Bottom ID="user_Bottom1" runat="server" />
    </div>
    </form>
</body>
</html>
