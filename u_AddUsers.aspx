<%@ Page Language="C#" AutoEventWireup="true" CodeFile="u_AddUsers.aspx.cs" Inherits="u_AddUsers" %>

<%@ Register Src="user_Top.ascx" TagName="user_Top" TagPrefix="uc1" %>
<%@ Register Src="user_Bottom.ascx" TagName="user_Bottom" TagPrefix="uc2" %>
<%@ Register Src="user_Left.ascx" TagName="user_Left" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>注册会员</title>
    <link rel="Stylesheet" type="text/css" href="Css/Main.css" />
    <script src="js/city.js" type="text/javascript"></script>
    <style type="text/css">
        .uautb1
        {
            width: 80%;
            margin-top: 20px;
            margin-bottom: 20px;
            line-height: 28px;
        }
        .uautd1
        {
            width: 25%;
            text-align: right;
            padding-right: 10px;
            line-height: 28px;
        }
        .uautd2
        {
            text-align: left;
            line-height: 28px;
        }
        .uautd3
        {
            width: 45%;
            text-align: left;
        }
        .uautx1
        {
            width: 130px;
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
                                注册会员</div>
                        </td>
                    </tr>
                </table>
                <div align="center" style="width: 95%; border-bottom: solid 1px #322020; padding: 10px">
                    <img src="images/kdmconfig.png" width="128" height="128" />
                    <table border="0" cellpadding="0" cellspacing="0" class="uautb1">
                        <tr>
                            <td class="uautd1">
                                会员编号:
                            </td>
                            <td class="uautd2">
                                <input name="text" class="uautx1" type="text" id="untx" maxlength="50" runat="server"
                                    readonly="readonly" />
                                <%--<asp:Label ID="rantx" Height="23px" runat="server" Font-Bold="true" Font-Size="Small"></asp:Label>--%>
                            </td>
                            <td class="uautd3">
                                <label id="label1111" style="color: Red">
                                    *</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" BorderStyle="Solid"
                                    BorderWidth="1px" ControlToValidate="untx" Display="Dynamic" ErrorMessage="不能为空"
                                    Height="18px"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator14" runat="server"
                                    BorderStyle="Solid" BorderWidth="1px" Display="Dynamic" ControlToValidate="untx"
                                    ErrorMessage="账号只能为10个小写字母或数字" Height="18px" ValidationExpression="[a-z0-9]{8}"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="uautd1">
                                推荐人:
                            </td>
                            <td class="uautd2">
                                <input name="text2" type="text" class="uautx1" id="rntx" maxlength="50" runat="server" />
                            </td>
                            <td class="uautd3">
                                <label id="label2" style="color: Red">
                                    *</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" BorderStyle="Solid"
                                    BorderWidth="1px" ControlToValidate="rntx" Display="Dynamic" ErrorMessage="不能为空"
                                    Height="18px"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="uautd1">
                                安置人编号:
                            </td>
                            <td class="uautd2">
                                <input name="text2" type="text" class="uautx1" id="topTx" maxlength="50" runat="server" />
                            </td>
                            <td class="uautd3">
                                <label id="label13" style="color: Red">
                                    *</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" BorderStyle="Solid"
                                    BorderWidth="1px" ControlToValidate="topTx" Display="Dynamic" ErrorMessage="不能为空"
                                    Height="18px"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="uautd1">
                                选择分区:
                            </td>
                            <td class="uautd2">
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatColumns="2">
                                    <asp:ListItem Value="1" Selected="True">左区</asp:ListItem>
                                    <asp:ListItem Value="2">右区</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td class="uautd3">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="uautd1">
                                注册级别:
                            </td>
                            <td class="uautd2">
                                <asp:DropDownList ID="DropDownList1" runat="server" Width="129px">
                                    <asp:ListItem Value="1">A级-1000$</asp:ListItem>
                                    <asp:ListItem Value="2">B级-3000$</asp:ListItem>
                                    <asp:ListItem Value="3">C级-5000$</asp:ListItem>
                                    <asp:ListItem Value="4">D级-10000$</asp:ListItem>
                                    <asp:ListItem Value="5">D级-30000$</asp:ListItem>
                                    <asp:ListItem Value="6">D级-50000$</asp:ListItem>
                                    <asp:ListItem Value="7">D级-70000$</asp:ListItem>
                                    <asp:ListItem Value="8">D级-150000$</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="uautd3">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="uautd1">
                                昵称:
                            </td>
                            <td class="uautd2">
                                <input name="text2" type="text" class="uautx1" id="niChengTx" maxlength="50" runat="server" />
                            </td>
                            <td class="uautd3">
                                <label id="label8" style="color: Red">
                                    *</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" BorderStyle="Solid"
                                    BorderWidth="1px" ControlToValidate="niChengTx" Display="Dynamic" ErrorMessage="不能为空"
                                    Height="18px"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="uautd1">
                                一级密码:
                            </td>
                            <td class="uautd2">
                                <input name="text2" type="password" class="uautx1" id="pstx1" maxlength="50" runat="server" />
                            </td>
                            <td class="uautd3">
                                <label id="label7" style="color: Red">
                                    *</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" BorderStyle="Solid"
                                    BorderWidth="1px" ControlToValidate="pstx1" Display="Dynamic" ErrorMessage="不能为空"
                                    Height="18px"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server"
                                    BorderStyle="Solid" BorderWidth="1px" Display="Dynamic" ControlToValidate="pstx1"
                                    ErrorMessage="密码只能包含字母和数字" Height="18px" ValidationExpression="\w{1,20}"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="uautd1">
                                再次输入:
                            </td>
                            <td class="uautd2">
                                <input name="text2" type="password" class="uautx1" id="Password1" maxlength="50"
                                    runat="server" />
                            </td>
                            <td class="uautd3">
                                <label id="label4" style="color: Red">
                                    *</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" BorderStyle="Solid"
                                    BorderWidth="1px" ControlToValidate="Password1" Display="Dynamic" ErrorMessage="不能为空"
                                    Height="18px"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" BorderStyle="Solid" BorderWidth="1px"
                                    ControlToCompare="pstx1" ControlToValidate="Password1" Display="Dynamic" ErrorMessage="两次密码输入不一致"
                                    Height="18px"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="uautd1">
                                二级密码:
                            </td>
                            <td class="uautd2">
                                <input name="text2" type="password" class="uautx1" id="pstx3" maxlength="50" runat="server" />
                            </td>
                            <td class="uautd3">
                                <label id="label9" style="color: Red">
                                    *</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" BorderStyle="Solid"
                                    BorderWidth="1px" ControlToValidate="pstx3" Display="Dynamic" ErrorMessage="不能为空"
                                    Height="18px"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" BorderStyle="Solid"
                                    BorderWidth="1px" ControlToValidate="pstx3" ErrorMessage="密码只能包含字母和数字" Height="18px"
                                    Display="Dynamic" ValidationExpression="\w{1,20}"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="uautd1">
                                再次输入:
                            </td>
                            <td class="uautd2">
                                <input name="text2" type="password" class="uautx1" id="Password2" maxlength="50"
                                    runat="server" />
                            </td>
                            <td class="uautd3">
                                <label id="label5" style="color: Red">
                                    *</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" BorderStyle="Solid"
                                    BorderWidth="1px" ControlToValidate="Password2" Display="Dynamic" ErrorMessage="不能为空"
                                    Height="18px"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator2" runat="server" BorderStyle="Solid" BorderWidth="1px"
                                    ControlToCompare="pstx3" ControlToValidate="Password2" Display="Dynamic" ErrorMessage="两次密码输入不一致"
                                    Height="18px"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="uautd1">
                                开户银行:
                            </td>
                            <td class="uautd2">
                                <asp:DropDownList ID="DropDownList2" runat="server" Height="21px" Width="125px">
                                    <asp:ListItem>中国银行</asp:ListItem>
                                    <asp:ListItem>农业银行</asp:ListItem>
                                    <asp:ListItem>工商银行</asp:ListItem>
                                    <asp:ListItem>建设银行</asp:ListItem>
                                    <asp:ListItem>交通银行</asp:ListItem>
                                    <asp:ListItem>招商银行</asp:ListItem>
                                    <asp:ListItem>华夏银行</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="uautd3">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="uautd1">
                                开户行地址:
                            </td>
                            <td class="uautd2">
                                <input name="text2" type="text" class="uautx1" id="bankAddr" maxlength="50" runat="server" />
                            </td>
                            <td class="uautd3">
                                <label id="label12" style="color: Red">
                                    *</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" BorderStyle="Solid"
                                    BorderWidth="1px" ControlToValidate="bankAddr" Display="Dynamic" ErrorMessage="不能为空"
                                    Height="18px"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="uautd1">
                                银行账号:
                            </td>
                            <td class="uautd2">
                                <input name="text2" type="text" class="uautx1" id="butx" maxlength="50" runat="server" />
                            </td>
                            <td class="uautd3">
                                <label id="label1" style="color: Red">
                                    *</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator111" runat="server" BorderStyle="Solid"
                                    BorderWidth="1px" ControlToValidate="butx" Display="Dynamic" ErrorMessage="不能为空"
                                    Height="18px"></asp:RequiredFieldValidator>
                                <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" BorderStyle="Solid"
                                            BorderWidth="1px" Display="Dynamic" ControlToValidate="butx" ErrorMessage="银行账号只能为15-19位美元的数字"
                                            Height="18px" ValidationExpression="\d{15,19}"></asp:RegularExpressionValidator>--%>
                            </td>
                        </tr>
                        <tr>
                            <td class="uautd1">
                                开户姓名:
                            </td>
                            <td class="uautd2">
                                <input name="text2" type="text" class="uautx1" id="realtx" maxlength="50" runat="server" />
                            </td>
                            <td class="uautd3">
                                <label id="label14" style="color: Red">
                                    *</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" BorderStyle="Solid"
                                    BorderWidth="1px" ControlToValidate="realtx" Display="Dynamic" ErrorMessage="不能为空"
                                    Height="18px"></asp:RequiredFieldValidator>
                                <%--    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="姓名只能为1-6个汉字"
                                            BorderStyle="Solid" BorderWidth="1px" ControlToValidate="realtx" Display="Dynamic"
                                            ValidationExpression="[\u4e00-\u9fa5]{1,6}" Height="18px"></asp:RegularExpressionValidator>--%>
                            </td>
                        </tr>
                        <tr>
                            <td class="uautd1">
                                身份证号:
                            </td>
                            <td class="uautd2">
                                <input name="text2" type="text" class="uautx1" id="pidTx" maxlength="50" runat="server" />
                            </td>
                            <td class="uautd3">
                                <label id="label6" style="color: Red">
                                    *</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" BorderStyle="Solid"
                                    BorderWidth="1px" ControlToValidate="pidTx" Display="Dynamic" ErrorMessage="不能为空"
                                    Height="18px"></asp:RequiredFieldValidator>
                                <%--   <asp:RegularExpressionValidator ID="RegularExpressionValidator15" runat="server"
                                            BorderStyle="Solid" BorderWidth="1px" Display="Dynamic" ControlToValidate="pidTx"
                                            ErrorMessage="身份证号必须为15或18位数字(支持X|x)" Height="18px" ValidationExpression="\d{17}[\d|X|x]|\d{15}"></asp:RegularExpressionValidator>--%>
                            </td>
                        </tr>
                        <tr>
                            <td class="uautd1">
                                联系电话:
                            </td>
                            <td class="uautd2">
                                <input name="text2" type="text" class="uautx1" id="phtx" maxlength="50" runat="server" />
                            </td>
                            <td class="uautd3">
                                <label id="label10" style="color: Red">
                                    *</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" BorderStyle="Solid"
                                    BorderWidth="1px" ControlToValidate="phtx" Display="Dynamic" ErrorMessage="不能为空"
                                    Height="18px"></asp:RequiredFieldValidator>
                                <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator16" runat="server"
                                            BorderStyle="Solid" BorderWidth="1px" Display="Dynamic" ControlToValidate="phtx"
                                            ErrorMessage="联系电话为11-12位数字" Height="18px" ValidationExpression="\d{11,12}"></asp:RegularExpressionValidator>--%>
                            </td>
                        </tr>
                        <tr>
                            <td class="uautd1">
                                联系地址:
                            </td>
                            <td class="uautd2">
                                <input name="text2" type="text" class="uautx1" id="addtx" maxlength="50" runat="server" />
                            </td>
                            <td class="uautd3">
                                <label id="label11" style="color: Red">
                                    *</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator112" runat="server" BorderStyle="Solid"
                                    BorderWidth="1px" ControlToValidate="addtx" Display="Dynamic" ErrorMessage="不能为空"
                                    Height="18px"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="uautd1">
                                联系邮编:
                            </td>
                            <td class="uautd2">
                                <input name="text2" type="text" class="uautx1" id="zipTx" maxlength="50" runat="server" />
                            </td>
                            <td class="uautd3">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="uautd1">
                                QQ/MSN:
                            </td>
                            <td class="uautd2">
                                <input name="text2" type="text" class="uautx1" id="qqNumTx" maxlength="50" runat="server" />
                            </td>
                            <td class="uautd3">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="uautd1">
                                &nbsp;
                            </td>
                            <td height="40" align="left">
                                <asp:Button ID="addUserBtn" runat="server" Text="提交注册" OnClick="addUserBtn_Click" />
                            </td>
                            <td class="uautd3">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        </div>
        <div id="bottom">
            <uc2:user_Bottom ID="user_Bottom1" runat="server" />
        </div>
        </form>
    </center>
</body>
</html>
