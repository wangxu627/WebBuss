<%@ Page Language="C#" AutoEventWireup="true" CodeFile="u_StockPayMark.aspx.cs" Inherits="u_StockPayMark" %>

<%@ Register Src="user_Left.ascx" TagName="user_Left" TagPrefix="uc1" %>
<%@ Register Src="user_Bottom.ascx" TagName="user_Bottom" TagPrefix="uc2" %>
<%@ Register Src="user_Top.ascx" TagName="user_Top" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>股票交易</title>
    <link rel="Stylesheet" type="text/css" href="Css/Main.css" />
    <script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>
    <style type="text/css">
        .style1
        {
            height: 25px;
        }
        .move
        {
            background-color: #CCDDFF;
        }
        .over
        {
            background-color: #f6f6f6;
        }
    </style>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            toReader()
        });

        function toOut() {
            if (confirm("确认要出售吗？")) {
                return true;
            }
            else {
                return false;
            }
        }

        function toIn() {
            if (confirm("确认要购买吗？")) {
                return true;
            }
            else {
                return false;
            }
        }

        function toReader() {
            //            jQuery("#Button3")[0].style.display = 'none';
            jQuery("#AllOutTableDiv").html("正在载入……");

            jQuery.ajax({
                url: "u_StockPayMark.aspx/GetHtml",
                type: "POST",
                dataType: "json",
                data: "{i:2}",
                contentType: "application/json",
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    if (textStatus == "timeout") {
                        alert('请求超时，请检查网络');
                    }
                    else {
                        alert(textStatus == null ? errorThrown : textStatus);
                    }
                },
                success: function (msg) {
                    jQuery("#AllOutTableDiv").html(msg.d);
                }
            })

            jQuery("#AllInTableDiv").html("正在载入……");

            jQuery.ajax({
                url: "u_StockPayMark.aspx/GetHtml",
                type: "POST",
                dataType: "json",
                data: "{i:1}",
                contentType: "application/json",
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    if (textStatus == "timeout") {
                        alert('请求超时，请检查网络');
                    }
                    else {
                        alert(textStatus == null ? errorThrown : textStatus);
                    }
                    //                    jQuery("#Button3")[0].style.display = '';
                },
                success: function (msg) {
                    jQuery("#AllInTableDiv").html(msg.d);
                    //                    jQuery("#Button3")[0].style.display = '';
                }
            })

            //            setTimeout(toReader, 30000);
        }

        function DelOk(val) {
            if (confirm("您确定要删除吗？")) {
                window.location.href = 'u_DeleteStock.aspx?id=' + val;
                return;
            }
        }

        function GetOutMoney(oneCont, twoCont, thrCont) {
            if (jQuery(oneCont).val() == "") {
                return;
            }
            reg = /^\d+$/;
            if (!reg.test(jQuery(oneCont).val())) {
                jQuery(oneCont).val("");
                alert("请输入数字");
                return;
            }

            var allMoney = jQuery(oneCont).val() * jQuery(twoCont).val();

            if (allMoney > 0) {
                jQuery(thrCont).html(allMoney);
            }
            else {
                jQuery(thrCont).html(allMoney);
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="top">
        <uc3:user_Top ID="user_Top1" runat="server" />
    </div>
    <div id="main">
        <div id="left">
            <uc1:user_Left ID="user_Left1" runat="server" />
        </div>
        <div id="right">
            <table width="1000" height="80" border="0" align="center" cellpadding="0" cellspacing="0"
                background="images/imagdsde3.jpg">
                <tr>
                    <td>
                        <div class="k1">
                            股票交易</div>
                    </td>
                </tr>
            </table>
            <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="padding-top: 20px">
                        <table cellpadding="0" cellspacing="0" border="0" style="width: 98%">
                            <tr>
                                <td style="width: 50%" align="left" valign="top">
                                    <div id="AllOutTableDiv">
                                    </div>
                                    <br />
                                    <div id="AllInTableDiv">
                                    </div>
                                    <br />
                                    <%--<input id="Button3" type="button" value="刷新" onclick="toReader()" />--%>
                                    <table cellpadding="1" cellspacing="2" border="0" style="background-color: #f6f6f6;
                                        width: 98%">
                                        <tr>
                                            <td style="width: 100%" align="center" colspan="2">
                                                您的投资组合
                                            </td>
                                        </tr>
                                        <tr style="background-color: #D2E9FF">
                                            <td style="width: 65%">
                                                销售增值积分份数
                                            </td>
                                            <td style="width: 35%" class="zi">
                                                <asp:Label ID="payNumLb" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 65%">
                                                封闭股票份数
                                            </td>
                                            <td style="width: 35%" class="zi">
                                                <asp:Label ID="noPayNumLb" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr style="background-color: #D2E9FF">
                                            <td style="width: 65%">
                                                总计
                                            </td>
                                            <td style="width: 35%" class="zi">
                                                <asp:Label ID="allNumLb" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 65%">
                                                股票价值
                                            </td>
                                            <td style="width: 35%" class="zi">
                                                <asp:Label ID="allStockMoneyLb" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 65%">
                                                强制钱包
                                            </td>
                                            <td style="width: 35%" class="zi">
                                                <asp:Label ID="ficitLb" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr style="background-color: #D2E9FF">
                                            <td style="width: 65%">
                                                内部股
                                            </td>
                                            <td style="width: 35%" class="zi">
                                                <asp:Label ID="overGpLb" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td valign="top">
                                    <table cellpadding="0" cellspacing="0" border="0" style="width: 98%; float: right;
                                        background-image: url('images/shares1.jpg')" id="inTable" runat="server">
                                        <tr>
                                            <td colspan="2">
                                                购买股票
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 40%;" align="right">
                                                股票数量：
                                            </td>
                                            <td style="width: 60%" align="left" class="zi">
                                                <asp:TextBox ID="inNumTx" runat="server" onBlur="GetOutMoney('#inNumTx','#InMoneyList','#InAllMoneyLb')"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="inNumTx"
                                                    Display="Dynamic" ErrorMessage="不能为空" ValidationGroup="s1"></asp:RequiredFieldValidator>
                                                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="inNumTx"
                                                    Display="Dynamic" ErrorMessage="必须为1-99999999的数字" MaximumValue="99999999" MinimumValue="1"
                                                    ValidationGroup="s1"></asp:RangeValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                每单位价格：
                                            </td>
                                            <td align="left">
                                                <asp:DropDownList ID="InMoneyList" runat="server" onchange="GetOutMoney('#inNumTx','#InMoneyList','#InAllMoneyLb')">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                总价格：
                                            </td>
                                            <td align="left">
                                                <asp:Label ID="InAllMoneyLb" runat="server" Text="0"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td align="left" style="height: 30px;">
                                                <asp:Button ID="Button1" runat="server" Text="确认购买" OnClick="Button1_Click" ValidationGroup="s1" />
                                            </td>
                                        </tr>
                                    </table>
                                    <table style="height: 8px; width: 98%;" id="heiTable" runat="server">
                                        <tr>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                    <table cellpadding="0" cellspacing="0" border="0" style="width: 98%; float: right;
                                        background-image: url('images/shares4.jpg'); margin-top: 0px;" id="outTable"
                                        runat="server">
                                        <tr>
                                            <td colspan="2">
                                                出售股票
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 40%" align="right">
                                                股票数量：
                                            </td>
                                            <td style="width: 60%" align="left">
                                                <asp:TextBox ID="outNumTx" runat="server" onBlur="GetOutMoney('#outNumTx','#OutMoneyList','#OutAllMoneyLb')"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="outNumTx"
                                                    Display="Dynamic" ErrorMessage="不能为空" ValidationGroup="s2"></asp:RequiredFieldValidator>
                                                <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="outNumTx"
                                                    Display="Dynamic" ErrorMessage="必须为1-999999999的数字" MaximumValue="999999999" MinimumValue="1"
                                                    ValidationGroup="s2"></asp:RangeValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                每单位价格：
                                            </td>
                                            <td align="left">
                                                <asp:DropDownList ID="OutMoneyList" runat="server" onchange="GetOutMoney('#outNumTx','#OutMoneyList','#OutAllMoneyLb')">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                总价格：
                                            </td>
                                            <td align="left">
                                                <asp:Label ID="OutAllMoneyLb" runat="server" Text="0"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style1">
                                            </td>
                                            <td class="style1" align="left" style="height: 30px;">
                                                <asp:Button ID="Button2" runat="server" Text="确认出售" OnClick="Button2_Click" ValidationGroup="s2" />
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <br />
                                    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%; float: right;">
                                        <tr>
                                            <td style="height: 5px;">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table cellpadding="0" cellspacing="0" border="0" style="border: 1px #cccccc solid;
                                                    width: 98%; float: right;">
                                                    <tr>
                                                        <td>
                                                            <table cellpadding="0" cellspacing="0" border="0" style="width: 100%; float: right;">
                                                                <tr>
                                                                    <td style="background-image: url('images/hg.jpg'); height: 26px; font-weight: bold;">
                                                                        您的出售订单
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div id="outListDiv" runat="server">
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <br />
                                    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%; float: right;">
                                        <tr>
                                            <td style="height: 5px;">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table cellpadding="0" cellspacing="0" border="0" style="border: 1px #cccccc solid;
                                                    width: 98%; float: right;">
                                                    <tr>
                                                        <td>
                                                            <table cellpadding="0" cellspacing="0" border="0" style="width: 100%; float: right;">
                                                                <tr>
                                                                    <td style="background-image: url('images/hg.jpg'); height: 26px; font-weight: bold;">
                                                                        您的购买订单
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div id="inListDiv" runat="server">
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <p>
                            &nbsp;</p>
                        <p>
                            &nbsp;</p>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div id="bottom">
        <uc2:user_Bottom ID="user_Bottom1" runat="server" />
    </div>
    </form>
</body>
</html>
