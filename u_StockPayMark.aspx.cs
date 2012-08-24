using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yuenanGupiao.Bll;
using yuenanGupiao.Model;
using System.Web.Services;
using System.Text;

public partial class u_StockPayMark : System.Web.UI.Page
{
    private string userName
    {
        get
        {
            if (this.ViewState["userName"] != null)
            {
                return this.ViewState["userName"].ToString();
            }
            return "";
        }
        set
        {
            this.ViewState["userName"] = value;
        }
    }
 


    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Session["userName"] == null)
        {
            base.Response.Write("<script type='text/javascript'>alert('你还没有登陆或登录已过期，请重新登录');window.location.href='index.aspx';</script>");
        }
        else if (this.Session["twoLogin"] == null)
        {
            this.Session["PostBack"] = base.Request.RawUrl;
            base.Response.Write("<script type='text/javascript'>alert('请输入二级密码');window.location.replace('TwoLogin.aspx');</script>");
        }
        else if (!base.IsPostBack)
        {
            this.userName = this.Session["userName"].ToString();
            this.GetData();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int lastId;
        int num5;
        decimal singMoney = Convert.ToDecimal(this.InMoneyList.SelectedValue);
        int allCount = Convert.ToInt32(this.inNumTx.Text.Trim());
        switch (new StockLogManager().AddModel(this.userName, singMoney, allCount, false))
        {
            case 1:
                {
                    lastId = new StockLogManager().GetLastId();
                    List<StockLog> listByMoney = new StockLogManager().GetListByMoney(singMoney, true);
                    num5 = 0;
                    foreach (StockLog log in listByMoney)
                    {
                        int nowNum = allCount - num5;
                        if (nowNum > 0)
                        {
                            if (log.nowCount <= nowNum)
                            {
                                new StockLogManager().UpdateNowNum(log.id, log.nowCount);
                                new StockPayLogManager().AddModel(log.userName, this.userName, singMoney, log.nowCount, true, Helper.NowDay(), log.id, lastId);
                                num5 += log.nowCount;
                                continue;
                            }
                            new StockLogManager().UpdateNowNum(log.id, nowNum);
                            new StockPayLogManager().AddModel(log.userName, this.userName, singMoney, nowNum, true, Helper.NowDay(), log.id, lastId);
                            num5 += nowNum;
                        }
                        break;
                    }
                    break;
                }
            case 2:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('账号不存在或登录过期');window.location.replace('" + base.Request.RawUrl + "')", true);
                return;

            case 5:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('您的可用余额不足');window.location.replace('" + base.Request.RawUrl + "')", true);
                return;

            default:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('操作太频繁，请稍后再试');window.location.replace('" + base.Request.RawUrl + "')", true);
                return;
        }
        new StockLogManager().UpdateNowNum(lastId, num5);
        this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('购买订单挂出成功');window.location.replace('" + base.Request.RawUrl + "')", true);
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        int lastId;
        int num5;
        decimal singMoney = Convert.ToDecimal(this.OutMoneyList.SelectedValue);
        int allCount = Convert.ToInt32(this.outNumTx.Text.Trim());
        new UserDataManager().GetAllGuPiao(this.userName);
        new UserDataManager().GetModel(this.userName);
        new SysSetManager().GetModel();
        switch (new StockLogManager().AddModel(this.userName, singMoney, allCount, true))
        {
            case 1:
                {
                    lastId = new StockLogManager().GetLastId();
                    List<StockLog> listByMoney = new StockLogManager().GetListByMoney(singMoney, false);
                    num5 = 0;
                    foreach (StockLog log in listByMoney)
                    {
                        int nowNum = allCount - num5;
                        if (nowNum > 0)
                        {
                            if (log.nowCount <= nowNum)
                            {
                                new StockLogManager().UpdateNowNum(log.id, log.nowCount);
                                new StockPayLogManager().AddModel(this.userName, log.userName, singMoney, log.nowCount, true, Helper.NowDay(), lastId, log.id);
                                num5 += log.nowCount;
                                continue;
                            }
                            new StockLogManager().UpdateNowNum(log.id, nowNum);
                            new StockPayLogManager().AddModel(this.userName, log.userName, singMoney, nowNum, true, Helper.NowDay(), lastId, log.id);
                            num5 += nowNum;
                        }
                        break;
                    }
                    break;
                }
            case 2:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('账号不存在或登录过期');window.location.replace('" + base.Request.RawUrl + "')", true);
                return;

            case 3:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('您的可流通股数不足');window.location.replace('" + base.Request.RawUrl + "')", true);
                return;

            case 4:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('销售价不能低于公司当前价格');window.location.replace('" + base.Request.RawUrl + "')", true);
                return;

            case 6:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('每天只能出售一次');window.location.replace('" + base.Request.RawUrl + "')", true);
                return;

            default:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('操作太频繁，请稍后再试');window.location.replace('" + base.Request.RawUrl + "')", true);
                return;
        }
        new StockLogManager().UpdateNowNum(lastId, num5);
        this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('购买订单挂出成功');window.location.replace('" + base.Request.RawUrl + "')", true);
    }

    private void GetData()
    {
        UserData model = new UserDataManager().GetModel(this.userName);
        if ((model == null) || !model.isSenhe)
        {
            this.Session["userName"] = null;
            base.Response.Write("<script type='text/javascript'>window.location.href='index.aspx';</script>");
        }
        else
        {
            decimal guPiao = new SysSetManager().GetModel().guPiao;
            int noCountByName = new StockPayLogManager().GetNoCountByName(this.userName);
            this.noPayNumLb.Text = noCountByName.ToString();
            this.payNumLb.Text = model.guPiao.ToString();
            int num3 = model.guPiao + noCountByName;
            this.allNumLb.Text = num3.ToString();
            this.allStockMoneyLb.Text = (num3 * guPiao).ToString("F2");
            this.ficitLb.Text = model.cfMoney.ToString("F2");
            this.overGpLb.Text = model.noMoney.ToString();
            this.OutMoneyList.Items.Clear();
            this.InMoneyList.Items.Clear();
            this.OutMoneyList.Items.Add(new ListItem("最佳现货价格", guPiao.ToString("F2")));
            this.InMoneyList.Items.Add(new ListItem("最佳现货价格", guPiao.ToString("F2")));
            for (int i = 0; i < 40; i++)
            {
                string text = (guPiao + (i * 0.005M)).ToString("F2");
                this.OutMoneyList.Items.Add(new ListItem(text, text));
                this.InMoneyList.Items.Add(new ListItem(text, text));
            }
            this.GetOutList();
            this.GetInList();
        }
    }

    [WebMethod]
    public static string GetHtml(int i)
    {
        StringBuilder builder = new StringBuilder();
        builder.Append("<table cellpadding=\"2\" cellspacing=\"2\" border=\"0\" style=\"background-color:#f6f6f6; width: 98%\">");
        if (i == 2)
        {
            builder.Append("<tr style=\"background-image: url('images/hg.jpg');\"><td style=\"width: 60%\" align=\"center\">认股权证-出售订单</td><td style=\"width: 40%\" align=\"center\">出售价格</td></tr>");
        }
        else
        {
            builder.Append("<tr style=\"background-image: url('images/hg.jpg');\"><td style=\"width: 60%\" align=\"center\">认股权证-购买订单</td><td style=\"width: 40%\" align=\"center\">购买价格</td></tr>");
        }
        foreach (StockLog log in new StockLogManager().GetCount(i))
        {
            if (log.nowCount > 0)
            {
                builder.Append("<tr onmouseover=\"this.className='move'\" onmouseout=\"this.className='over'\" style=\"backgroud-color:#D2E9FF\" ><td style=\"width: 60%\" align=\"center\">" + log.nowCount.ToString() + "</td><td style=\"width: 40%\" align=\"center\">" + log.singMoney.ToString("F2") + "</td></tr>");
            }
        }
        builder.Append("</table>");
        return builder.ToString();
    }

    private void GetInList()
    {
        StringBuilder builder = new StringBuilder();
        List<StockLog> listByName = new StockLogManager().GetListByName(this.userName, 1);
        builder.Append("<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width: 98%; float: right;\"><tr><td style=\"width: 40%\">未成交之购买订单</td><td style=\"width: 40%\">购买价格</td><td>撤销</td></tr>");
        foreach (StockLog log in listByName)
        {
            if (log.nowCount > 0)
            {
                string str = (!log.IoNum && (log.allCount == log.nowCount)) ? ("<a href='#' onclick=\"DelOk('" + log.id + "')\">点击撤销</a>") : "无法撤销";
                builder.Append("<tr onmouseover=\"this.className='move'\" onmouseout=\"this.className='over'\" style=\"backgroud-color:#D2E9FF\" ><td style=\"width: 40%\">" + log.nowCount.ToString() + "</td><td style=\"width: 40%\">" + log.singMoney.ToString("F2") + "</td><td>" + str + "</td></tr>");
            }
        }
        builder.Append("</table>");
        this.inListDiv.InnerHtml = builder.ToString();
        builder = null;
    }

    private void GetOutList()
    {
        StringBuilder builder = new StringBuilder();
        List<StockLog> listByName = new StockLogManager().GetListByName(this.userName, 2);
        builder.Append("<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width: 98%; float: right;\"><tr><td style=\"width: 40%\">未成交之出售订单</td><td style=\"width: 40%\">出售价格</td><td>撤销</td></tr>");
        foreach (StockLog log in listByName)
        {
            if (log.nowCount > 0)
            {
                string str = (log.IoNum && (log.allCount == log.nowCount)) ? ("<a href='#' onclick=\"DelOk('" + log.id + "')\">点击撤销</a>") : "无法撤销";
                builder.Append("<tr onmouseover=\"this.className='move'\" onmouseout=\"this.className='over'\" style=\"backgroud-color:#D2E9FF\" ><td style=\"width: 40%\">" + log.nowCount.ToString() + "</td><td style=\"width: 40%\">" + log.singMoney.ToString("F2") + "</td><td>" + str + "</td></tr>");
            }
        }
        builder.Append("</table>");
        this.outListDiv.InnerHtml = builder.ToString();
        builder = null;
    }
}