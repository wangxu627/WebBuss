using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using yuenanGupiao.Bll;

public partial class u_ResetPwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Session["userName"] == null)
        {
            base.Response.Write("<script type='text/javascript'>window.location.href='index.aspx';</script>");
        }
        else if (this.Session["twoLogin"] == null)
        {
            this.Session["PostBack"] = "u_ResetPwd.aspx";
            base.Response.Write("<script type='text/javascript'>window.location.replace('TwoLogin.aspx');</script>");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string password = this.op1tx.Text.Trim();
        string str2 = this.pwdtx1.Text.Trim();
        password = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "MD5");
        str2 = FormsAuthentication.HashPasswordForStoringInConfigFile(str2, "MD5");
        switch (new UserDataManager().uppwd(this.Session["userName"].ToString(), password, str2))
        {
            case 0:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('密码修改成功');", true);
                return;

            case 1:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('原密码错误,请重新输入');", true);
                return;
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        string password = this.TextBox3.Text.Trim();
        string str2 = this.TextBox1.Text.Trim();
        password = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "MD5");
        str2 = FormsAuthentication.HashPasswordForStoringInConfigFile(str2, "MD5");
        switch (new UserDataManager().upPwd2(this.Session["userName"].ToString(), password, str2))
        {
            case 0:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('密码修改成功');", true);
                return;

            case 1:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('原三级密码错误,请重新输入');", true);
                return;
        }
    }

 

 

}