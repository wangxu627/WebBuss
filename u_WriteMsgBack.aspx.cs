using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yuenanGupiao.Bll;
using yuenanGupiao.Model;

public partial class u_WriteMsgBack : System.Web.UI.Page
{
    private int Id
    {
        get
        {
            if (this.ViewState["Id"] != null)
            {
                return Convert.ToInt32(this.ViewState["Id"]);
            }
            return -1;
        }
        set
        {
            this.ViewState["Id"] = value;
        }
    }

    private int State
    {
        get
        {
            if (this.ViewState["State"] != null)
            {
                return Convert.ToInt32(this.ViewState["State"]);
            }
            return 1;
        }
        set
        {
            this.ViewState["State"] = value;
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
            this.Session["PostBack"] = "u_WriteMsgBack.aspx";
            base.Response.Write("<script type='text/javascript'>window.location.replace('TwoLogin.aspx');</script>");
        }
        else if (!base.IsPostBack)
        {
            if ((base.Request.QueryString["id"] == null) || (base.Request.QueryString["State"] == null))
            {
                base.Response.Write("<script type='text/javascript'>alert('非法访问');window.location.href='u_MsgList.aspx';</script>");
            }
            else
            {
                try
                {
                    this.Id = Convert.ToInt32(base.Request.QueryString["id"]);
                    this.State = Convert.ToInt32(base.Request.QueryString["State"]);
                }
                catch
                {
                    this.Id = -1;
                }
                if ((this.Id == -1) || ((this.State != 0) && (this.State != 1)))
                {
                    base.Response.Write("<script type='text/javascript'>alert('非法访问');window.location.href='u_MsgList.aspx';</script>");
                }
                else
                {
                    this.GetData();
                }
            }
        }
    }

    protected void toBackDataBt_Click(object sender, EventArgs e)
    {
        string text = this.TextBox1.Text;
        if (text.Length == 0)
        {
            this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('回复不能为空');", true);
        }
        else
        {
            switch (new MessageManager().UpdateBack(this.Id, text))
            {
                case 0:
                    base.Response.Write("<script type='text/javascript'>alert('页面已过期或者信息已删除，请重新选择');window.location.href='u_MsgList.aspx';</script>");
                    return;

                case 1:
                    this.backDiv.InnerHtml = text;
                    this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('回复成功');", true);
                    return;

                case 2:
                    this.backDiv.InnerHtml = new MessageManager().GetModel(this.Id).back;
                    this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('您不能多次回复同一条邮件');", true);
                    return;
            }
        }
    }

    private void GetData()
    {
        Messages model = new MessageManager().GetModel(this.Id);
        if (model == null)
        {
            base.Response.Write("<script type='text/javascript'>alert('您查看的邮件已删除');window.location.href='u_MsgList.aspx';</script>");
        }
        else
        {
            this.titleLb.InnerHtml = model.title;
            this.timeLb.InnerText = model.markTime.ToString();
            this.dataDiv.InnerHtml = model.data;
            if (this.State == 1)
            {
                this.backDiv.InnerHtml = model.back;
            }
            else
            {
                if (!model.isSee)
                {
                    new MessageManager().UpdateIsSee(this.Id);
                }
                if ((model.back != null) && (model.back.Length > 0))
                {
                    this.backDiv.InnerHtml = model.back;
                }
            }
        }
    }
}