using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yuenanGupiao.Bll;

public partial class Admin_ad_AddFenHong : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Session["adminName"] == null)
        {
            base.Response.Write("<script type='text/javascript'>alert('您没有登陆或者登陆已超时');window.location.href='index.aspx';</script>");
        }
        else
        {
            bool isPostBack = base.IsPostBack;
        }
    }

    protected void addUserBtn_Click(object sender, EventArgs e)
    {
        decimal allMoney = Convert.ToDecimal(this.allMoneyTx.Text.Trim());
        switch (new FenHongLogManager().AddModel(allMoney))
        {
            case 1:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('分红成功');window.location.href='ad_FenHongLog.aspx'", true);
                return;

            case 2:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('可分红人数为0');", true);
                return;
        }
        this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('数据库访问失败');", true);
    }
}