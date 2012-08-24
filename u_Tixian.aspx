<%@ Page Language="C#" AutoEventWireup="true" CodeFile="u_Tixian.aspx.cs" Inherits="u_Tixian" %>


<%@ Register Src="user_Bottom.ascx" TagName="user_Bottom" TagPrefix="uc1" %>
<%@ Register Src="user_Top.ascx" TagName="user_Top" TagPrefix="uc2" %>
<%@ Register Src="user_Left.ascx" TagName="user_Left" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>申请提现</title>
    <link rel="Stylesheet" type="text/css" href="Css/Main.css" />
    <style type="text/css">
        .utxdiv1
        {
            width: 70%;
            margin-top: 10px;
            padding-left: 20px;
            line-height: 23px;
        }
        .txtd1
        {
            border: 1px solid #eef;
            width: 30%;
            text-align: right;
            padding-right: 15px;
        }
        .txtd2
        {
            border: 1px solid #eef;
            text-align: left;
            padding-left: 15px;
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
                                申请提现</div>
                        </td>
                    </tr>
                </table>
                <p class="zi">
                    当前账户余额:&nbsp;&nbsp;
                    <asp:Label ID="lastMoneyLb" runat="server"></asp:Label>美元&nbsp;&nbsp;&nbsp;&nbsp;
                    提现成功总计:&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="allTixianLb" runat="server"></asp:Label>美元&nbsp;&nbsp;&nbsp;&nbsp;
                </p>
                <br />
                <table class="table3" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="right" class="td3">
                            提现金额:
                        </td>
                        <td align="left" class="td3">
                            <asp:TextBox ID="moneyTx" runat="server"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="提现金额必须为数字"
                                BorderStyle="Solid" BorderWidth="1px" ControlToValidate="moneyTx" Display="Dynamic"
                                ValidationExpression="\d{1,}"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="金额不能为空"
                                BorderStyle="Solid" BorderWidth="1px" ControlToValidate="moneyTx" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="td3">
                            开户行所在地:
                        </td>
                        <td align="left" class="td3">
                            <asp:Label ID="bankAddr" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="td3">
                            开户银行:
                        </td>
                        <td align="left" class="td3">
                            <asp:Label ID="batx" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="td3">
                            银行账号:
                        </td>
                        <td align="left" class="td3">
                            <asp:Label ID="butx" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="td3">
                            开户姓名:
                        </td>
                        <td align="left" class="td3">
                            <asp:Label ID="rltx" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="td3">
                            申请:
                        </td>
                        <td align="left" class="td3">
                            <asp:Button ID="ToSenqing" runat="server" Text="申请" OnClick="ToSenqing_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="bottom">
            <uc1:user_Bottom ID="user_Bottom1" runat="server" />
        </div>
        </form>
    </center>
</body>
</html>
