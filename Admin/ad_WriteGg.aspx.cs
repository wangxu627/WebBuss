using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yuenanGupiao.Bll;
using yuenanGupiao.Model;

public partial class Admin_ad_WriteGg : System.Web.UI.Page
{
    private int Id
    {
        get
        {
            if (this.ViewState["Id"] == null)
            {
                return -1;
            }
            return Convert.ToInt32(this.ViewState["Id"]);
        }
        set
        {
            this.ViewState["Id"] = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Session["adminName"] == null)
        {
            base.Response.Write("<script type='text/javascript'>window.location.href='index.aspx';</script>");
        }
        else if (!base.IsPostBack && (base.Request.QueryString["id"] != null))
        {
            try
            {
                this.Id = Convert.ToInt32(base.Request.QueryString["id"]);
            }
            catch
            {
                this.Id = -1;
            }
            this.GetData();
        }
    }

    protected void AddImgbt1_Click(object sender, ImageClickEventArgs e)
    {
        string title = this.tltx.Text.Trim();
        string data = this.WQeditor1.Text.Trim();
        if (data.Length == 0)
        {
            this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('正文不能为空');", true);
        }
        if (data.Length > 0x4e20)
        {
            this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('正文不能超过6000字');", true);
        }
        if (this.Id <= 0)
        {
            new GongGaoManager().AddModel(title, data);
        }
        else if (new GongGaoManager().GetModel(this.Id) == null)
        {
            new GongGaoManager().AddModel(title, data);
        }
        else
        {
            new GongGaoManager().UpdateModel(this.Id, data);
        }
        this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('保存成功');", true);
    }

    private void GetData()
    {
        GongGao model = new GongGaoManager().GetModel(this.Id);
        if (model != null)
        {
            this.tltx.Text = model.title;
            this.tltx.ReadOnly = true;
            this.WQeditor1.Text = model.data;
        }
        else
        {
            base.Response.Write("<script type='text/javascript'>alert('公告不存在');window.location.href='ad_GongGao.aspx';</script>");
        }
    }
}