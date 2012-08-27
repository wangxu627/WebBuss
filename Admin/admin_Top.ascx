<%@ Control Language="C#" AutoEventWireup="true" CodeFile="admin_Top.ascx.cs" Inherits="Admin_admin_Top" %>
<style type="text/css">
<!--
.trrrrrr{
	font-size: 14px;
	font-weight: bold;
	color: #000000;
}
.STYLE1 {
	font-size: 36px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-weight: bold;
}
-->
</style>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
  
  
  <tr>
    <td width="443" align="left" background="images/t_02.jpg"><img src="images/t_01.jpg" width="443" height="117" /></td>
    <td align="right" background="images/t_02.jpg"><img src="images/t_03.jpg" width="551" height="117" /></td>
  </tr>
  <tr>
    <td height="35" align="left" bgcolor="#CCCCCC">&nbsp;</td>
    <td width="580" height="35" align="right" bgcolor="#CCCCCC"><span class="trrrrrr">今天是： 
    <script language="JavaScript" type="text/javascript">
        today = new Date();
        function initArray() {
            this.length = initArray.arguments.length
            for (var i = 0; i < this.length; i++)
                this[i + 1] = initArray.arguments[i]
        }
        var d = new initArray("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
        document.write(today.getYear(), "年", today.getMonth() + 1, "月", today.getDate(), "日 ", d[today.getDay() + 1]
); 
    </script></span>&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td height="10" colspan="2" align="left"></td>
  </tr>
</table>