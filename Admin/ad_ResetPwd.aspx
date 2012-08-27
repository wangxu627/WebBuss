<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ad_ResetPwd.aspx.cs" Inherits="Admin_ad_ResetPwd" %>

<%@ Register Src="admin_Left.ascx" TagName="admin_Left" TagPrefix="uc1" %>
<%@ Register Src="admin_Top.ascx" TagName="admin_Top" TagPrefix="uc2" %>
<%@ Register Src="admin_Bottom.ascx" TagName="admin_Bottom" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>修改密码</title>
    <link rel="Stylesheet" type="text/css" href="Css/Main.css" />
    <style type="text/css">
        .adrstb1
        {
            padding-right: 10px;
        }
        
        .adrstd1
        {
            text-align: left;
            line-height: 25px;
            padding-left: 10px;
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
            <uc1:admin_Left ID="admin_Left1" runat="server" />
        </div>
        <div id="right">
            <div class="k">
                密码管理</div>
            <p>
                &nbsp;</p>
            <table width="56%" height="145" border="1" cellpadding="0" cellspacing="0" bordercolor="#868FA1">
                <tr>
                    <td width="25%" align="right" class="adrstb1">
                        原密码
                    </td>
                    <td width="75%" class="adrstd1">
                        <asp:TextBox ID="optx" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="原密码不能为空"
                            BorderStyle="Solid" BorderWidth="1px" Display="Dynamic" ControlToValidate="optx"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="adrstb1">
                        新密码
                    </td>
                    <td class="adrstd1">
                        <asp:TextBox ID="nptx1" runat="server" TextMode="Password" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="新密码不能为空"
                            BorderStyle="Solid" BorderWidth="1px" ControlToValidate="nptx1" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="adrstb1">
                        确认密码
                    </td>
                    <td class="adrstd1">
                        <asp:TextBox ID="nptx2" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="两次新密码输入不一致"
                            BorderStyle="Solid" BorderWidth="1px" ControlToCompare="nptx1" Display="Dynamic"
                            ControlToValidate="nptx2"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="adrstb1">
                        提交
                    </td>
                    <td class="adrstd1">
                        <asp:Button ID="ToSave" runat="server" Text="保存" Width="60px" Height="25px" Font-Bold="true"
                            OnClick="ToSave_Click" />
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
