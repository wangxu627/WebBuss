<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ad_WriteGg.aspx.cs" Inherits="Admin_ad_WriteGg" %>

<%@ Register Assembly="WQeditor" Namespace="WQeditControl" TagPrefix="cc1" %>
<%@ Register Src="admin_Left.ascx" TagName="admin_Left" TagPrefix="uc1" %>
<%@ Register Src="admin_Top.ascx" TagName="admin_Top" TagPrefix="uc2" %>
<%@ Register Src="admin_Bottom.ascx" TagName="admin_Bottom" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>编辑公告</title>
    <link rel="Stylesheet" type="text/css" href="Css/Main.css" />
    <style type="text/css">
        .adwgtb1
        {
            width: 80%;
            margin-left: 20px;
            margin-top: 30px;
        }
        
        .adwgtd1
        {
            text-align: center;
            line-height: 30px;
            width: 15%;
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
                添加公告</div>
            <table class="adwgtb1">
                <tr>
                    <td class="adwgtd1">
                        标题:
                    </td>
                    <td align="left">
                        <asp:TextBox ID="tltx" runat="server" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVd1" runat="server" ErrorMessage="标题不能为空" ControlToValidate="tltx"
                            Display="Dynamic" BorderStyle="Solid" BorderWidth="1px"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="adwgtd1">
                        正文:
                    </td>
                    <td align="left">
                        <cc1:WQeditor ID="WQeditor1" runat="server" Height="300px" Width="450px">
                        </cc1:WQeditor>
                    </td>
                </tr>
                <tr>
                    <td class="adwgtd1">
                        提交:
                    </td>
                    <td align="left">
                        <asp:ImageButton ID="AddImgbt1" runat="server" ImageUrl="images/btn_add.gif" OnClick="AddImgbt1_Click" />
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
