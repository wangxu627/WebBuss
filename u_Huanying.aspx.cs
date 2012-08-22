using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yuenanGupiao.Model;
using yuenanGupiao.Bll;

public partial class u_Huanying : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Session["userName"] == null)
        {
            base.Response.Write("<script type='text/javascript'>window.location.href='index.aspx';</script>");
        }
        else if (!base.IsPostBack)
        {
            this.GetData();
        }

    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            GongGao dataItem = (GongGao)e.Row.DataItem;
            if (dataItem.title != "")
            {
                if (dataItem.title.Length < 15)
                {
                    e.Row.Cells[0].Text = string.Concat(new object[] { " •&nbsp;&nbsp;<a href='u_LookGg.aspx?id=", dataItem.id, "'>", dataItem.title, "</a>" });
                }
                else
                {
                    e.Row.Cells[0].Text = string.Concat(new object[] { " •&nbsp;&nbsp;<a href='u_LookGg.aspx?id=", dataItem.id, "'>", dataItem.title.Substring(0, 15), "</a>" });
                }
            }
            else
            {
                e.Row.Cells[0].Text = " •&nbsp;&nbsp;<span style='color:#cc0000'>暂时没有公告</span>";
            }
        }
    }

    private void GetData()
    {
        this.unlb.Text = this.Session["userName"].ToString();
        List<GongGao> list = new GongGaoManager().GetList().Take<GongGao>(5).ToList<GongGao>();
        if (list.Count == 0)
        {
            GongGao item = new GongGao
            {
                title = ""
            };
            list.Add(item);
            this.GridView1.DataSource = list;
            this.GridView1.DataBind();
        }
        else
        {
            this.GridView1.DataSource = list;
            this.GridView1.DataBind();
        }
    }
}