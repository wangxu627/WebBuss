<%@ Page Language="C#" AutoEventWireup="true" CodeFile="u_UpdateUserData.aspx.cs"
    Inherits="u_UpdateUserData" %>

<%@ Register Src="user_Top.ascx" TagName="user_Top" TagPrefix="uc1" %>
<%@ Register Src="user_Bottom.ascx" TagName="user_Bottom" TagPrefix="uc2" %>
<%@ Register Src="user_Left.ascx" TagName="user_Left" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>查看会员基本信息</title>
    <link rel="Stylesheet" type="text/css" href="Css/Main.css" />
    <script src="js/city.js" type="text/javascript"></script>
    <style type="text/css">
        .uudtb1
        {
            margin-left: 20px;
            margin-top: 20px;
            margin-bottom: 30px;
        }
        .uudtd1
        {
            text-align: right;
            padding-right: 15px;
            line-height: 28px;
        }
        .uudtd2
        {
            width: 50%;
            text-align: left;
            line-height: 28px;
        }
        .STYLE2
        {
            width: 50%;
            text-align: left;
            line-height: 23px;
            color: #999999;
        }
        .style1
        {
            text-align: right;
            padding-right: 15px;
            line-height: 28px;
            height: 28px;
        }
        .style2
        {
            width: 50%;
            text-align: left;
            line-height: 28px;
            height: 28px;
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
                                会员基本信息</div>
                        </td>
                    </tr>
                </table>
                <table class="uudtb1" width="95%" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="uudtd1">
                            <span style="line-height: 30px; font-weight: bold; margin-left: 25px;">
                                <img src="images/52design.com_kr_007.png" width="128" height="128" /></span>
                        </td>
                        <td class="uudtd2">
                            <label id="msgSaveDataLb" runat="server" style="line-height: 30px; font-size: 14px;
                                font-weight: bold; margin-left: 25px;">
                                会员基本资料</label>
                        </td>
                    </tr>
                    <tr>
                        <td width="33%" class="uudtd1">
                            会员编号
                        </td>
                        <td width="67%" class="uudtd2">
                            <asp:Label ID="unLb" runat="server" CssClass="zi"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="uudtd1">
                            &nbsp;
                        </td>
                        <td class="STYLE2">
                            此为注册账号唯一且不可更改
                        </td>
                    </tr>
                    <tr>
                        <td class="uudtd1">
                            推荐人
                        </td>
                        <td class="uudtd2">
                            <asp:Label ID="rfLb" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="uudtd1">
                            安置人
                        </td>
                        <td class="uudtd2">
                            <asp:Label ID="topNameLb" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="uudtd1">
                            注册人
                        </td>
                        <td class="uudtd2">
                            <asp:Label ID="regNameLb" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="uudtd1">
                            级别
                        </td>
                        <td class="uudtd2">
                            <asp:Label ID="grouplb" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="uudtd1">
                            开户姓名
                        </td>
                        <td class="uudtd2">
                            <asp:TextBox ID="realtx" runat="server" Width="120px" MaxLength="100"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="uudtd1">
                            银行账号
                        </td>
                        <td class="uudtd2">
                            <asp:TextBox ID="buLb" runat="server" Width="120px" MaxLength="50"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="uudtd1">
                            开户行所在地
                        </td>
                        <td class="uudtd2">
                            <asp:TextBox ID="bankAddrTx" runat="server" Width="120px" MaxLength="50"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="uudtd1">
                            开户银行
                        </td>
                        <td class="uudtd2">
                            <asp:TextBox ID="baLb" runat="server" Width="120px" MaxLength="50"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                            联系电话
                        </td>
                        <td class="style2">
                            <asp:TextBox ID="phtx" runat="server" Width="120px" MaxLength="50"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="uudtd1">
                            身份证号
                        </td>
                        <td class="uudtd2">
                            <asp:TextBox ID="pidTx" runat="server" Width="120px" MaxLength="50"></asp:TextBox>
                    </tr>
                    <tr>
                        <td class="uudtd1">
                            昵称
                        </td>
                        <td class="uudtd2">
                            <asp:TextBox ID="niChengTx" runat="server" Width="120px" MaxLength="50"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="uudtd1">
                            联系地址
                        </td>
                        <td class="uudtd2">
                            <asp:TextBox ID="addtx" runat="server" Width="120px" MaxLength="50"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="uudtd1">
                            联系邮编
                        </td>
                        <td class="uudtd2">
                            <asp:TextBox ID="zipTx" runat="server" Width="120px" MaxLength="50"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="uudtd1">
                            QQ/MSN
                        </td>
                        <td class="uudtd2">
                            <asp:TextBox ID="qqNumTx" runat="server" Width="120px" MaxLength="50"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="uudtd1">
                            &nbsp;
                        </td>
                        <td class="uudtd2">
                            <asp:Button ID="ToSave" runat="server" Text="保存信息" OnClick="ToSave_Click" ValidationGroup="save1" />
                        </td>
                    </tr>
                    <tr>
                        <td class="uudtd1" style="border-bottom: solid 1px #990000">
                            <span class="zi">您的奖金和电子币</span>
                        </td>
                        <td class="uudtd2" style="border-bottom: solid 1px #990000">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="uudtd1">
                            现金钱包
                        </td>
                        <td class="uudtd2">
                            <asp:Label ID="lastMoney" runat="server"></asp:Label>
                            美元
                        </td>
                    </tr>
                    <tr>
                        <td class="uudtd1">
                            注册钱包
                        </td>
                        <td class="uudtd2">
                            <asp:Label ID="ficit" runat="server"></asp:Label>美元
                        </td>
                    </tr>
                    <tr>
                        <td class="uudtd1">
                            强制钱包
                        </td>
                        <td class="uudtd2">
                            <asp:Label ID="jiaoyiLb" runat="server"></asp:Label>美元
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="bottom">
            <uc2:user_Bottom ID="user_Bottom1" runat="server" />
        </div>
        </form>
    </center>
</body>
</html>
