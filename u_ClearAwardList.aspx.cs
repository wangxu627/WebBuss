using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yuenanGupiao.Bll;
using yuenanGupiao.Model;

public partial class u_ClearAwardList : System.Web.UI.Page
{
    private int AllCount
    {
        get
        {
            if (this.ViewState["AllCount"] == null)
            {
                return 0;
            }
            return Convert.ToInt32(this.ViewState["AllCount"]);
        }
        set
        {
            this.ViewState["AllCount"] = value;
        }
    }

    private int AllPage
    {
        get
        {
            if (this.ViewState["AllPage"] == null)
            {
                return 0;
            }
            return Convert.ToInt32(this.ViewState["AllPage"]);
        }
        set
        {
            this.ViewState["AllPage"] = value;
        }
    }

    private int NowPage
    {
        get
        {
            if (this.ViewState["NowPage"] == null)
            {
                return 0;
            }
            return Convert.ToInt32(this.ViewState["NowPage"]);
        }
        set
        {
            this.ViewState["NowPage"] = value;
        }
    }

    public int Num
    {
        get
        {
            if (this.ViewState["Num"] != null)
            {
                return Convert.ToInt32(this.ViewState["Num"]);
            }
            return 0;
        }
        set
        {
            this.ViewState["Num"] = value;
        }
    }

    private int PageCount
    {
        get
        {
            if (this.ViewState["PageCount"] == null)
            {
                return 20;
            }
            return Convert.ToInt32(this.ViewState["PageCount"]);
        }
        set
        {
            this.ViewState["PageCount"] = value;
        }
    }

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
            this.Session["PostBack"] = base.Request.RawUrl;
            base.Response.Write("<script type='text/javascript'>window.location.replace('TwoLogin.aspx');</script>");
        }
        else if (!base.IsPostBack)
        {
            this.userName = this.Session["userName"].ToString();
            this.GetData();
        }

    }

    /// <summary>
    /// 
    /// </summary>
    private void GetData()
    {
        this.GridView1.DataSource = new DetailedAwardManager().GetModelByName(this.userName);
        this.GridView1.DataBind();
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DetailedAward dataItem = (DetailedAward)e.Row.DataItem;
            e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#ECECEC'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c");
            e.Row.Cells[0].Text = this.userName;
            e.Row.Cells[1].Text = dataItem.refAward.ToString("F2");
            e.Row.Cells[2].Text = dataItem.pengAward.ToString("F2");
            e.Row.Cells[3].Text = dataItem.refPengAward.ToString("F2");
            e.Row.Cells[4].Text = dataItem.fenHongAward.ToString("F2");
            e.Row.Cells[5].Text = dataItem.allAward.ToString("F2");
            e.Row.Cells[6].Text = dataItem.kouOne.ToString("F2");
            e.Row.Cells[7].Text = dataItem.realAward.ToString("F2");
            ((LinkButton)e.Row.FindControl("ToSee")).PostBackUrl = "u_DetailAward.aspx";
        }
    }
}