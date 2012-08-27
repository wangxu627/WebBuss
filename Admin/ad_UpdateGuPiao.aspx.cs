using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using yuenanGupiao.Model;
using yuenanGupiao.Bll;

public partial class Admin_ad_UpdateGuPiao : System.Web.UI.Page
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
        int guPiao = Convert.ToInt32(this.TextBox2.Text.Trim());
        if (guPiao == 0)
        {
            this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('数字不能为0');", true);
        }
        else if (new UserDataManager().UpdateGuPiao(userName, guPiao) == 1)
        {
            this.TextBox2.Text = "";
            this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('修改成功。');window.location.href='" + base.Request.RawUrl + "';", true);
        }
        else
        {
            this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('操作失败');window.location.href='" + base.Request.RawUrl + "';", true);
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
            return ("姓名:" + model.realName + ";销售增值积分:" + model.guPiao.ToString());
        }
        return "您输入的账号不可用。";
    }
}