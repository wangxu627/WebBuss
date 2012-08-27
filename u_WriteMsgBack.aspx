<%@ Page Language="C#" AutoEventWireup="true" CodeFile="u_WriteMsgBack.aspx.cs" Inherits="u_WriteMsgBack" %>

<%@ Register Src="user_Bottom.ascx" TagName="user_Bottom" TagPrefix="uc1" %>
<%@ Register Src="user_Top.ascx" TagName="user_Top" TagPrefix="uc2" %>
<%@ Register Src="user_Left.ascx" TagName="user_Left" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>回复邮件</title>
    <link rel="Stylesheet" type="text/css" href="Css/Main.css" />
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
                                回复邮件</div>
                        </td>
                    </tr>
                </table>
                <div>
                    <label runat="server" id="titleLb" style="font-size: 18px; font-weight: bold; line-height: 30px">
                    </label>
                    <br />
                    <label runat="server" id="timeLb" style="font-size: 14px; line-height: 20px; margin-left: 500px">
                    </label>
                    <hr />
                    <div id="dataDiv" runat="server" style="padding-left: 15px; padding-right: 15px;
                        line-height: 20px; text-align: left">
                    </div>
                </div>
                <br />
                <hr />
                回复邮件:
                <div id="backDiv" runat="server" style="padding-left: 15px; padding-right: 15px;
                    line-height: 20px; text-align: left">
                    <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Height="97px" Width="516px"></asp:TextBox>
                    <asp:Button ID="toBackDataBt" runat="server" Text="回复邮件" OnClick="toBackDataBt_Click" />
                </div>
            </div>
        </div>
        <div id="bottom">
            <uc1:user_Bottom ID="user_Bottom1" runat="server" />
        </div>
        </form>
    </center>
</body>
</html>
