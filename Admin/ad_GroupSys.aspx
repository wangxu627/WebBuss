<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ad_GroupSys.aspx.cs" Inherits="Admin_ad_GroupSys" %>

<%@ Register Src="admin_Bottom.ascx" TagName="admin_Bottom" TagPrefix="uc1" %>
<%@ Register Src="admin_Top.ascx" TagName="admin_Top" TagPrefix="uc2" %>
<%@ Register Src="admin_Left.ascx" TagName="admin_Left" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>等级设置</title>
    <link rel="Stylesheet" type="text/css" href="Css/Main.css" />
    <style type="text/css">
        .style1 {
            width: 95%;
            margin-top: 20px;
            line-height: 25px;
            text-align: left;
        }
    </style>
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
                等级设置</div>
            <table class="style1" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        &nbsp; 一: 注册金额
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;从男爵级
                        <asp:TextBox ID="regMoneyTx1" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        $&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;男爵级
                        <asp:TextBox ID="regMoneyTx2" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        $ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;子爵级
                        <asp:TextBox ID="regMoneyTx3" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        $ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;伯爵级
                        <asp:TextBox ID="regMoneyTx4" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
			$ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;侯爵级
                        <asp:TextBox ID="regMoneyTx5" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
			$ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;公爵级
                        <asp:TextBox ID="regMoneyTx6" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        ￡
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp; 二: 注册单数
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A级
                        <asp:TextBox ID="regCountTx1" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        &nbsp; &nbsp; &nbsp; &nbsp;B级
                        <asp:TextBox ID="regCountTx2" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;C级
                        <asp:TextBox ID="regCountTx3" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;D级
                        <asp:TextBox ID="regCountTx4" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        &nbsp;&nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp; 三: 配送股金
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A级
                        <asp:TextBox ID="gpMoneyTx1" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        &nbsp; $&nbsp;&nbsp;&nbsp;&nbsp;B级
                        <asp:TextBox ID="gpMoneyTx2" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        &nbsp; $ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C级
                        <asp:TextBox ID="gpMoneyTx3" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        &nbsp; $ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D级
                        <asp:TextBox ID="gpMoneyTx4" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        &nbsp; $
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp; 四: 内部股
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A级
                        <asp:TextBox ID="noMoneyTx1" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        &nbsp; $&nbsp;&nbsp;&nbsp;&nbsp;B级
                        <asp:TextBox ID="noMoneyTx2" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        &nbsp; $ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C级
                        <asp:TextBox ID="noMoneyTx3" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        &nbsp; $ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D级
                        <asp:TextBox ID="noMoneyTx4" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        &nbsp; $
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp; 五: 冻结日期
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A级
                        <asp:TextBox ID="noMonthTx1" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        &nbsp; 月&nbsp;&nbsp;&nbsp;&nbsp;B级
                        <asp:TextBox ID="noMonthTx2" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        &nbsp; 月 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C级
                        <asp:TextBox ID="noMonthTx3" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        &nbsp; 月 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D级
                        <asp:TextBox ID="noMonthTx4" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        &nbsp; 月
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp; 六: 日封顶
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A级
                        <asp:TextBox ID="dayTopTx1" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        &nbsp; $&nbsp;&nbsp;&nbsp;&nbsp;B级
                        <asp:TextBox ID="dayTopTx2" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        &nbsp; $ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C级
                        <asp:TextBox ID="dayTopTx3" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        &nbsp; $ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D级
                        <asp:TextBox ID="dayTopTx4" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        &nbsp; $
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp; 七: 推荐比例
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A级
                        <asp:TextBox ID="refPicTx1" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        &nbsp; %&nbsp;&nbsp;&nbsp;B级
                        <asp:TextBox ID="refPicTx2" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        &nbsp; % &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C级
                        <asp:TextBox ID="refPicTx3" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        &nbsp; % &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D级
                        <asp:TextBox ID="refPicTx4" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        &nbsp; %
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp; 八: 市场推广奖金额
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A级
                        <asp:TextBox ID="pengMoneyTx1" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        &nbsp; $&nbsp;&nbsp;&nbsp;&nbsp;B级
                        <asp:TextBox ID="pengMoneyTx2" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        &nbsp; $ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C级
                        <asp:TextBox ID="pengMoneyTx3" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        &nbsp; $ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D级
                        <asp:TextBox ID="pengMoneyTx4" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        &nbsp; $
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp; 九: 销售管理奖
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A级
                        <asp:TextBox ID="refCellsTx1" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        &nbsp; 代&nbsp;&nbsp;&nbsp;&nbsp;B级
                        <asp:TextBox ID="refCellsTx2" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        &nbsp; 代 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C级
                        <asp:TextBox ID="refCellsTx3" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        &nbsp; 代 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D级
                        <asp:TextBox ID="refCellsTx4" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                        &nbsp; 代
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <p>
                            &nbsp;
                        </p>
                        <p>
                            <asp:Button ID="Button3" runat="server" Text="保存修改" OnClick="Button1_Click" />
                        </p>
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
