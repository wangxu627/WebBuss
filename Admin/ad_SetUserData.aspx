<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ad_SetUserData.aspx.cs" Inherits="Admin_ad_SetUserData" %>

<%@ Register Src="admin_Left.ascx" TagName="admin_Left" TagPrefix="uc1" %>
<%@ Register Src="admin_Top.ascx" TagName="admin_Top" TagPrefix="uc2" %>
<%@ Register Src="admin_Bottom.ascx" TagName="admin_Bottom" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>修改会员信息</title>
    <link rel="Stylesheet" type="text/css" href="Css/Main.css" />

    <script src="../js/city.js" type="text/javascript"></script>

    <style type="text/css">
        .uudtb1
        {
            margin-left: 20px;
            margin-top: 15px;
            margin-bottom: 15px;
        }
        .uudtd1
        {
            text-align: center;
            line-height: 23px;
            border: 1px solid #eee;
        }
        .uudtd2
        {
            width: 35%;
            text-align: left;
            line-height: 23px;
            border: 1px solid #eee;
            padding-left: 5px;
        }
        .uudtd3
        {
            width: 75%;
            text-align: left;
            line-height: 23px;
            border: 1px solid #eee;
            padding-left: 5px;
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
            <uc1:admin_Left ID="admin_Left1" runat="server" />
        </div>
        <div id="right">
            <div class="k">
                修改会员信息</div>
            <label id="msgSaveDataLb" runat="server" style="line-height: 30px; font-size: 18px;
                font-weight: bold; margin-left: 25px;">
                修改会员基本信息</label>
            <table class="uudtb1" width="95%" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="uudtd1">
                        会员编号:
                    </td>
                    <td class="uudtd2">
                        <asp:Label ID="unLb" runat="server"></asp:Label>
                    </td>
                    <td class="uudtd1">
                        推荐人:
                    </td>
                    <td class="uudtd2">
                        <asp:Label ID="rfLb" runat="server"></asp:Label>&nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="uudtd1">
                                                分红标记：
                    </td>
                    <td class="uudtd2">
                        <asp:Label ID="topLb" runat="server" Width="120px" MaxLength="50"></asp:Label>
                    </td>
                    <td class="uudtd1">
                        安置人:
                    </td>
                    <td class="uudtd2">
                        <asp:Label ID="topNameLb" runat="server"></asp:Label>&nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="uudtd1">
                        级别：
                    </td>
                    <td class="uudtd2">
                        <asp:Label ID="groupLb" runat="server" Width="120px" MaxLength="50"></asp:Label>
                    </td>
                    <td class="uudtd1">
                        注册人
                    </td>
                    <td class="uudtd2">
                        <asp:Label ID="regNameLb" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="uudtd1">
                        联系地址:
                    </td>
                    <td class="uudtd2">
                        <asp:TextBox ID="addtx" runat="server" Width="120px" MaxLength="50"></asp:TextBox>
                    </td>
                    <td class="uudtd1">
                        联系邮编:
                    </td>
                    <td class="uudtd2">
                        <asp:TextBox ID="zipTx" runat="server" Width="120px" MaxLength="50"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="uudtd1">
                        银行帐号:
                    </td>
                    <td class="uudtd2">
                        <asp:TextBox ID="buLb" runat="server" Width="120px" MaxLength="50"></asp:TextBox>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ValidationGroup="save1"
                            BorderStyle="Solid" BorderWidth="1px" Display="Dynamic" ControlToValidate="buLb"
                            ErrorMessage="只能为15-19位的数字" Height="18px" ValidationExpression="\d{15,19}"></asp:RegularExpressionValidator>
                    </td>
                    <td class="uudtd1">
                        开户姓名:
                    </td>
                    <td class="uudtd2">
                        <asp:TextBox ID="realtx" runat="server" Width="120px" MaxLength="100"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="只能为1-6个汉字"
                            BorderStyle="Solid" BorderWidth="1px" ControlToValidate="realtx" Display="Dynamic"
                            ValidationGroup="save1" ValidationExpression="[\u4e00-\u9fa5]{1,4}" Height="18px"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="uudtd1">
                        昵称:
                    </td>
                    <td class="uudtd2">
                        <asp:TextBox ID="niChengTx" runat="server" Width="120px" MaxLength="50"></asp:TextBox>
                    </td>
                    <td class="uudtd1">
                        开户银行:
                    </td>
                    <td class="uudtd2">
                        <asp:TextBox ID="baLb" runat="server" Width="120px" MaxLength="50"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="uudtd1">
                        联系电话:
                    </td>
                    <td class="uudtd2">
                        <asp:TextBox ID="phtx" runat="server" Width="120px" MaxLength="50"></asp:TextBox>
                    </td>
                    <td class="uudtd1">
                        开户行所在地:
                    </td>
                    <td class="uudtd2">
                        <asp:TextBox ID="bankAddrTx" runat="server" Width="120px" MaxLength="50"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="uudtd1">
                        身份证号:
                    </td>
                    <td class="uudtd2">
                        <asp:TextBox ID="pidTx" runat="server" Width="120px" MaxLength="50"></asp:TextBox>
                    </td>
                    <td class="uudtd1">
                        QQ/MSN:
                    </td>
                    <td class="uudtd2">
                        <asp:TextBox ID="qqNumTx" runat="server" Width="120px" MaxLength="50"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="uudtd1">
                        注册钱包:
                    </td>
                    <td class="uudtd2">
                        <asp:Label ID="ficit" runat="server"></asp:Label>
                    </td>
                    <td class="uudtd1">
                        现金钱包:
                    </td>
                    <td class="uudtd2">
                        <asp:Label ID="lastMoney" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="uudtd1">
                        销售增值积分:
                    </td>
                    <td class="uudtd2">
                        <asp:Label ID="gupiaoLb" runat="server"></asp:Label>
                    </td>
                    <td class="uudtd1">
                        强制钱包:
                    </td>
                    <td class="uudtd2">
                        <asp:Label ID="jiaoyiLb" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="line-height: 25px; text-align: left; padding-left: 150px" colspan="4">
                        <asp:Button ID="ToSave" runat="server" Text="保存信息" OnClick="ToSave_Click" ValidationGroup="save1" />
                    </td>
                </tr>
            </table>
            <hr />
            <label id="Label1" runat="server" style="line-height: 30px; font-size: 18px; font-weight: bold;
                margin-left: 25px;">
                修改会员密码</label>
            <br />
            (登陆，二级密码统一修改)<table style="width: 60%;" class="uudtb1" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="uudtd1">
                        输入密码:
                    </td>
                    <td class="uudtd3">
                        <asp:TextBox ID="pwdtx1" runat="server" MaxLength="50" Width="120px" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" BorderStyle="Solid"
                            BorderWidth="1px" ControlToValidate="pwdtx1" Display="Dynamic" ErrorMessage="新密码不能为空"
                            ValidationGroup="save2"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" BorderStyle="Solid"
                            BorderWidth="1px" Display="Dynamic" ControlToValidate="pwdtx1" ErrorMessage="请输入字母和数字"
                            ValidationExpression="[0-9a-zA-Z]{1,}" ValidationGroup="save2"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="uudtd1">
                        确认密码:
                    </td>
                    <td class="uudtd3">
                        <asp:TextBox ID="pwdtx2" runat="server" MaxLength="50" Width="120px" TextMode="Password"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" BorderStyle="Solid" BorderWidth="1px"
                            ControlToCompare="pwdtx1" ControlToValidate="pwdtx2" Display="Dynamic" ErrorMessage="两次密码输入不一致"
                            ValidationGroup="save2"></asp:CompareValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" BorderStyle="Solid"
                            BorderWidth="1px" ControlToValidate="pwdtx2" Display="Dynamic" ErrorMessage="确认不能为空"
                            ValidationGroup="save2"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="uudtd1">
                        修改:
                    </td>
                    <td class="uudtd3">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="修改密码" ValidationGroup="save2" />
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

