<%@ Control Language="C#" AutoEventWireup="true" CodeFile="admin_Left.ascx.cs" Inherits="Admin_admin_Left" %>

<script src="../js/jquery-1.3.2.min.js" type="text/javascript"></script>

<script type="text/javascript" src="js/chili-1.7.pack.js"></script>

<script type="text/javascript" src="js/jquery.easing.js"></script>

<script type="text/javascript" src="js/jquery.dimensions.js"></script>

<script type="text/javascript" src="js/jquery.accordion.js"></script>

<script language="javascript">
    jQuery().ready(function () {
        jQuery('#navigation').accordion({
            header: '.head',
            navigation1: false,
            event: 'click',
            fillSpace: false,
            animated: 'bounceslide'
        });
    });
</script>

<style type="text/css">
    <!
    -- body
    {
        margin: 0px;
        padding: 0px;
        font-size: 12px;
    }
    #navigation
    {
        margin: 0px;
        padding: 0px;
        width: 100%;
    }
    #navigation a.head
    {
        cursor: pointer;
        background: url(images/left1.jpg);
        display: block;
        font-weight: bold;
        color: #FFFFFF;
        margin: 0px;
        line-height: 34px;
        text-align: center;
        font-size: 14px;
        text-decoration: none;
    }
    #navigation a.bott
    {
        cursor: pointer;
        background-color: #FFFFFF;
        display: block;
        margin: 0px;
        height: 3px;
    }
    #navigation ul
    {
        border-width: 0px;
        margin: 0px;
        padding-top: 15px;
        text-align: center;
        background-color: #FFFFFF;
    }
    #navigation li
    {
        list-style: none;
        display: inline;
    }
    #navigation li li a
    {
        display: block;
        font-size: 12px;
        text-decoration: none;
        text-align: center;
        padding: 3px;
    }
    #navigation li li a:hover
    {
        text-align: center;
    }
    ul
    {
        border: solid 1px #455062;
    }
    .trrrrrr
    {
        font-size: 13px;
        font-weight: bold;
        color: #0099ff;
    }
    -- ></style>
<div>
    <ul id="navigation">
        <li><a class="head">欢迎您</a>
            <ul>
                <li>
                    <div style="text-align: left; padding-left: 20px; padding-top: 10px">
                        <span class="trrrrrr">

                            <script language="JavaScript" type="text/javascript">
                                today = new Date();
                                function initArray() {
                                    this.length = initArray.arguments.length
                                    for (var i = 0; i < this.length; i++)
                                        this[i + 1] = initArray.arguments[i]
                                }
                                var d = new initArray("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
                                document.write(today.getYear(), "年", today.getMonth() + 1, "月", today.getDate(), "日 ", d[today.getDay() + 1]); 
                            </script>

                        </span>
                    </div>
                </li>
            </ul>
        </li>
        <div>
            <a class="bott"></a>
        </div>
        <li><a class="head">信息管理</a>
            <ul>
                <li><a href="SysSet.aspx">系统设置</a></li>
                <li><a href="ad_GroupSys.aspx">等级设置</a></li>
                <li><a href="ad_GongGao.aspx">查看公告</a></li>
                <li><a href="ad_WriteGg.aspx">添加公告</a></li>
                <li><a href="ad_MsgList.aspx">查看邮件</a></li>
                <li><a href="ad_WriteMsg.aspx">发送邮件</a></li>
                <li><a href="ad_ResetPwd.aspx">管理密码</a></li>
            </ul>
        </li>
        <div>
            <a class="bott"></a>
        </div>
        <li><a class="head">会员管理</a>
            <ul>
                <li><a href="ad_AddUser.aspx">注册会员</a></li>
                <li><a href="ad_UserAllMark.aspx">会员列表</a></li>
                <li><a href="ad_AddLogList.aspx">晋级记录</a></li>
                <li><a href="ad_LoginLog.aspx">在线人员统计</a></li>
                <%--<li><a href="ad_AddAdmin.aspx">添加管理员</a></li>
				<li><a href="ad_AdminList.aspx">管理员列表</a></li>--%>
                <li><a href="ad_AddGroup.aspx">会员晋级</a></li>
                <li><a href="ad_AddFenHong.aspx">会员分红</a></li>
                <li><a href="ad_FenHongLog.aspx">分红日志</a></li>
                <li><a href="ad_AddChaiFen.aspx">拆分股票</a></li>
                <li><a href="ad_ChaiFenLog.aspx">拆分日志</a></li>
            </ul>
        </li>
        <div>
            <a class="bott"></a>
        </div>
        <li><a class="head">财务管理</a>
            <ul>
                <li><a href="ad_UpdateGuPiao.aspx">销售增值积分调整</a></li>
                <li><a href="ad_ChongZhiTwo.aspx">注册钱包充值</a></li>
                <%--<li><a href="ad_ChongZhiThr.aspx">交易账户充值</a></li>--%>
                <li><a href="ad_GuPiaoCheck.aspx">股票记录</a></li>
                <li><a href="ad_TiXianMark.aspx">提现管理</a></li>
                <li><a href="ad_ChongzhiList.aspx">充值记录</a></li>
                <li><a href="ad_ZhuanzhangList.aspx">现金钱包转账记录</a></li>
                <li><a href="ad_ZhuanzhangListTwo.aspx">注册钱包转账记录</a></li>
            </ul>
        </li>
        <div>
            <a class="bott"></a>
        </div>
        <li><a class="head">公司账目</a>
            <ul>
                <li><a href="ad_ClearAwardList.aspx">奖金查看</a></li>
                <li><a href="ad_Bochu.aspx">拨出比例</a></li>
            </ul>
        </li>
        <div>
            <a class="bott"></a>
        </div>
        <div>
            <a class="bott"></a>
        </div>
        <li><a class="head">网络关系图</a>
            <ul>
                <li><a href="ad_ReferrTu.aspx">推荐图</a></li>
                <li><a href="ad_ManaTu.aspx">管理图</a></li>
            </ul>
        </li>
        <div>
            <a class="bott"></a>
        </div>
        <li><a class="head">安全退出</a>
            <ul>
                <li>
                    <asp:LinkButton runat="server" ID="outLg" CausesValidation="False" OnClick="outLg_Click">安全退出</asp:LinkButton></li>
            </ul>
        </li>
        <div>
            <a class="bott"></a>
        </div>
    </ul>
</div>
