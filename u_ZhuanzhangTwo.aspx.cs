using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yuenanGupiao.Bll;
using yuenanGupiao.Model;

public partial class u_ZhuanzhangTwo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Session["userName"] == null)
        {
            base.Response.Write("<script type='text/javascript'>window.location.href='index.aspx';</script>");
        }
        else if (this.Session["twoLogin"] == null)
        {
            this.Session["PostBack"] = base.Request.RawUrl;
            base.Response.Write("<script type='text/javascript'>window.location.replace('TwoLogin.aspx');</script>");
        }
        else if (!base.IsPostBack)
        {
            this.GetData();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string fromName = this.Session["userName"].ToString();
        string toName = this.TextBox1.Text.Trim();
        if (fromName == toName)
        {
            this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('不能给自己转账');", true);
        }
        else
        {
            decimal allMoney = Convert.ToDecimal(this.TextBox2.Text.Trim());
            if (allMoney <= 0M)
            {
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('转账金额必须大于0');", true);
            }
            else
            {
                switch (new ZhuanZhangManager().AddModel(fromName, toName, allMoney, this.TextBox3.Text.Trim(), 2))
                {
                    case 1:
                        this.TextBox2.Text = "";
                        this.GetData();
                        this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('转账成功。');window.location.href='" + base.Request.RawUrl + "';", true);
                        break;

                    case 2:
                        this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('你输入的账号不存在');window.location.href='" + base.Request.RawUrl + "';", true);
                        break;

                    case 3:
                        this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('转出账号不可用');window.location.href='" + base.Request.RawUrl + "';", true);
                        break;

                    case 4:
                        this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('余额不足');window.location.href='" + base.Request.RawUrl + "';", true);
                        break;
                }
                this.GetData();
            }
        }
    }

    private void GetData()
    {
        string userName = this.Session["userName"].ToString();
        UserData model = new UserDataManager().GetModel(userName);
        this.lmlb.Text = model.zhuceMoney.ToString("F2");
        this.outlb.Text = new ZhuanZhangManager().GetFromMoneyByName(userName, 2).allMoney.ToString("F2");
        this.inlb.Text = new ZhuanZhangManager().GetToMoneyByName(userName, 2).allMoney.ToString("F2");
    }
}