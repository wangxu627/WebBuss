<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ad_ReferrTu.aspx.cs" Inherits="Admin_ad_ReferrTu" %>

<%@ Register Src="admin_Bottom.ascx" TagName="user_Bottom" TagPrefix="uc1" %>
<%@ Register Src="admin_Top.ascx" TagName="user_Top" TagPrefix="uc2" %>
<%@ Register Src="admin_Left.ascx" TagName="user_Left" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>推荐图</title>
    <link rel="Stylesheet" type="text/css" href="Css/Main.css" />
    <style type="text/css">
        .rfDiv1
        {
            width: 80%;
            line-height: 30px;
            font-size: 18px;
            font-weight: bold;
            height: 100%;
            vertical-align: middle;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="top">
        <uc2:user_Top ID="user_Top1" runat="server" />
    </div>
    <div id="main">
        <div id="left">
            <uc3:user_Left ID="user_Left1" runat="server" />
        </div>
        <div id="right">
            <div class="k">
                <label id="ShowTitle" runat="server">
                    推荐图</label></div>
            编号:&nbsp;&nbsp;
            <asp:TextBox ID="untx" runat="server" MaxLength="50" Width="100px"></asp:TextBox>
            &nbsp;
            <asp:Button ID="Button2" runat="server" Text="查找" OnClick="Button2_Click" />
            <div style="text-align: left" class="rfDiv1">
                <asp:TreeView ID="ReferrTree" runat="server" CssClass="td8" ShowLines="True" ExpandDepth="1"
                    OnSelectedNodeChanged="ReferrTree_SelectedNodeChanged" CollapseImageUrl="~/images/treeviewtwo.gif"
                    ExpandImageUrl="~/images/treeviewone.gif">
                    <NodeStyle BorderWidth="0px" />
                </asp:TreeView>
            </div>
        </div>
    </div>
    <div id="bottom">
        <uc1:user_Bottom ID="user_Bottom1" runat="server" />
    </div>
    </form>
</body>
</html>
