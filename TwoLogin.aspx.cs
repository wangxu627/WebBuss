using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using yuenanGupiao.Bll;

public partial class TwoLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.TwoPwdtx.Focus();
        if (this.Session["userName"] == null)
        {
            base.Response.Write("<script type='text/javascript'>alert('您没有登录或者登陆已经超时');window.location.replace('index.aspx');</script>");
        }
    }

    protected void TwoLoginBt_Click(object sender, EventArgs e)
    {
        string str3;
        string username = this.Session["userName"].ToString();
        string pwd = FormsAuthentication.HashPasswordForStoringInConfigFile(this.TwoPwdtx.Text, "MD5");
        switch (new UserDataManager().TowLogin(username, pwd))
        {
            case 0:
                this.Session["twoLogin"] = true;
                str3 = "";
                if (this.Session["PostBack"] != null)
                {
                    str3 = this.Session["PostBack"].ToString();
                    break;
                }
                str3 = "u_GongGao.aspx";
                break;

            case 1:
                return;

            case 2:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('您输入的二级密码有误，请重新输入');", true);
                return;

            default:
                return;
        }
        base.Response.Write("<script type='text/javascript'>window.location.href='" + str3 + "';</script>");
    }

 

}