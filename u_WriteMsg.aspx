<%@ Page Language="C#" AutoEventWireup="true" CodeFile="u_WriteMsg.aspx.cs" Inherits="u_WriteMsg" %>

<%@ Register Src="user_Bottom.ascx" TagName="user_Bottom" TagPrefix="uc1" %>
<%@ Register Src="user_Top.ascx" TagName="user_Top" TagPrefix="uc2" %>
<%@ Register Src="user_Left.ascx" TagName="user_Left" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>发送邮件</title>
    <link rel="Stylesheet" type="text/css" href="Css/Main.css" />
    <style type="text/css">
        .wmtb1
        {
            width: 95%;
            margin-left: 30px;
            margin-top: 50px;
            text-align: left;
        }
        .wmtd1
        {
            width: 15%;
            text-align: right;
            line-height: 20px;
            padding-right: 10px;
        }
    </style>
    <script type="text/javascript">
        function keyDown() {
            if (event.keyCode == 13) {
                document.getElementById("AddMsgIbt").focus();
            }
        }
    </script>
</head>
<body>
    <center>
        <form id="form1" runat="server" onkeydown="keyDown()">
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
                                发送邮件</div>
                        </td>
                    </tr>
                </table>
                <table class="wmtb1">
                    <tr>
                        <td class="wmtd1">
                            主题
                        </td>
                        <td>
                            <asp:TextBox ID="tltx" runat="server" Width="51%" MaxLength="50"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="wmtd1">
                            &nbsp;
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="wmvc1" runat="server" ControlToValidate="tltx" Display="Dynamic"
                                ErrorMessage="邮件标题不能为空" BorderStyle="Solid" BorderWidth="1px"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" class="wmtd1">
                            正文
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Height="97px" Width="516px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="wmtd1">
                            &nbsp;
                        </td>
                        <td>
                            <asp:ImageButton ID="AddMsgIbt" runat="server" ImageUrl="~/images/btn_add.gif" AlternateText="发送"
                                OnClick="AddMsgIbt_Click" />
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
