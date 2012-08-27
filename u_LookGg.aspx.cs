using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yuenanGupiao.Bll;
using yuenanGupiao.Model;

public partial class u_LookGg : System.Web.UI.Page
{
    private int Id
    {
        get
        {
            if (this.ViewState["Id"] != null)
            {
                return Convert.ToInt32(this.ViewState["Id"]);
            }
            return 0;
        }
        set
        {
            this.ViewState["Id"] = value;
        }
    }
 
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Session["userName"] == null)
        {
            base.Response.Write("<script type='text/javascript'>window.location.href='index.aspx';</script>");
        }
        else if (!base.IsPostBack)
        {
            try
            {
                this.Id = Convert.ToInt32(base.Request.QueryString["id"]);
            }
            catch
            {
                this.Id = -1;
            }
            if ((this.Id <= 0) || (new GongGaoManager().GetModel(this.Id) == null))
            {
                base.Response.Write("<script type='text/javascript'>alert('非法访问');window.location.href='u_GongGao.aspx';</script>");
            }
            else
            {
                this.GetData();
            }
        }
    }

    private void GetData()
    {
        GongGao model = new GongGaoManager().GetModel(this.Id);
        this.timeLb.InnerHtml = "&nbsp;";
        this.titleLb.InnerText = model.title;
        this.dataDiv.InnerHtml = model.data;
    }

 

}