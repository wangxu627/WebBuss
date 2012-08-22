<%@ Page Language="C#" AutoEventWireup="true" CodeFile="u_Huanying.aspx.cs" Inherits="u_Huanying" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Src="user_Bottom.ascx" TagName="user_Bottom" TagPrefix="uc1" %>
<%@ Register Src="user_Top.ascx" TagName="user_Top" TagPrefix="uc2" %>
<%@ Register Src="user_Left.ascx" TagName="user_Left" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>欢迎登录</title>
    <link rel="Stylesheet" type="text/css" href="Css/Main.css" />
    <style type="text/css">
        .ugggv1
        {
            margin-left: 20px;
            margin-top: 40px;
            line-height: 22px;
        }
        
        .trrrrrr
        {
            font-size: 14px;
            font-weight: bold;
            color: #ff3300;
            float: right;
        }
        .STYLE1
        {
            font-size: 36px;
            font-family: Verdana, Arial, Helvetica, sans-serif;
            font-weight: bold;
        }
    </style>
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
                                欢迎登陆</div>
                        </td>
                    </tr>
                </table>
                <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="44%" align="left" valign="top">
                            <img src="images/banner4.jpg" width="400" height="189" />
                            <br />
                            <asp:GridView ID="GridView1" runat="server" Width="90%" CssClass="td7" AutoGenerateColumns="False"
                                OnRowDataBound="GridView1_RowDataBound" ShowHeader="False">
                                <Columns>
                                    <asp:BoundField HeaderText="公告标题">
                                        <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" BorderStyle="None" CssClass="td7" />
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                        </td>
                        <td width="56%" height="168" align="left" valign="top">
                            <p>
                                尊敬的&nbsp;
                                <asp:Label ID="unlb" runat="server" Font-Bold="True" ForeColor="#FF3300"></asp:Label>
                                ：您好！<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 欢迎登录，希望在这里您能感觉愉快，开心。有任何问题可通过站内邮件与我们联系，我们将尽力为您排忧解难。
                                <br />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 祝您身体健康、开开心心每一天！</p>
                            <p>
                                &nbsp;
                            </p>
                            <table width="98%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td align="center">
                                        <a href="u_GongGao.aspx">
                                            <img src="images/moblie_icon_002.png" width="72" height="72" border="0" /><br />
                                            公司公告 </a>
                                    </td>
                                    <td align="center">
                                        <a href="u_ClearAwardList.aspx">
                                            <img src="images/moblie_icon_001.png" width="72" height="72" border="0" /><br />
                                            奖金明细</a>
                                    </td>
                                    <td align="center">
                                        <a href="u_AddUsers.aspx">
                                            <img src="images/moblie_icon_007.png" width="72" height="72" border="0" /><br />
                                            会员注册</a>
                                    </td>
                                    <td align="center">
                                        <a href="u_ReferrTu.aspx">
                                            <img src="images/msnnew_009.png" width="72" height="72" border="0" /><br />
                                            推荐关系</a>
                                    </td>
                                </tr>
                            </table>
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
