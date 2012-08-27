<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ad_AddFenHong.aspx.cs" Inherits="Admin_ad_AddFenHong" %>

<%@ Register Src="admin_Top.ascx" TagName="admin_Top" TagPrefix="uc1" %>
<%@ Register Src="admin_Left.ascx" TagName="admin_Left" TagPrefix="uc2" %>
<%@ Register Src="admin_Bottom.ascx" TagName="admin_Bottom" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>会员分红</title>
    <link rel="Stylesheet" type="text/css" href="Css/Main.css" />
    <style type="text/css">
        .style1
        {
            width: 60%;
            margin-top:20px;
            margin-bottom:20px;
            line-height:20px;
        }
        .sstd1
        {
            width:30%;
            text-align:right;
            padding-right:10px;
        }
        .sstd2
        {
            width:35%;
            text-align:left;
            padding-left:10px;
        }
        .sstd3
        {
            text-align:left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="top">
        <uc1:admin_Top ID="admin_Top1" runat="server" />
    </div>
    <div id="main">
        <div id="left">
            <uc2:admin_Left ID="admin_Left1" runat="server" />
        </div>
        <div id="right">
            <div class="k">
                会员分红</div>
            <table class="style1" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="sstd1">
                        分红总额:
                    </td>
                    <td class="sstd2">
                        <asp:TextBox ID="allMoneyTx" runat="server" Width="60px"></asp:TextBox></td>
                    <td class="sstd3">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ErrorMessage="不能为空" 
                            ControlToValidate="allMoneyTx" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator10" runat="server" 
                            ControlToValidate="allMoneyTx" Display="Dynamic" ErrorMessage="必须为大于等于0的数字" 
                            MaximumValue="10000000" MinimumValue="0" Type="Double"></asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Button ID="addUserBtn" runat="server" Text="分红" OnClick="addUserBtn_Click"/>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                </tr>
            </table>
        </div>
    </div>
    <div id="bottom">
        <uc3:admin_Bottom ID="admin_Bottom1" runat="server" />
    </div>
    </form>
</body>
</html>

