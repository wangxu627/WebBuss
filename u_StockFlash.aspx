<%@ Page Language="C#" AutoEventWireup="true" CodeFile="u_StockFlash.aspx.cs" Inherits="u_StockFlash" %>

<%@ Register Src="user_Left.ascx" TagName="user_Left" TagPrefix="uc1" %>
<%@ Register Src="user_Bottom.ascx" TagName="user_Bottom" TagPrefix="uc2" %>
<%@ Register Src="user_Top.ascx" TagName="user_Top" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>交易走势图</title>
    <link rel="Stylesheet" type="text/css" href="Css/Main.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="top">
        <uc3:user_Top ID="user_Top1" runat="server" />
    </div>
    <div id="main">
        <div id="left">
            <uc1:user_Left ID="user_Left1" runat="server" />
        </div>
        <div id="right">
            <table width="1000" height="80" border="0" align="center" cellpadding="0" cellspacing="0"
                background="images/imagdsde3.jpg">
                <tr>
                    <td>
                        <div class="k1">
                            交易走势图</div>
                    </td>
                </tr>
            </table>
            <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" style="background-color: #E9DBCE;">
                <tr>
                    <td>
                        <script src="payStock/swfobject.js" type="text/javascript"></script>
                        <div id="flashcontent">
                            <strong>您需要升级您的Flash播放器</strong>
                        </div>
                        <script type="text/javascript">
                            // <![CDATA[
                            var so = new SWFObject("payStock/amstock.swf", "amstock", "820", "450", "8", "#FFFFFF");
                            so.addParam("wmode", "transparent");
                            so.addVariable("path", "payStock/");
                            so.addVariable("settings_file", encodeURIComponent("payStock/amstock_settings.xml"));
                            so.addVariable("preloader_color", "#999999");
                            //  so.addVariable("chart_settings", "");
                            //  so.addVariable("additional_chart_settings", "");
                            //  so.addVariable("loading_settings", "Loading settings");
                            //  so.addVariable("error_loading_file", "ERROR LOADING FILE: ");

                            so.write("flashcontent");
                            // ]]>
                        </script>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div id="bottom">
        <uc2:user_Bottom ID="user_Bottom1" runat="server" />
    </div>
    </form>
</body>
</html>
