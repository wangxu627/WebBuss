using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yuenanGupiao.Bll;

public partial class u_WriteMsg : System.Web.UI.Page
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
            this.Session["PostBack"] = "u_WriteMsg.aspx";
            base.Response.Write("<script type='text/javascript'>window.location.replace('TwoLogin.aspx');</script>");
        }
        else
        {
            if (!base.IsPostBack)
            {
                this.userName = this.Session["userName"].ToString();
            }
            this.tltx.Focus();
        }

    }

    protected void AddMsgIbt_Click(object sender, ImageClickEventArgs e)
    {
        string title = this.tltx.Text.Trim();
        string text = this.TextBox1.Text;
        if ((text.Length > 0x1770) || (text.Length <= 0))
        {
            this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('信息正文不能为空或超过1000个汉字');", true);
        }
        else
        {
            this.tltx.Text = "";
            this.TextBox1.Text = "";
            switch (new MessageManager().AddModel(title, text, this.userName, "admin"))
            {
                case 0:
                    this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('发送成功');", true);
                    return;

                case 1:
                    base.Response.Write("<script type='text/javascript'>alert('页面已过期，请重新进入');window.location.href='u_WriteMsg.aspx';</script>");
                    return;
            }
        }
    }

 

 


 

 

}