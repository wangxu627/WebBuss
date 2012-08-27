<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TwoLogin.aspx.cs" Inherits="TwoLogin" %>

<%@ Register Src="user_Top.ascx" TagName="TopStaus" TagPrefix="uc1" %>
<%@ Register Src="user_Bottom.ascx" TagName="BottomStatus" TagPrefix="uc2" %>
<%@ Register Src="user_Left.ascx" TagName="left1" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>二級密碼驗證</title>
    <link rel="Stylesheet" type="text/css" href="CSS/Main.css" />
    <script type="text/javascript">
        function keyDown() {
            if (event.keyCode == 13) {
                document.getElementById("TwoLoginBt").focus();
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="top">
        <uc1:TopStaus ID="TopStaus1" runat="server" />
    </div>
    <div id="main">
        <div id="left">
            <uc3:left1 ID="Left1" runat="server" />
        </div>
        <div id="right" onkeydown="keyDown()">
            <table width="1000" height="80" border="0" align="center" cellpadding="0" cellspacing="0"
                background="images/imagdsde3.jpg">
                <tr>
                    <td>
                        <div class="k1">
                            输入您的二级密码</div>
                    </td>
                </tr>
            </table>
            <table style="width: 500px; height: 195px;" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="center">
                        <div>
                            <img src="images/01.png" width="128" height="128" /><br />
                            <br />
                            请输入您的二级密码：
                            <asp:TextBox ID="TwoPwdtx" runat="server" TextMode="Password" Width="80px"></asp:TextBox>
                            &nbsp;
                            <asp:Button ID="TwoLoginBt" runat="server" Text="提交" OnClick="TwoLoginBt_Click" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TwoPwdtx"
                                ErrorMessage="不能为空" SetFocusOnError="True"></asp:RequiredFieldValidator></div>
                    </td>
                </tr>
            </table>
            <p>
                &nbsp;</p>
            <p>
                &nbsp;</p>
            <p>
                &nbsp;</p>
        </div>
    </div>
    <div id="bottom">
        <uc2:BottomStatus ID="BottomStatus1" runat="server" />
    </div>
    </form>
</body>
</html>
