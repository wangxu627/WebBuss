<%@ Control Language="C#" AutoEventWireup="true" CodeFile="user_Top.ascx.cs" Inherits="user_Top" %>
<style type="text/css">
    *
    {
        margin: 0;
        padding: 0;
    }
    ul
    {
        list-style-type: none;
    }
    li
    {
        float: left;
        line-height: 30px;
        width: 9em;
    }
    #nav
    {
        width: 900px;
        padding: 0 10px;
        color: #FFFFFF;
        text-align: center;
    }
    #nav, #nav ul
    {
        /* all lists */
        padding: 0;
        margin: 0;
        list-style: none;
        line-height: 1;
    }
    #nav a
    {
        display: block;
        text-align: center;
        color: #FFFFFF;
    }
    #nav a:hover
    {
        color: #ffffff;
        background-image: url(images/dhbg.gif);
    }
    #nav li a:hover
    {
        color: #E6B57C;
    }
    #nav li ul
    {
        text-align: left;
        left: -999em;
        position: absolute;
        width: 144px;
        filter: alpha(opacity=100);
        margin: 0px;
        padding: 0px;
    }
    #nav li ul li
    {
        background: #7D2011;
        color: #FFFFFF;
    }
    #nav li ul a
    {
        display: block;
        color: #000000;
    }
    #nav li ul a:hover
    {
        color: #ffffff;
        background: #6E4B44;
    }
    #nav a:link, #nav a:visited
    {
        color: #FFFFFF;
    }
    #nav li ul a:link, #nav li ul a:visited
    {
        color: #ffffff;
    }
    #nav li:hover ul, #nav li.sfhover ul
    {
        left: auto;
    }
    * + html #nav li ul
    {
        margin: 0px 0 0 -54px;
    }
    /* 二级菜单显示位置调整IE7 */*html #nav li ul
    {
        margin: 0px 0 0 -54px;
    }
    /* 二级菜单显示位置调整 IE6 */#nav li a:hover, #nav li a:active
    {
        text-decoration: none;
    }
    #nav li:hover ul, #nav li.sfhover ul
    {
        /* lists nested under hovered list items */
        left: auto; /* 如果上面用left的了,那么这就不用改,最多改个数,如果用display:none了,那么这里改成display:block*/
    }
    .bj
    {
        background-repeat: repeat-x;
    }
</style>
<script type="text/javascript">
    function menuFix() {
        var sfEls = document.getElementById("nav").getElementsByTagName("li");
        for (var i = 0; i < sfEls.length; i++) {
            sfEls[i].onmouseover = function () {
                this.className += (this.className.length > 0 ? " " : "") + "sfhover";
            }
            sfEls[i].onMouseDown = function () {
                this.className += (this.className.length > 0 ? " " : "") + "sfhover";
            }
            sfEls[i].onMouseUp = function () {
                this.className += (this.className.length > 0 ? " " : "") + "sfhover";
            }
            sfEls[i].onmouseout = function () {
                this.className = this.className.replace(new RegExp("( ?|^)sfhover\\b"),
"");
            }
        }
    }
    window.onload = menuFix;
</script>
<script language="JavaScript">
    function correctPNG() // correctly handle PNG transparency in Win IE 5.5 & 6.
    {
        var arVersion = navigator.appVersion.split("MSIE")
        var version = parseFloat(arVersion[1])
        if ((version >= 5.5) && (document.body.filters)) {
            for (var j = 0; j < document.images.length; j++) {
                var img = document.images[j]
                var imgName = img.src.toUpperCase()
                if (imgName.substring(imgName.length - 3, imgName.length) == "PNG") {
                    var imgID = (img.id) ? "id='" + img.id + "' " : ""
                    var imgClass = (img.className) ? "class='" + img.className + "' " : ""
                    var imgTitle = (img.title) ? "title='" + img.title + "' " : "title='" + img.alt + "' "
                    var imgStyle = "display:inline-block;" + img.style.cssText
                    if (img.align == "left") imgStyle = "float:left;" + imgStyle
                    if (img.align == "right") imgStyle = "float:right;" + imgStyle
                    if (img.parentElement.href) imgStyle = "cursor:hand;" + imgStyle
                    var strNewHTML = "<span " + imgID + imgClass + imgTitle
             + " style=\"" + "width:" + img.width + "px; height:" + img.height + "px;" + imgStyle + ";"
             + "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader"
             + "(src=\'" + img.src + "\', sizingMethod='scale');\"></span>"
                    img.outerHTML = strNewHTML
                    j = j - 1
                }
            }
        }
    }
    window.attachEvent("onload", correctPNG);
