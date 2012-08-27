using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yuenanGupiao.Bll;
using yuenanGupiao.Model;
using System.Text;
using System.IO;

public partial class Admin_ad_ZhuanzhangListTwo : System.Web.UI.Page
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

    private int Flat
    {
        get
        {
            if (this.ViewState["Flat"] != null)
            {
                return Convert.ToInt32(this.ViewState["Flat"]);
            }
            return 2;
        }
        set
        {
            this.ViewState["Flat"] = value;
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

    private int State
    {
        get
        {
            if (this.ViewState["State"] != null)
            {
                return Convert.ToInt32(this.ViewState["State"]);
            }
            return 0;
        }
        set
        {
            this.ViewState["State"] = value;
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
        if (this.Session["adminName"] == null)
        {
            base.Response.Write("<script type='text/javascript'>window.location.href='index.aspx';</script>");
        }
        else if (!base.IsPostBack)
        {
            this.AllCount = new ZhuanZhangManager().GetListByState(this.Flat, this.State, this.userName, 2).Count;
            this.AllPage = ((this.AllCount % this.PageCount) > 0) ? ((this.AllCount / this.PageCount) + 1) : (this.AllCount / this.PageCount);
            this.NowPage = 1;
            this.GetData();
            this.GetAllMoneyToShow();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        this.Flat = Convert.ToInt32(((Button)sender).ToolTip);
        this.userName = this.untx.Text.Trim();
        switch (this.Flat)
        {
            case 0:
                {
                    bool flag = true;
                    try
                    {
                        Convert.ToDateTime(this.userName);
                    }
                    catch
                    {
                        flag = false;
                    }
                    if (!flag)
                    {
                        this.untx.Text = "";
                        this.Flat = 2;
                        this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('请输入正确的日期格式(2009-09-08)');", true);
                    }
                    break;
                }
            case 1:
                if (new UserDataManager().GetModel(this.userName) != null)
                {
                    break;
                }
                this.userName = "";
                this.Flat = 2;
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('您输入的账号不存在或者没有审核');", true);
                return;
        }
        this.AllCount = new ZhuanZhangManager().GetListByState(this.Flat, this.State, this.userName, 2).Count;
        this.AllPage = ((this.AllCount % this.PageCount) > 0) ? ((this.AllCount / this.PageCount) + 1) : (this.AllCount / this.PageCount);
        this.NowPage = 1;
        this.GetData();
        this.GetAllMoneyToShow();
    }

    private void GetAllMoneyToShow()
    {
        ZhuanZhang zhang = new ZhuanZhangManager().GetAllMoneyByState(this.Flat, this.State, this.userName, 2);
        this.zongJiLb.InnerHtml = this.zongJiLb.InnerHtml = "金额共计:&nbsp;&nbsp;" + zhang.allMoney.ToString("F2");
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
        this.GridView1.DataSource = new ZhuanZhangManager().GetListByState(this.Flat, this.State, this.userName, 2).Skip<ZhuanZhang>(count).Take<ZhuanZhang>(num2).ToList<ZhuanZhang>();
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
            ZhuanZhang dataItem = (ZhuanZhang)e.Row.DataItem;
            e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#FFF6D0'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c");
            e.Row.Cells[0].Text = dataItem.fromName;
            e.Row.Cells[1].Text = dataItem.toName;
            e.Row.Cells[2].Text = dataItem.allMoney.ToString("F2");
            e.Row.Cells[3].Text = dataItem.markTime.ToString();
        }
    }

    protected void left_Click(object sender, EventArgs e)
    {
        this.NowPage--;
        this.GetData();
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        this.GridView1.DataSource = new ZhuanZhangManager().GetListByState(this.Flat, this.State, this.userName, 2);
        this.GridView1.DataBind();
        if (this.GridView1.Rows.Count > 0)
        {
            base.Response.ClearContent();
            base.Response.AddHeader("content-disposition", "attachment; filename=" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".xls");
            base.Response.Charset = "UTF-8";
            base.Response.ContentType = "application/ms-excel";
            base.Response.ContentEncoding = Encoding.GetEncoding("UTF-8");
            StringWriter writer = new StringWriter();
            HtmlTextWriter writer2 = new HtmlTextWriter(writer);
            this.GridView1.RenderControl(writer2);
            base.Response.Write(writer.ToString());
            base.Response.End();
        }
        else
        {
            this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('本页没有数据可以导出')", true);
        }
        this.GetData();
    }

    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        this.State = Convert.ToInt32(((LinkButton)sender).ToolTip);
        this.AllCount = new ZhuanZhangManager().GetListByState(this.Flat, this.State, this.userName, 2).Count;
        this.AllPage = ((this.AllCount % this.PageCount) > 0) ? ((this.AllCount / this.PageCount) + 1) : (this.AllCount / this.PageCount);
        this.NowPage = 1;
        this.GetData();
        this.GetAllMoneyToShow();
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

    public override void VerifyRenderingInServerForm(Control control)
    {
    }
}