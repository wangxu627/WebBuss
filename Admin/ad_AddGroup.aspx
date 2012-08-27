<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ad_AddGroup.aspx.cs" Inherits="Admin_ad_AddGroup" %>

<%@ Register Src="admin_Top.ascx" TagName="admin_Top" TagPrefix="uc1" %>
<%@ Register Src="admin_Left.ascx" TagName="admin_Left" TagPrefix="uc2" %>
<%@ Register Src="admin_Bottom.ascx" TagName="admin_Bottom" TagPrefix="uc3" %>
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
                会员晋级</div>
            <table class="uautb1" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="uautd1">
                        账号:
                    </td>
                    <td class="uautd2">
                        <input type="text" maxlength="50" style="width: 129px" id="untx" runat="server" />
                    </td>
                    <td class="uautd3">
                        <label id="label1" style="color: Red">
                            *</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" BorderStyle="Solid"
                            BorderWidth="1px" ControlToValidate="untx" Display="Dynamic" ErrorMessage="不能为空"
                            Height="18px"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="uautd1" colspan="2">
                        <asp:Button ID="Button1" runat="server" Text="检测账号" OnClick="Button1_Click" />
                    </td>
                    <td class="uautd3">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td3">
                        当前级别:
                    </td>
                    <td align="left" class="td3">
                        <asp:Label ID="groupLb" runat="server"></asp:Label>
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
                        <asp:Button ID="addUserBtn" runat="server" Text="实单升级" OnClick="addUserBtn_Click"/>
                    &nbsp;&nbsp;
                        <asp:Button ID="addUserBtn0" runat="server" Text="空单升级" 
                            OnClick="addUserBtn0_Click"/>
                    </td>
                    <td class="uautd3">
                        &nbsp;
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div id="bottom">
        <uc3:admin_Bottom ID="admin_Bottom1" runat="server" />
    </div>
    </form>
</body>
</html>

