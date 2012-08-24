<%@ Page Language="C#" AutoEventWireup="true" CodeFile="u_ZhuanzhangTwo.aspx.cs"
    Inherits="u_ZhuanzhangTwo" %>

<%@ Register Src="user_Top.ascx" TagName="user_Top" TagPrefix="uc1" %>
<%@ Register Src="user_Bottom.ascx" TagName="user_Bottom" TagPrefix="uc2" %>
<%@ Register Src="user_Left.ascx" TagName="user_Left" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>注册钱包转账</title>
    <link rel="Stylesheet" type="text/css" href="Css/Main.css" />
    <script type="text/javascript">
        function ShowSunbit() {
            var name = document.getElementById("TextBox1").value;
            var money = document.getElementById("TextBox2").value;

            if (confirm("您确定要给会员  " + name + "  转账  " + money + "  美元吗？")) {
                return true;
            }
            else {
                return false;
            }
        }
    </script>
</head>
<body>
    <center>
        <form id="form1" runat="server" onsubmit="return ShowSunbit()">
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
                                注册钱包转账</div>
                        </td>
                    </tr>
                </table>
                <div style="line-height: 20px; padding-left: 35px; font: 15px; margin-bottom: 20px;
                    margin-top: 20px" class="zi">
                    注册钱包余额:<asp:Label ID="lmlb" runat="server"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp; 历史转出总计:<asp:Label ID="outlb" runat="server"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp; 历史转入总计:<asp:Label ID="inlb" runat="server"></asp:Label>
                </div>
                <table width="80%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="18%">
                            <img src="images/db_comit.png" width="128" height="128" />
                        </td>
                        <td width="82%">
                            <table width="400" border="0" cellpadding="0" cellspacing="0" class="table3" id="tbZz"
                                runat="server">
                                <tr>
                                    <td colspan="2" align="right" class="td3">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="td3">
                                        转账对象
                                    </td>
                                    <td align="left" class="td3">
                                        <asp:TextBox ID="TextBox1" runat="server" Width="180px"></asp:TextBox>
                                        *
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="td3">
                                        &nbsp;
                                    </td>
                                    <td align="left" class="td3">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="不能为空"
                                            BorderStyle="Solid" BorderWidth="1px" ControlToValidate="TextBox1" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="td3">
                                        转账金额
                                    </td>
                                    <td align="left" class="td3">
                                        <asp:TextBox ID="TextBox2" runat="server" Width="180px"></asp:TextBox>
                                        *
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="td3">
                                        &nbsp;
                                    </td>
                                    <td align="left" class="td3">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="不能为空"
                                            BorderStyle="Solid" BorderWidth="1px" ControlToValidate="TextBox2" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="金额必须是正数"
                                            BorderStyle="Solid" BorderWidth="1px" ControlToValidate="TextBox2" Display="Dynamic"
                                            ValidationExpression="\d{1,}(\.\d{1,4})?"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="td3">
                                        备注
                                    </td>
                                    <td align="left" class="td3">
                                        <asp:TextBox ID="TextBox3" runat="server" Width="245px" Height="20px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="td3">
                                        &nbsp;
                                    </td>
                                    <td align="left" class="td3">
                                        <asp:Button ID="Button1" runat="server" Text="转账" OnClick="Button1_Click" Style="height: 26px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="td3">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
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
