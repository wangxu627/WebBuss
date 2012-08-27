<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SysSet.aspx.cs" Inherits="Admin_SysSet" %>

<%@ Register Src="admin_Top.ascx" TagName="admin_Top" TagPrefix="uc1" %>
<%@ Register Src="admin_Bottom.ascx" TagName="admin_Bottom" TagPrefix="uc2" %>
<%@ Register Src="admin_Left.ascx" TagName="admin_Left" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>文本设置</title>
    <link href="Css/Main.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1 {
            width: 60%;
            margin-top: 20px;
            margin-bottom: 20px;
            line-height: 20px;
        }
        .sstd1 {
            width: 30%;
            text-align: right;
            padding-right: 10px;
        }
        .sstd2 {
            width: 35%;
            text-align: left;
            padding-left: 10px;
        }
        .sstd3 {
            text-align: left;
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
                    奖金设置</div>
                <table border="1" cellpadding="0" cellspacing="0" bordercolor="#CC0033" class="style1"
                    style="border-collapse: collapse">
                    <tr>
                        <td class="sstd1">
                            网站状态:
                        </td>
                        <td class="sstd2">
                            <asp:RadioButtonList ID="StateList" runat="server" RepeatColumns="2">
                                <asp:ListItem Selected="True" Value="1">开启</asp:ListItem>
                                <asp:ListItem Value="0">关闭</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td class="sstd3">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="sstd1">
                            提现扣费:
                        </td>
                        <td class="sstd2">
                            <asp:TextBox ID="tiXianTx" runat="server" Width="60px"></asp:TextBox>$
                        </td>
                        <td class="sstd3">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="不能为空"
                                ControlToValidate="tiXianTx" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="tiXianTx"
                                Display="Dynamic" ErrorMessage="必须为大于等于0的数字" MaximumValue="10000000" MinimumValue="0"
                                Type="Double"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="sstd1">
                            扣税比例:
                        </td>
                        <td class="sstd2">
                            <asp:TextBox ID="kouPicTx" runat="server" Width="60px"></asp:TextBox>%
                        </td>
                        <td class="sstd3">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="不能为空"
                                ControlToValidate="kouPicTx" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="kouPicTx"
                                Display="Dynamic" ErrorMessage="必须为0-99的数字" MaximumValue="99" MinimumValue="0"
                                Type="Integer"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="sstd1">
                            奖金进入股票比例:
                        </td>
                        <td class="sstd2">
                            <asp:TextBox ID="onePicTx" runat="server" Width="60px"></asp:TextBox>%
                        </td>
                        <td class="sstd3">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="不能为空"
                                ControlToValidate="onePicTx" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator13" runat="server" ControlToValidate="onePicTx"
                                Display="Dynamic" ErrorMessage="必须为0-99的数字" MaximumValue="99" MinimumValue="0"
                                Type="Integer"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="sstd1">
                            股票发行价格:
                        </td>
                        <td class="sstd2">
                            <asp:TextBox ID="guPiaoTx" runat="server" Width="60px"></asp:TextBox>
                        </td>
                        <td class="sstd3">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="不能为空"
                                ControlToValidate="guPiaoTx" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator10" runat="server" ControlToValidate="guPiaoTx"
                                Display="Dynamic" ErrorMessage="必须为大于等于0的数字" MaximumValue="10000000" MinimumValue="0"
                                Type="Double"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="sstd1">
                            股票交易费比例:
                        </td>
                        <td class="sstd2">
                            <asp:TextBox ID="kouGpPicTx" runat="server" Width="60px"></asp:TextBox>%
                        </td>
                        <td class="sstd3">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="不能为空"
                                ControlToValidate="kouGpPicTx" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator8" runat="server" ControlToValidate="kouGpPicTx"
                                Display="Dynamic" ErrorMessage="必须为0-99的数字" MaximumValue="99" MinimumValue="0"
                                Type="Integer"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="sstd1">
                            计入交易币比例:
                        </td>
                        <td class="sstd2">
                            <asp:TextBox ID="inFicitPicTx" runat="server" Width="60px"></asp:TextBox>%
                        </td>
                        <td class="sstd3">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="不能为空"
                                ControlToValidate="inFicitPicTx" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator9" runat="server" ControlToValidate="inFicitPicTx"
                                Display="Dynamic" ErrorMessage="必须为0-99的数字" MaximumValue="99" MinimumValue="0"
                                Type="Integer"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="sstd1">
                            保存:
                        </td>
                        <td class="sstd2">
                            <asp:Button ID="Button1" runat="server" Text="保存" OnClick="Button1_Click1" />
                        </td>
                        <td class="sstd3">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="bottom">
            <uc2:admin_Bottom ID="admin_Bottom1" runat="server" />
        </div>
        </form>
    </center>
</body>
</html>

