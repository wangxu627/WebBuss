using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yuenanGupiao.Bll;

public partial class Admin_ad_AddChaiFen : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Session["adminName"] == null)
        {
            base.Response.Write("<script type='text/javascript'>alert('您没有登陆或者登陆已超时');window.location.href='index.aspx';</script>");
        }
        else if (new StockLogManager().GetNoPayCount() > 0)
        {
            this.chaiFen.Enabled = false;
            this.pingCnag.Enabled = true;
        }
        else
        {
            this.chaiFen.Enabled = true;
            this.pingCnag.Enabled = false;
        }
    }

    protected void pingCnag_Click(object sender, EventArgs e)
    {
        new StockPayLogManager().ClearStockLog();
        this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('平仓操作完成');window.location.href='" + base.Request.RawUrl + "'", true);
    }

    protected void chaiFen_Click(object sender, EventArgs e)
    {
        decimal fenPic = Convert.ToDecimal(this.chaifenPicTx.Text.Trim());
        decimal newSingMoney = Convert.ToDecimal(this.allMoneyTx.Text.Trim());
        if (newSingMoney == 0M)
        {
            this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('新股价不能为0');", true);
        }
        else
        {
            switch (new ChaiFenLogManager().AddModel(fenPic, newSingMoney, "拆分股票"))
            {
                case 1:
                    this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('拆分成功');window.location.href='ad_ChaiFenLog.aspx'", true);
                    return;

                case 2:
                    this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('请平仓扣再进行拆分');window.location.href='" + base.Request.RawUrl + "'", true);
                    return;
            }
            this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('数据库访问失败');", true);
        }
    }

 


}