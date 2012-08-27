<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ad_WriteMsgBack.aspx.cs"
    Inherits="Admin_ad_WriteMsgBack" %>

<%@ Register Src="admin_Bottom.ascx" TagName="admin_Bottom" TagPrefix="uc1" %>
<%@ Register Src="admin_Top.ascx" TagName="admin_Top" TagPrefix="uc2" %>
<%@ Register Src="admin_Left.ascx" TagName="admin_Left" TagPrefix="uc3" %>
<%@ Register Assembly="WQeditor" Namespace="WQeditControl" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>阅读邮件</title>
    <link rel="Stylesheet" type="text/css" href="Css/Main.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="top">
        <uc2:admin_Top ID="admin_Top1" runat="server" />
    </div>
    <div id="main">
        <div id="left">
            <uc3:admin_Left ID="admin_Left1" runat="server" />
        </div>
        <div id="right">
            <div class="k">
                查看邮件</div>
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
            邮件回复:
            <br />
            <div id="backDiv" runat="server" style="padding-left: 15px; padding-right: 15px;
                line-height: 20px; text-align: left">
                <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Height="97px" Width="516px"></asp:TextBox>
                <asp:Button ID="toBackDataBt" runat="server" Text="回复邮件" OnClick="toBackDataBt_Click" />
            </div>
        </div>
    </div>
    <div id="bottom">
        <uc1:admin_Bottom ID="admin_Bottom1" runat="server" />
    </div>
    </form>
</body>
</html>
