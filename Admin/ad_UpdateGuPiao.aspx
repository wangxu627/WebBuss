<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ad_UpdateGuPiao.aspx.cs"
    Inherits="Admin_ad_UpdateGuPiao" %>

<%@ Register Src="admin_Bottom.ascx" TagName="admin_Bottom" TagPrefix="uc1" %>
<%@ Register Src="admin_Top.ascx" TagName="admin_Top" TagPrefix="uc2" %>
<%@ Register Src="admin_Left.ascx" TagName="admin_Left" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>销售增值积分调整</title>
    <link rel="Stylesheet" type="text/css" href="Css/Main.css" />
    <script src="../js/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function ShowSunbit() {
            var name = document.getElementById("TextBox1").value;
            var money = document.getElementById("TextBox2").value;

            if (name == "" || money == "") {
                alert = "输入不能为空";
                return;
            }

            if (confirm("您确定要修改会员  " + name + "  的流通股  " + money + "  么？")) {
                return true;
            }
            else {
                return false;
            }
        }

        var state = 0;

        function GetDiquList(oneControl, valueId) {
            if (state == 0) {
                var value = jQuery(oneControl).val();

                if (value == "") {
                    alert("请输入会员编号");
                    return;
                }

                jQuery.ajax({
                    url: "ad_UpdateGuPiao.aspx/BackName",
                    type: "POST",
                    dataType: "json",
                    data: "{userName:'" + value + "'}",
                    contentType: "application/json",
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        state = 0;
                        if (textStatus == "timeout") {
                            alert('請求超時，請檢查網絡');
                        }
                        else {
                            alert(textStatus == null ? errorThrown : textStatus);
                        }
                    },
                    success: function (msg) {
                        jQuery(valueId).html(msg.d);
                    }
                })
            }
            else {
                alert("当前请求正在执行，请稍后");
            }
        }
    </script>
</head>
<body>
    <center>
        <form id="form1" runat="server" onsubmit="return ShowSunbit()">
        <div id="top">
            <uc2:admin_Top ID="admin_Top1" runat="server" />
        </div>
        <div id="main">
            <div id="left">
                <uc3:admin_Left ID="admin_Left1" runat="server" />
            </div>
            <div id="right">
                <div class="k">
                    销售增值积分调整</div>
                <table width="80%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="82%">
                            <table width="400" cellpadding="2" cellspacing="2" id="tbZz" style="border: solid 1px #CCCCCC"
                                runat="server">
                                <tr>
                                    <td colspan="2" align="right">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        会员账号
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="TextBox1" runat="server" Width="180px" onBlur="GetDiquList('#TextBox1','#lastMoneyTx')"></asp:TextBox>
                                        *
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        &nbsp;
                                    </td>
                                    <td align="left">
                                        <asp:Label ID="lastMoneyTx" runat="server" Text="" Font-Bold="true" ForeColor="Red"
                                            Font-Size="18px"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        修改数字
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="TextBox2" runat="server" Width="180px"></asp:TextBox>
                                        *
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td align="left">
                                        <asp:RangeValidator ID="RangeValidator1" runat="server" BorderStyle="Solid" BorderWidth="1px"
                                            ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="请输入-999999999至999999999之间的非0整数"
                                            MaximumValue="999999999" MinimumValue="-999999999" Type="Integer"></asp:RangeValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td align="left">
                                        <asp:Button ID="Button1" runat="server" Text="修改" OnClick="Button1_Click" Style="height: 26px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        &nbsp;
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
    </center>
</body>
</html>
