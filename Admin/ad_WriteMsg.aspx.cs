using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yuenanGupiao.Bll;

public partial class Admin_ad_WriteMsg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Session["adminName"] == null)
        {
            base.Response.Write("<script type='text/javascript'>window.location.href='index.aspx';</script>");
        }
        else
        {
            this.tltx.Focus();
        }
    }

    protected void AddMsgIbt_Click(object sender, ImageClickEventArgs e)
    {
        string title = this.tltx.Text.Trim();
        string data = this.WQeditor1.Text.Trim();
        string userName = this.untx.Text.Trim();
        if ((data.Length > 0x1770) || (data.Length <= 0))
        {
            this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('信息正文不能为空或超过1000个汉字');", true);
        }
        else if (new UserDataManager().GetModel(userName) == null)
        {
            this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('收信人账号不存在');", true);
        }
        else
        {
            this.tltx.Text = "";
            this.WQeditor1.Text = "";
            this.untx.Text = "";
            if (new MessageManager().AddModel(title, data, "admin", userName) == 0)
            {
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('发送成功');", true);
            }
            else
            {
                base.Response.Write("<script type='text/javascript'>alert('发送失败,请重试');window.location.reload();</script>");
            }
        }
    }
}