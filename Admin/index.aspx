<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Admin_index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>管理员登陆</title>
     <style type="text/css">
        .style1
        {
            width: 380px;
            margin-left:350px;
        }
        .intd1
        {
            text-align:right;
            height:25px;
        }
        
        .intd2
        {
            text-align:left;
            width:80%;
        }
        
        .bx1
        {
            width:110px;
			background-color:#f6f6f6;
			border:solid 1px #CCCCCC;
			color:#000000;
        }
        
        .bt1
        {
            text-align:left;
            width:60px;
            height:25px;
            margin-left:80px;
        }
    body,td,th {
	font-size: 12px;
	color: #ffffff;
}
body {
	background-image: url(images/b1.jpg);
}

     #Layer2 {
	position:absolute;
	width:200px;
	height:115px;
	z-index:2;
	left: 341px;
	top: 13px;
}
     .STYLE2 {color: #ffffff}
     .STYLE3 {
	font-size: 36px;
	font-weight: bold;
	color: #FFFFFF;
}
     </style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body>
    <form id="form1" runat="server">
      <p>&nbsp;</p>
      <table width="793" height="483" border="0" align="center" cellpadding="0" cellspacing="0">
        
        <tr>
          <td valign="top" background="images/20081021043000720.jpg" style="padding-left:100px;padding-top:170px">
		  <table width="350" align="center" >
        <tr>
            <td align="right">
                管理账号            </td>
            <td colspan="2" align="left">
                <asp:TextBox ID="untx" runat="server" CssClass="bx1"></asp:TextBox>            </td>
        </tr>
        <tr>
            <td align="right">
                登录密码            </td>
            <td colspan="2" align="left">
                <asp:TextBox CssClass="bx1" ID="pstx" runat="server" TextMode="Password" ></asp:TextBox>            </td>
        </tr>
        <tr>
            <td align="right">
                验证码            </td>
            <td width="110" align="left" valign="bottom">
                <asp:TextBox ID="yztx" runat="server" CssClass="bx1"></asp:TextBox></td>
            <td width="150" align="left" valign="bottom"><img alt="点击更新验证码" src="../yanzhengma.aspx" onclick="javascript:window.location.reload();" /></td>
        </tr>
        <tr>
            <td >&nbsp;</td>
            <td colspan="2" align="left"  ><asp:ImageButton ImageUrl="images/dl.gif" runat="server"  
                    ID="loginilbt" onclick="loginilbt_Click"/></td>
        </tr>
    </table>         </td>
        </tr>
      </table>
      
      <div>
        <div align="center" class="STYLE2">Copyright 2010-2011  all Rights Reserved.本网站所有资源 版权所有</div>
      </div>
    </form>
</body>
</html>