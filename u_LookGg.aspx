<%@ Page Language="C#" AutoEventWireup="true" CodeFile="u_LookGg.aspx.cs" Inherits="u_LookGg" %>

<%@ Register Src="user_Left.ascx" TagName="user_Left" TagPrefix="uc1" %>
<%@ Register Src="user_Bottom.ascx" TagName="user_Bottom" TagPrefix="uc2" %>
<%@ Register Src="user_Top.ascx" TagName="user_Top" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>查看公告</title>
    <link rel="Stylesheet" type="text/css" href="Css/Main.css" />
</head>
<body>
    <center>
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
                                查看公告</div>
                        </td>
                    </tr>
                </table>
                <div>
                    <div style="border-bottom: dotted 1px #CCCCCC; width: 95%">
                        &nbsp;
                        <label runat="server" id="titleLb" style="line-height: 30px" class="zi">
                        </label>
                    </div>
                    <br />
                    <label runat="server" id="timeLb" style="line-height: 20px; margin-left: 500px; font-size: 14px;">
                    </label>
                    <div id="dataDiv" runat="server" style="padding-left: 15px; padding-right: 15px;
                        line-height: 23px; text-align: left; font-size: 14px;">
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
