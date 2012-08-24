<%@ Page Language="C#" AutoEventWireup="true" CodeFile="u_ResetPwd.aspx.cs" Inherits="u_ResetPwd" %>

<%@ Register Src="user_Bottom.ascx" TagName="user_Bottom" TagPrefix="uc1" %>
<%@ Register Src="user_Left.ascx" TagName="user_Left" TagPrefix="uc2" %>
<%@ Register Src="user_Top.ascx" TagName="user_Top" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>修改密码</title>
    <link rel="Stylesheet" type="text/css" href="Css/Main.css" />
    <style type="text/css">
<!--
.STYLE2 {font-size: 36px}
-->
    </style>
</head>
<body>
    <center>
        <form id="form1" runat="server">
        <div id="top">
            <uc3:user_Top ID="user_Top1" runat="server" />
        </div>
        <div id="main">
            <div id="left">
                <uc2:user_Left ID="user_Left1" runat="server" />
            </div>
            <div id="right">
                <table width="1000" height="80" border="0" align="center" cellpadding="0" cellspacing="0"
                    background="images/imagdsde3.jpg">
                    <tr>
                        <td>
                            <div class="k1">
                                修改密码</div>
                        </td>
                    </tr>
                </table>
                <table width="700" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="179" align="right">
                            <img src="images/blender.png" width="128" height="128" />&nbsp;&nbsp;
                        </td>
                        <th height="179" align="left" style="font-size: 26px">
                            修改密码
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <label id="Label1" runat="server" style="line-height: 30px; font-weight: bold; margin-left: 25px;">
                                修改登陆密码</label>
                            <table width="330" cellpadding="4" cellspacing="4">
                                <tr>
                                    <td align="right">
                                        原密码
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="op1tx" runat="server" MaxLength="50" Width="120px" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" BorderStyle="Solid"
                                            BorderWidth="1px" ControlToValidate="op1tx" Display="Dynamic" ErrorMessage="原密码不能为空"
                                            ValidationGroup="save2"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        输入新密码
                                    </td>
                                    <td align="left">
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
                                    <td align="right">
                                        确认新密码
                                    </td>
                                    <td align="left">
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
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td align="left">
                                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="确定" ValidationGroup="save2" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <label id="Label3" runat="server" style="line-height: 30px; font-weight: bold; margin-left: 25px;">
                                修改二级密码</label>
                            <table width="330" cellpadding="4" cellspacing="4">
                                <tr>
                                    <td align="right">
                                        原二级密码
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="TextBox3" runat="server" MaxLength="50" Width="120px" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" BorderStyle="Solid"
                                            BorderWidth="1px" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="原密码不能为空"
                                            ValidationGroup="save3"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        输入新密码
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="TextBox1" runat="server" MaxLength="50" Width="120px" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" BorderStyle="Solid"
                                            BorderWidth="1px" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="新密码不能为空"
                                            ValidationGroup="save3"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" BorderStyle="Solid"
                                            BorderWidth="1px" Display="Dynamic" ControlToValidate="TextBox1" ErrorMessage="请输入字母和数字"
                                            ValidationExpression="[0-9a-zA-Z]{1,}" ValidationGroup="save3"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        确认新密码
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="TextBox2" runat="server" MaxLength="50" Width="120px" TextMode="Password"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator2" runat="server" BorderStyle="Solid" BorderWidth="1px"
                                            ControlToCompare="TextBox1" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="两次密码输入不一致"
                                            ValidationGroup="save3"></asp:CompareValidator><asp:RequiredFieldValidator ID="RequiredFieldValidator7"
                                                runat="server" BorderStyle="Solid" BorderWidth="1px" ControlToValidate="TextBox2"
                                                Display="Dynamic" ErrorMessage="确认不能为空" ValidationGroup="save3"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td align="left">
                                        <asp:Button ID="Button3" runat="server" Text="确定" ValidationGroup="save3" OnClick="Button3_Click" />
                                    </td>
                                </tr>
                            </table>
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
