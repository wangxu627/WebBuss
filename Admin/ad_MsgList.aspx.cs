using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yuenanGupiao.Bll;
using yuenanGupiao.Model;

public partial class Admin_ad_MsgList : System.Web.UI.Page
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

    private int state
    {
        get
        {
            if (this.ViewState["state"] == null)
            {
                return 0;
            }
            return Convert.ToInt32(this.ViewState["state"]);
        }
        set
        {
            this.ViewState["state"] = value;
        }
    }

    private int ToOrFrom
    {
        get
        {
            if (this.ViewState["ToOrFrom"] == null)
            {
                return 0;
            }
            return Convert.ToInt32(this.ViewState["ToOrFrom"]);
        }
        set
        {
            this.ViewState["ToOrFrom"] = value;
        }
    }
 
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Session["adminName"] == null)
        {
            base.Response.Write("<script type='text/javascript'>window.location.href='index.aspx';</script>");
        }
        else if (!base.IsPostBack)
        {
            this.AllCount = new MessageManager().GetListByStateName("admin", this.ToOrFrom, this.state).Count;
            this.AllPage = ((this.AllCount % this.PageCount) > 0) ? ((this.AllCount / this.PageCount) + 1) : (this.AllCount / this.PageCount);
            this.NowPage = 1;
            this.GetData();
        }
    }

    protected void DelMeg_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(((LinkButton)sender).ToolTip);
        new MessageManager().DelModel(id);
        this.AllCount = new MessageManager().GetListByStateName("admin", this.ToOrFrom, this.state).Count;
        this.AllPage = ((this.AllCount % this.PageCount) > 0) ? ((this.AllCount / this.PageCount) + 1) : (this.AllCount / this.PageCount);
        if (this.NowPage > this.AllPage)
        {
            this.NowPage = this.AllPage;
        }
        base.Response.Write("<script type='text/javascript'>alert('删除成功');</script>");
        this.GetData();
    }

    private void GetData()
    {
        int count = (this.NowPage - 1) * this.PageCount;
        int num2 = ((count + this.PageCount) > this.AllCount) ? (this.AllCount - count) : this.PageCount;
        this.allnumlb.Text = this.AllCount.ToString();
        if (this.AllCount == 0)
        {
            this.nownumlb.Text = "0-0";
        }
        else
        {
            this.nownumlb.Text = ((count + 1)).ToString() + "-" + ((count + num2)).ToString();
        }
        this.GridView1.DataSource = new MessageManager().GetListByStateName("admin", this.ToOrFrom, this.state).Skip<Messages>(count).Take<Messages>(num2).ToList<Messages>();
        this.GridView1.DataBind();
        this.ToPage();
    }

    protected void Gobt_Click(object sender, EventArgs e)
    {
        string text = this.pagetx.Text;
        try
        {
            this.NowPage = Convert.ToInt32(text);
        }
        catch
        {
            this.NowPage = 1;
        }
        if (this.NowPage > this.AllPage)
        {
            this.NowPage = 1;
        }
        this.GetData();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Messages dataItem = (Messages)e.Row.DataItem;
            e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#FFF6D0'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c");
            e.Row.Cells[2].Text = dataItem.markTime.ToString();
            e.Row.Cells[3].Text = dataItem.isSee ? "已查看" : "未查看";
            LinkButton button = (LinkButton)e.Row.FindControl("WriteBack");
            LinkButton button2 = (LinkButton)e.Row.FindControl("DelMeg");
            if (this.ToOrFrom == 0)
            {
                e.Row.Cells[0].Text = string.Concat(new object[] { "<a href='ad_WriteMsgBack.aspx?id=", dataItem.id, "&State=0'>", dataItem.title, "</a>" });
                e.Row.Cells[1].Text = dataItem.fromName;
                button.PostBackUrl = "ad_WriteMsgBack.aspx?id=" + dataItem.id + "&State=0";
                if (dataItem.back.Length > 0)
                {
                    button.Text = "查看邮件(已回复)";
                }
                else
                {
                    button.Text = "查看邮件(未回复)";
                }
                button2.ToolTip = dataItem.id.ToString();
            }
            else
            {
                e.Row.Cells[0].Text = string.Concat(new object[] { "<a href='ad_WriteMsgBack.aspx?id=", dataItem.id, "&State=1'>", dataItem.title, "</a>" });
                e.Row.Cells[1].Text = dataItem.toName;
                button.PostBackUrl = "ad_WriteMsgBack.aspx?id=" + dataItem.id + "&State=1";
                if (dataItem.back.Length > 0)
                {
                    button.Text = "查看回复(已回复)";
                }
                else
                {
                    button.Text = "查看回复(未回复)";
                }
                button2.Enabled = false;
            }
        }
    }

    protected void left_Click(object sender, EventArgs e)
    {
        this.NowPage--;
        this.GetData();
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        this.ToOrFrom = Convert.ToInt32(((LinkButton)sender).ToolTip);
        this.AllCount = new MessageManager().GetListByStateName("admin", this.ToOrFrom, this.state).Count;
        this.AllPage = ((this.AllCount % this.PageCount) > 0) ? ((this.AllCount / this.PageCount) + 1) : (this.AllCount / this.PageCount);
        this.NowPage = 1;
        this.GetData();
    }


    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        this.state = Convert.ToInt32(((LinkButton)sender).ToolTip);
        this.AllCount = new MessageManager().GetListByStateName("admin", this.ToOrFrom, this.state).Count;
        this.AllPage = ((this.AllCount % this.PageCount) > 0) ? ((this.AllCount / this.PageCount) + 1) : (this.AllCount / this.PageCount);
        this.NowPage = 1;
        this.GetData();
    }

    protected void Right_Click(object sender, EventArgs e)
    {
        this.NowPage++;
        this.GetData();
    }

    private void ToPage()
    {
        this.NowPagelb.Text = this.NowPage.ToString();
        this.AllPagelb.Text = this.AllPage.ToString();
        this.pagetx.Text = this.NowPage.ToString();
        if (this.NowPage >= this.AllPage)
        {
            this.FromBt.Enabled = false;
        }
        else
        {
            this.FromBt.Enabled = true;
        }
        if (this.NowPage <= 1)
        {
            this.BackBt.Enabled = false;
        }
        else
        {
            this.BackBt.Enabled = true;
        }
        if (this.AllPage <= 1)
        {
            this.Gobt.Enabled = false;
        }
        else
        {
            this.Gobt.Enabled = true;
        }
    }
}