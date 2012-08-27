using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using yuenanGupiao.Bll;
using yuenanGupiao.Model;

public partial class Admin_ad_ChongzhiTwo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Session["adminName"] == null)
        {
            base.Response.Write("<script type='text/javascript'>window.location.href='index.aspx';</script>");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string userName = this.TextBox1.Text.Trim();
        decimal allMoney = Convert.ToDecimal(this.TextBox2.Text.Trim());
        if (allMoney == 0M)
        {
            this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('金额不能为0');", true);
        }
        else
        {
            switch (new ChongZhiManager().AddMoney(userName, allMoney, allMoney * 7M, true, ""))
            {
                case 1:
                    this.TextBox2.Text = "";
                    this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('充值成功。');window.location.href='" + base.Request.RawUrl + "';", true);
                    return;

                case 2:
                    this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('你输入的账号不存在');window.location.href='" + base.Request.RawUrl + "';", true);
                    return;

                case 3:
                    this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('电子币余额不足');window.location.href='" + base.Request.RawUrl + "';", true);
                    return;
            }
        }
    }

    [WebMethod]
    public string BackName(string userName)
    {
        if (userName == "")
        {
            return "请输入会员账号进行查询。";
        }
        UserData model = new UserDataManager().GetModel(userName);
        if ((model != null) && model.isSenhe)
        {
            return ("姓名:" + model.realName + ";余额:" + model.zhuceMoney.ToString("F2"));
        }
        return "您输入的账号不可用。";
    }
}