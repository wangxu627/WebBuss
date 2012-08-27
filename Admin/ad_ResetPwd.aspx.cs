using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using yuenanGupiao.Bll;

public partial class Admin_ad_ResetPwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Session["adminName"] == null)
        {
            base.Response.Write("<script type='text/javascript'>window.location.href='index.aspx';</script>");
        }
    }

    protected void ToSave_Click(object sender, EventArgs e)
    {
        string adminName = this.Session["adminName"].ToString();
        string password = this.optx.Text.Trim();
        string text = this.nptx1.Text;
        password = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "MD5");
        text = FormsAuthentication.HashPasswordForStoringInConfigFile(text, "MD5");
        switch (new AdminDataManager().UpdatePwd(adminName, password, text))
        {
            case 0:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('修改成功');", true);
                return;

            case 1:
                break;

            case 2:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('原密码错误，请重新输入');", true);
                break;

            default:
                return;
        }
    }
}