</script>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0px auto 0px auto">
    <tr>
        <td align="center" valign="top" background="images/e441.jpg" bgcolor="#990000">
            <img src="images/dse1.jpg" width="1000" height="78" />
        </td>
    </tr>
    <tr>
        <td align="center" valign="bottom" background="images/fdr2.jpg">
            <table width="1000" height="26" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="96%" height="35" align="left" background="images/fdr2.jpg">
                        <div id="nav">
                            <ul>
                                <li><a href="u_Huanying.aspx">首页</a></li>
                                <li><a href="#">私人账户</a>
                                    <ul>
                                        <li><a href="u_StockPayMark.aspx">股票交易</a></li>
                                        <li><a href="u_StockFlash.aspx">交易走势图</a></li>
                                        <li><a href="u_StockLog.aspx">交易记录</a></li>
                                        <li><a href="u_Zhuanzhang.aspx">现金钱包转账</a></li>
                                        <li><a href="u_ZhuanzhangList.aspx">现金钱包转账记录</a></li>
                                        <li><a href="u_ZhuanzhangTwo.aspx">注册钱包转账</a></li>
                                        <li><a href="u_ZhuanzhangListTwo.aspx">注册钱包转账记录</a></li>
                                        <li><a href="u_Tixian.aspx">申请提现</a></li>
                                        <li><a href="u_TixianList.aspx">提现记录</a></li>
                                        <li><a href="u_ChongzhiList.aspx">充值记录</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">奖金查看</a>
                                    <ul>
                                        <li><a href="u_ClearAwardList.aspx">奖金查看</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">会员中心</a>
                                    <ul>
                                        <li><a href="u_AddUsers.aspx">注册会员</a></li>
                                        <li><a href="u_dailiMark.aspx">会员管理</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">系统管理</a>
                                    <ul>
                                        <li><a href="u_ReferrTu.aspx">推荐图</a></li>
                                        <li><a href="u_ManaTu.aspx">管理图</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">个人设置</a>
                                    <ul>
                                        <li><a href="u_ResetPwd.aspx">修改密码</a></li>
                                        <li><a href="u_UpdateUserData.aspx">个人信息</a></li>
                                        <li><a href="u_AddGroup.aspx">自助升级</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">商务助手</a>
                                    <ul>
                                        <li><a href="u_GongGao.aspx">查看公告</a></li>
                                        <li><a href="u_MsgList.aspx">查看邮件</a></li>
                                        <li><a href="u_WriteMsg.aspx">发送邮件</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <asp:LinkButton runat="server" ID="toOutLg" Text="安全退出" CausesValidation="False"
                                        OnClick="toOutLg_Click"></asp:LinkButton>
                                </li>
                            </ul>
                        </div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td align="center">
            <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0"
                width="1000" height="222">
                <param name="movie" value="images/project-banrner (9).swf" />
                <param name="quality" value="high" />
                <param name="wmode" value="transparent" />
                <embed src="images/project-banrner (9).swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer"
                    type="application/x-shockwave-flash" width="1000" height="222"></embed>
            </object>
        </td>
    </tr>
    <tr>
        <td height="10">
        </td>
    </tr>
</table>
