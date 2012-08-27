<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ad_Bochu.aspx.cs" Inherits="Admin_ad_Bochu" %>

<%@ Register Src="admin_Bottom.ascx" TagName="admin_Bottom" TagPrefix="uc1" %>
<%@ Register Src="admin_Top.ascx" TagName="admin_Top" TagPrefix="uc2" %>
<%@ Register Src="admin_Left.ascx" TagName="admin_Left" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>拨出情况</title>
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
        <div id="right">
            <div class="k">
                拨出比</div>
            <div style="margin-top: 10px; font-size: 20px; line-height: 30px; text-align: center"
                id="ShowHeadDiv" runat="server">
            </div>
            <table width="80%" border="0" cellpadding="0" cellspacing="0" class="table3" style="line-height: 25px;">
                <tr>
                    <td colspan="4" align="center" class="td3">
                        收入总计：
                        <label id="allMoneyLb" runat="server">
                        </label>
                        美元
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td3" style="width: 20%">
                        直接销售奖总计：
                    </td>
                    <td align="left" class="td3" style="width: 30%">
                        <label id="refAwardLb" runat="server">
                        </label>
                        美元
                    </td>
                    <td align="right" class="td3" style="width: 20%">
                        拨比：
                    </td>
                    <td align="left" class="td3" style="width: 30%">
                        <label id="refAwardPicLb" runat="server">
                        </label>
                        %
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td3">
                        市场推广奖总计：
                    </td>
                    <td align="left" class="td3">
                        <label id="pengAwardLb" runat="server">
                        </label>
                        美元
                    </td>
                    <td align="right" class="td3">
                        拨比：
                    </td>
                    <td align="left" class="td3">
                        <label id="pengAwardPicLb" runat="server">
                        </label>
                        %
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td3">
                        销售管理奖总计：
                    </td>
                    <td align="left" class="td3">
                        <label id="refPengAwardLb" runat="server">
                        </label>
                        美元
                    </td>
                    <td align="right" class="td3">
                        拨比：
                    </td>
                    <td align="left" class="td3">
                        <label id="refPengAwardPicLb" runat="server">
                        </label>
                        %
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td3">
                        分红奖总计：
                    </td>
                    <td align="left" class="td3">
                        <label id="fenHongAwardLb" runat="server">
                        </label>
                        美元
                    </td>
                    <td align="right" class="td3">
                        拨比：
                    </td>
                    <td align="left" class="td3">
                        <label id="fenHongAwardPicLb" runat="server">
                        </label>
                        %
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td3">
                        拨出总计：
                    </td>
                    <td align="left" class="td3">
                        <label id="allAwardLb" runat="server">
                        </label>
                        美元
                    </td>
                    <td align="right" class="td3">
                        总拨出比：
                    </td>
                    <td align="left" class="td3">
                        <label id="allAwardPicLb" runat="server">
                        </label>
                        %
                    </td>
                </tr>
            </table>
            <br />
            <table width="80%" border="0" cellpadding="0" cellspacing="0" class="table3" style="line-height: 25px;">
                <tr>
                    <td align="right" class="td3" style="width: 20%">
                        强制钱包：
                    </td>
                    <td align="left" class="td3" style="width: 30%">
                        <label id="kouOneLb" runat="server">
                        </label>
                        美元
                    </td>
                    <td align="right" class="td3" style="width: 20%">
                        比例：
                    </td>
                    <td align="left" class="td3" style="width: 30%">
                        <label id="kouOnePicLb" runat="server">
                        </label>
                        %
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td3">
                        现金账户：
                    </td>
                    <td align="left" class="td3">
                        <label id="realAwardLb" runat="server">
                        </label>
                        美元
                    </td>
                    <td align="right" class="td3">
                        净拨出比例：
                    </td>
                    <td align="left" class="td3">
                        <label id="realAwardPicLb" runat="server">
                        </label>
                        %
                    </td>
                </tr>
            </table>
            <div id="Div1" runat="server" style="text-align: left; margin-top: 10px; margin-left: 50px;
                font-size: 15px; line-height: 20px; padding-left: 50px;">
            </div>
        </div>
    </div>
    <div id="bottom">
        <uc1:admin_Bottom ID="admin_Bottom1" runat="server" />
    </div>
    </form>
</body>
</html>
