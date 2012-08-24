using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yuenanGupiao.Model;
using yuenanGupiao.Bll;

public partial class u_Tixian : System.Web.UI.Page
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
            base.Response.Write("<script type='text/javascript'>window.location.href='index.aspx';</script>");
        }
        else if (this.Session["twoLogin"] == null)
        {
            this.Session["PostBack"] = "u_Tixian.aspx";
            base.Response.Write("<script type='text/javascript'>window.location.replace('TwoLogin.aspx');</script>");
        }
        else if (!base.IsPostBack)
        {
            this.userName = this.Session["userName"].ToString();
            this.GetData();
        }
    }

    private void GetData()
    {
        UserData model = new UserDataManager().GetModel(this.userName);
        if (model == null)
        {
            base.Response.Write("<script type='text/javascript'>window.location.href='index.aspx';</script>");
        }
        else
        {
            this.lastMoneyLb.Text = model.lastMoney.ToString("F2");
            this.allTixianLb.Text = new TiXianManager().GetAllMoneyByName(this.userName, 1).allMonwy.ToString("F2");
            this.bankAddr.Text = model.bankAddr;
            this.batx.Text = model.bankName;
            this.butx.Text = model.bankNum;
            this.rltx.Text = model.realName;
        }
    }

    protected void ToSenqing_Click(object sender, EventArgs e)
    {
        decimal allMoney = Convert.ToDecimal(this.moneyTx.Text.Trim());
        if (allMoney < 100M)
        {
            this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('每次提现金额必须为100以上');", true);
        }
        else
        {
            this.moneyTx.Text = "";
            switch (new TiXianManager().AddModel(this.userName, allMoney, allMoney * 6M, ""))
            {
                case 1:
                    this.moneyTx.Text = "";
                    this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('提现申请成功');window.location.href='" + base.Request.RawUrl + "';", true);
                    return;

                case 2:
                    this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('操作失败，请退出后重试');window.location.href='" + base.Request.RawUrl + "';", true);
                    return;

                case 3:
                    this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('余额不足');window.location.href='" + base.Request.RawUrl + "';", true);
                    return;
            }
            this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('请刷新后重试');window.location.href='" + base.Request.RawUrl + "';", true);
        }
    }
}