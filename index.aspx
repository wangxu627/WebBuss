<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <style type="text/css">
<!--
body,td,th {
	font-size: 12px;
	color: #000000;
}
.bt1
{
color:#FFFFCC;
border:solid 1px #584445;
background-color:#191311;
width:135px;
margin:auto;
text-align:left;
}
.bt2{
color:#FFFFCC;
border:solid 1px #584445;
background-color:#191311;
width:135px;
text-align:left;
}
.bt3{
color:#FFFFCC;
border:solid 1px #584445;
background-color:#191311;
width:70px;
text-align:left;
}
.bt4{
color:#FFFFCC;
border:solid 1px #584445;
background-color:#191311;
padding-left:5px;
padding-right:5px;
padding-top:2px;
padding-bottom:1px;
}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(images/imaggf28.jpg);
	background-color: #7F0919;
	background-repeat: repeat-x;
}
a {
	font-size: 12px;
	color: #FFFFCC;
}
a:visited {
	color: #FFFFCC;
}
a:hover {
	color: #ff0000;
}
-->
</style>
    <title>BITD User Login</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
    <form id="form1" runat="server">
    <table width="990" height="650" border="0" align="center" cellpadding="0" cellspacing="0"
        background="images/image28.jpg">
        <tr>
            <td height="124" valign="top">
                <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0"
                    width="973" height="124">
                    <param name="movie" value="images/other11.swf" />
                    <param name="quality" value="high" />
                    <param name="wmode" value="transparent" />
                    <embed src="images/other11.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer"
                        type="application/x-shockwave-flash" width="973" height="124"></embed>
                </object>
            </td>
        </tr>
        <tr>
            <td align="center" valign="top">
                <div align="center">
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <table width="400" border="0" align="right" cellpadding="3" cellspacing="3" bordercolor="#993300">
                        <tr>
                            <td width="75" align="right">
                                <span class="bt4">会员名</span>
                            </td>
                            <td colspan="2" align="left">
                                <asp:TextBox CssClass="bt1" ID="untx" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td width="75" align="right">
                                <span class="bt4">密&nbsp;&nbsp;&nbsp; 码</span>
                            </td>
                            <td colspan="2" align="left">
                                <asp:TextBox ID="pstx" runat="server" CssClass="bt1" TextMode="Password"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td width="75" align="right">
                                <span class="bt4">验证码</span>
                            </td>
                            <td width="68" align="left">
                                <asp:TextBox ID="yztx" runat="server" CssClass="bt3"></asp:TextBox>
                            </td>
                            <td width="227" align="left">
                                <img src="yanzhengma.aspx" alt="点击更新验证码" onclick="javascript:window.location.reload();" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                &nbsp;
                            </td>
                            <td colspan="2" align="left">
                                <asp:ImageButton ImageUrl="~/images/lgd.gif" runat="server" ID="loginilbt" OnClick="loginilbt_Click" />
                            </td>
                        </tr>
                    </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
