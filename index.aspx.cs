using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using yuenanGupiao.Bll;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void loginilbt_Click(object sender, ImageClickEventArgs e)
    {
        string username = this.untx.Text.Trim();
        string password = this.pstx.Text.Trim();
        string str3 = this.yztx.Text.Trim();
        this.untx.Text = "";
        this.pstx.Text = "";
        this.yztx.Text = "";
        if (str3 == "")
        {
            this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('验证码不能为空');", true);
        }
        else if (username == "")
        {
            this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('账号不能为空');", true);
        }
        else if (password == "")
        {
            this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('密码不能为空');", true);
        }
        else if ((this.Session["CheckCode"] == null) || (str3 != this.Session["CheckCode"].ToString()))
        {
            this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('您输入的验证码有误，请重新输入');", true);
        }
        else
        {
            password = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "MD5");
            // Shark modify --> [Login]
            switch (new UserDataManager().Login(username, password))
            //int type = 0;
            //switch(type)
            // Shark end <--
            {
                case 0:
                    this.Session["userName"] = username;
                    // Shark mark --> []
                    new UserDataManager().UpdateLoginLog(username, base.Request.UserHostAddress);
                    // Shark end <--
                    base.Response.Write("<script type='text/javascript'>window.location.href='u_Huanying.aspx';</script>");
                    return;

                case 1:
                    this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('您输入的账号不存在或没有审核，请重新输入');", true);
                    return;

                case 2:
                    this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('您输入的密码有误，请重新输入');", true);
                    return;
            }
        }

    }
}