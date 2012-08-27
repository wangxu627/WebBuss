<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ad_ManaTu.aspx.cs" Inherits="Admin_ad_ManaTu" %>

<%@ Register Src="admin_Bottom.ascx" TagName="admin_Bottom" TagPrefix="uc1" %>
<%@ Register Src="admin_Top.ascx" TagName="admin_Top" TagPrefix="uc2" %>
<%@ Register Src="admin_Left.ascx" TagName="admin_Left" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>管理图</title>
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
        <div id="right" style="border-bottom: solid 1px">
            <div class="k">
                管理图</div>
            编号：<asp:TextBox ID="untx" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="搜索" OnClick="Button1_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton
                ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">返回上一层</asp:LinkButton>
            <br />
            <br />
            <table height="500" border="0" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC"
                style="background-image: Images/wl.png">
                <tr>
                    <td height="110" colspan="8" align="center">
                        <table width="100%" height="92" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="40%">
                                </td>
                                <td>
                                    <table width="95" height="92" border="0" align="center" cellpadding="0" cellspacing="0"
                                        class="table3">
                                        <tr>
                                            <td height="20" colspan="2" align="center" class="td4" runat="server" id="toptd">
                                                <asp:ImageButton ID="topImg" runat="server" OnClick="img1_Click" Height="16px" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="center" class="td4">
                                                <asp:Label ID="topunlb" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="center" class="td4">
                                                <asp:Label ID="toprnlb" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="51" align="center" class="td4">
                                                左
                                            </td>
                                            <td width="48" align="center" class="td4">
                                                右
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" class="td4">
                                                <asp:Label ID="tmb1" runat="server"></asp:Label>
                                            </td>
                                            <td align="center" class="td4">
                                                <asp:Label ID="tmn2" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td width="40%">
                                    <table width="80%" height="89" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <img src="../images/p1.gif" width="20" height="20" />
                                            </td>
                                            <td>
                                                A级
                                            </td>
                                            <td>
                                                <img src="../images/p2.gif" width="20" height="20" />
                                            </td>
                                            <td>
                                                B级
                                            </td>
                                            <td>
                                                <img src="../images/p4.gif" width="20" height="20" />
                                            </td>
                                            <td>
                                                C级
                                            </td>
                                            <td>
                                                <img src="../images/p5.gif" width="20" height="20" />
                                            </td>
                                            <td>
                                                D级
                                            </td>
                                            <td>
                                                <img src="../images/p6.gif" width="20" height="20" />
                                            </td>
                                            <td>
                                                空位
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="17" bgcolor="#F5DBC2">
                                            </td>
                                            <td>
                                                未审核
                                            </td>
                                            <td bgcolor="#FFB9B9">
                                            </td>
                                            <td>
                                                已审核
                                            </td>
                                            <td>
                                            </td>
                                            <td class="style1">
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td height="110" colspan="4" align="center">
                        <table width="95" height="92" border="0" cellpadding="0" cellspacing="0" class="table3">
                            <tr>
                                <td height="20" colspan="2" align="center" class="td4" runat="server" id="lefttd1">
                                    <asp:ImageButton ID="leftimg1" runat="server" OnClick="img1_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" class="td4">
                                    <asp:Label ID="leftunlb1" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" class="td4">
                                    <asp:Label ID="leftrnlb1" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td width="51" align="center" class="td4">
                                    左
                                </td>
                                <td width="48" align="center" class="td4">
                                    右
                                </td>
                            </tr>
                            <tr>
                                <td align="center" class="td4">
                                    <asp:Label ID="l1mn1" runat="server"></asp:Label>
                                </td>
                                <td align="center" class="td4">
                                    <asp:Label ID="l1mn2" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td colspan="4" align="center">
                        <table width="95" height="92" border="0" cellpadding="0" cellspacing="0" class="table3">
                            <tr>
                                <td height="20" colspan="2" align="center" class="td4" runat="server" id="righttd1">
                                    <asp:ImageButton ID="rightimg1" runat="server" OnClick="img1_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" class="td4">
                                    <asp:Label ID="rightunlb1" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" class="td4">
                                    <asp:Label ID="rightrnlb1" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td width="51" align="center" class="td4">
                                    左
                                </td>
                                <td width="48" align="center" class="td4">
                                    右
                                </td>
                            </tr>
                            <tr>
                                <td align="center" class="td4">
                                    <asp:Label ID="r1mn1" runat="server"></asp:Label>
                                </td>
                                <td align="center" class="td4">
                                    <asp:Label ID="r1mn2" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td height="110" colspan="2" align="center">
                        <table width="95" height="92" border="0" cellpadding="0" cellspacing="0" class="table3">
                            <tr>
                                <td height="20" colspan="2" align="center" class="td4" runat="server" id="lefttd2">
                                    <asp:ImageButton ID="leftimg2" runat="server" OnClick="img1_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" class="td4">
                                    <asp:Label ID="leftunlb2" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" class="td4">
                                    <asp:Label ID="leftrnlb2" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td width="51" align="center" class="td4">
                                    左
                                </td>
                                <td width="48" align="center" class="td4">
                                    右
                                </td>
                            </tr>
                            <tr>
                                <td align="center" class="td4">
                                    <asp:Label ID="l2mn1" runat="server"></asp:Label>
                                </td>
                                <td align="center" class="td4">
                                    <asp:Label ID="l2mn2" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td colspan="2" align="center">
                        <table width="95" height="92" border="0" cellpadding="0" cellspacing="0" class="table3">
                            <tr>
                                <td height="20" colspan="2" align="center" class="td4" runat="server" id="lefttd3">
                                    <asp:ImageButton ID="leftimg3" runat="server" OnClick="img1_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" class="td4">
                                    <asp:Label ID="leftunlb3" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" class="td4">
                                    <asp:Label ID="leftrnlb3" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td width="51" align="center" class="td4">
                                    左
                                </td>
                                <td width="48" align="center" class="td4">
                                    右
                                </td>
                            </tr>
                            <tr>
                                <td align="center" class="td4">
                                    <asp:Label ID="l3mn1" runat="server"></asp:Label>
                                </td>
                                <td align="center" class="td4">
                                    <asp:Label ID="l3mn2" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td colspan="2" align="center">
                        <table width="95" height="92" border="0" cellpadding="0" cellspacing="0" class="table3">
                            <tr>
                                <td height="10" colspan="2" align="center" class="td4" runat="server" id="righttd2">
                                    <asp:ImageButton ID="rightimg2" runat="server" OnClick="img1_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" class="td4">
                                    <asp:Label ID="rightunlb2" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" class="td4">
                                    <asp:Label ID="rightrnlb2" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td width="51" align="center" class="td4">
                                    左
                                </td>
                                <td width="48" align="center" class="td4">
                                    右
                                </td>
                            </tr>
                            <tr>
                                <td align="center" class="td4">
                                    <asp:Label ID="r2mn1" runat="server"></asp:Label>
                                </td>
                                <td align="center" class="td4">
                                    <asp:Label ID="r2mn2" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td colspan="2" align="center">
                        <table width="95" height="92" border="0" cellpadding="0" cellspacing="0" class="table3">
                            <tr>
                                <td height="10" colspan="2" align="center" class="td4" runat="server" id="righttd3">
                                    <asp:ImageButton ID="rightimg3" runat="server" OnClick="img1_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" class="td4">
                                    <asp:Label ID="rightunlb3" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" class="td4">
                                    <asp:Label ID="rightrnlb3" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td width="51" align="center" class="td4">
                                    左
                                </td>
                                <td width="48" align="center" class="td4">
                                    右
                                </td>
                            </tr>
                            <tr>
                                <td align="center" class="td4">
                                    <asp:Label ID="r3mn1" runat="server"></asp:Label>
                                </td>
                                <td align="center" class="td4">
                                    <asp:Label ID="r3mn2" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td width="14%" height="111" align="center">
                        <table width="95" height="92" border="0" cellpadding="0" cellspacing="0" class="table3">
                            <tr>
                                <td height="20" colspan="2" align="center" class="td4" runat="server" id="lefttd4">
                                    <asp:ImageButton ID="leftimg4" runat="server" OnClick="img1_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" class="td4">
                                    <asp:Label ID="leftunlb4" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" class="td4">
                                    <asp:Label ID="leftrnlb4" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td width="51" align="center" class="td4">
                                    左
                                </td>
                                <td width="48" align="center" class="td4">
                                    右
                                </td>
                            </tr>
                            <tr>
                                <td align="center" class="td4">
                                    <asp:Label ID="l4mn1" runat="server"></asp:Label>
                                </td>
                                <td align="center" class="td4">
                                    <asp:Label ID="l4mn2" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="11%" align="center">
                        <table width="95" height="92" border="0" cellpadding="0" cellspacing="0" class="table3">
                            <tr>
                                <td height="20" colspan="2" align="center" class="td4" runat="server" id="lefttd5">
                                    <asp:ImageButton ID="leftimg5" runat="server" OnClick="img1_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" class="td4">
                                    <asp:Label ID="leftunlb5" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" class="td4">
                                    <asp:Label ID="leftrnlb5" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td width="51" align="center" class="td4">
                                    左
                                </td>
                                <td width="48" align="center" class="td4">
                                    右
                                </td>
                            </tr>
                            <tr>
                                <td align="center" class="td4">
                                    <asp:Label ID="l5mn1" runat="server"></asp:Label>
                                </td>
                                <td align="center" class="td4">
                                    <asp:Label ID="l5mn2" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="14%" align="center">
                        <table width="95" height="92" border="0" cellpadding="0" cellspacing="0" class="table3">
                            <tr>
                                <td height="20" colspan="2" align="center" class="td4" runat="server" id="lefttd6">
                                    <asp:ImageButton ID="leftimg6" runat="server" OnClick="img1_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" class="td4">
                                    <asp:Label ID="leftunlb6" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" class="td4">
                                    <asp:Label ID="leftrnlb6" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td width="51" align="center" class="td4">
                                    左
                                </td>
                                <td width="51" align="center" class="td4">
                                    右
                                </td>
                            </tr>
                            <tr>
                                <td align="center" class="td4">
                                    <asp:Label ID="l6mn1" runat="server"></asp:Label>
                                </td>
                                <td align="center" class="td4">
                                    <asp:Label ID="l6mn2" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="11%" align="center">
                        <table width="95" height="92" border="0" cellpadding="0" cellspacing="0" class="table3">
                            <tr>
                                <td height="20" colspan="2" align="center" class="td4" runat="server" id="lefttd7">
                                    <asp:ImageButton ID="leftimg7" runat="server" OnClick="img1_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" class="td4">
                                    <asp:Label ID="leftunlb7" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" class="td4">
                                    <asp:Label ID="leftrnlb7" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td width="51" align="center" class="td4">
                                    左
                                </td>
                                <td width="51" align="center" class="td4">
                                    右
                                </td>
                            </tr>
                            <tr>
                                <td align="center" class="td4">
                                    <asp:Label ID="l7mn1" runat="server"></asp:Label>
                                </td>
                                <td align="center" class="td4">
                                    <asp:Label ID="l7mn2" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="14%" align="center">
                        <table width="95" height="92" border="0" cellpadding="0" cellspacing="0" class="table3">
                            <tr>
                                <td height="20" colspan="2" align="center" class="td4" runat="server" id="righttd4">
                                    <asp:ImageButton ID="rightimg4" runat="server" OnClick="img1_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" class="td4">
                                    <asp:Label ID="rightunlb4" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" class="td4">
                                    <asp:Label ID="rightrnlb4" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td width="51" align="center" class="td4">
                                    左
                                </td>
                                <td width="48" align="center" class="td4">
                                    右
                                </td>
                            </tr>
                            <tr>
                                <td align="center" class="td4">
                                    <asp:Label ID="r4mn1" runat="server"></asp:Label>
                                </td>
                                <td align="center" class="td4">
                                    <asp:Label ID="r4mn2" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="11%" align="center">
                        <table width="95" height="92" border="0" cellpadding="0" cellspacing="0" class="table3">
                            <tr>
                                <td height="20" colspan="2" align="center" class="td4" runat="server" id="righttd5">
                                    <asp:ImageButton ID="rightimg5" runat="server" OnClick="img1_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" class="td4">
                                    <asp:Label ID="rightunlb5" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" class="td4">
                                    <asp:Label ID="rightrnlb5" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td width="51" align="center" class="td4">
                                    左
                                    <td width="51" align="center" class="td4">
                                        右
                                    </td>
                            </tr>
                            <tr>
                                <td align="center" class="td4">
                                    <asp:Label ID="r5mn1" runat="server"></asp:Label>
                                </td>
                                <td align="center" class="td4">
                                    <asp:Label ID="r5mn2" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="14%" align="center">
                        <table width="95" height="92" border="0" cellpadding="0" cellspacing="0" class="table3">
                            <tr>
                                <td height="20" colspan="2" align="center" class="td4" runat="server" id="righttd6">
                                    <asp:ImageButton ID="rightimg6" runat="server" OnClick="img1_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" class="td4">
                                    <asp:Label ID="rightunlb6" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" class="td4">
                                    <asp:Label ID="rightrnlb6" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td width="51" align="center" class="td4">
                                    左
                                    <td width="51" align="center" class="td4">
                                        右
                                    </td>
                            </tr>
                            <tr>
                                <td align="center" class="td4">
                                    <asp:Label ID="r6mn1" runat="server"></asp:Label>
                                </td>
                                <td align="center" class="td4">
                                    <asp:Label ID="r6mn2" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="11%" align="center">
                        <table width="95" height="92" border="0" cellpadding="0" cellspacing="0" class="table3">
                            <tr>
                                <td height="20" colspan="2" align="center" class="td4" runat="server" id="righttd7">
                                    <asp:ImageButton ID="rightimg7" runat="server" OnClick="img1_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" class="td4">
                                    <asp:Label ID="rightunlb7" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" class="td4">
                                    <asp:Label ID="rightrnlb7" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td width="51" align="center" class="td4">
                                    左
                                    <td width="51" align="center" class="td4">
                                        右
                                    </td>
                            </tr>
                            <tr>
                                <td align="center" class="td4">
                                    <asp:Label ID="r7mn1" runat="server"></asp:Label>
                                </td>
                                <td align="center" class="td4">
                                    <asp:Label ID="r7mn2" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div id="bottom">
        <uc1:admin_Bottom ID="admin_Bottom1" runat="server" />
    </div>
    </form>
</body>
</html>
