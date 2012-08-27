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

public partial class Admin_ad_TiXianMark : System.Web.UI.Page
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
            if (this.ViewState["Flat"] == null)
            {
                return 2;
            }
            return Convert.ToInt32(this.ViewState["Flat"]);
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
            if (this.ViewState["State"] == null)
            {
                return 0;
            }
            return Convert.ToInt32(this.ViewState["State"]);
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
            this.AllCount = new TiXianManager().GetListByTimeName(this.State, this.userName, this.Flat).Count;
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
                        this.userName = "";
                        this.Flat = 2;
                        this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('请输入正确的日期进行搜索(2010-01-01)');", true);
                        return;
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
        this.AllCount = new TiXianManager().GetListByTimeName(this.State, this.userName, this.Flat).Count;
        this.AllPage = ((this.AllCount % this.PageCount) > 0) ? ((this.AllCount / this.PageCount) + 1) : (this.AllCount / this.PageCount);
        this.NowPage = 1;
        this.GetData();
        this.GetAllMoneyToShow();
    }

    private void GetAllMoneyToShow()
    {
        TiXian xian = new TiXianManager().GetAllMoneyByTimeName(this.State, this.userName, this.Flat);
        StringBuilder builder = new StringBuilder();
        if (xian.allMonwy > 0M)
        {
            builder.Append("<table style='width:65%' ><tr><td></td><td>总提现金额</td><td>总支付金额</td></tr>");
            builder.Append("<tr><td>金额总计");
            builder.Append("</td><td>");
            builder.Append(xian.allMonwy.ToString("F2"));
            builder.Append("</td><td>");
            builder.Append(xian.anyMoney.ToString("F2"));
            builder.Append("</td></tr></table>");
        }
        else
        {
            builder.Append("<table style='width:65%'><tr><td></td><td>总提现金额</td><td>总支付金额</td></tr>");
            builder.Append("<tr><td>金额总计");
            builder.Append("</td><td>");
            builder.Append("0");
            builder.Append("</td><td>");
            builder.Append("0");
            builder.Append("</td></tr></table>");
        }
        this.zongJiLb.InnerHtml = builder.ToString();
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
        this.GridView1.DataSource = new TiXianManager().GetListByTimeName(this.State, this.userName, this.Flat).Skip<TiXian>(count).Take<TiXian>(num2).ToList<TiXian>();
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
            TiXian dataItem = (TiXian)e.Row.DataItem;
            UserData model = new UserDataManager().GetModel(dataItem.userName);
            e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#FFF6D0'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c");
            e.Row.Cells[0].Text = dataItem.userName;
            e.Row.Cells[1].Text = model.realName;
            e.Row.Cells[2].Text = dataItem.allMonwy.ToString("F2");
            e.Row.Cells[3].Text = dataItem.anyMoney.ToString("F2");
            e.Row.Cells[8].Text = dataItem.markTime.ToShortDateString();
            if (dataItem.isShenhe)
            {
                e.Row.Cells[9].Text = dataItem.overTime.ToShortDateString();
            }
            else
            {
                e.Row.Cells[9].Text = "&nbsp;";
            }
            e.Row.Cells[4].Text = model.bankAddr;
            e.Row.Cells[5].Text = model.bankName;
            e.Row.Cells[6].Text = model.bankNum + ",";
            e.Row.Cells[7].Text = model.phone;
            if (dataItem.isShenhe)
            {
                e.Row.Cells[10].Text = "已发";
            }
            else
            {
                LinkButton button = (LinkButton)e.Row.FindControl("toShenHe");
                button.ToolTip = dataItem.id.ToString();
                button.Attributes.Add("onclick", "return toSen()");
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
        this.State = Convert.ToInt32(((LinkButton)sender).ToolTip);
        this.AllCount = new TiXianManager().GetListByTimeName(this.State, this.userName, this.Flat).Count;
        this.AllPage = ((this.AllCount % this.PageCount) > 0) ? ((this.AllCount / this.PageCount) + 1) : (this.AllCount / this.PageCount);
        this.NowPage = 1;
        this.GetData();
        this.GetAllMoneyToShow();
    }

    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        this.GridView1.DataSource = new TiXianManager().GetListByTimeName(this.State, this.userName, this.Flat);
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

    protected void toShenHe_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(((LinkButton)sender).ToolTip);
        new TiXianManager().Senhe(id);
        this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('审核成功');", true);
        this.AllCount = new TiXianManager().GetListByTimeName(this.State, this.userName, this.Flat).Count;
        this.AllPage = ((this.AllCount % this.PageCount) > 0) ? ((this.AllCount / this.PageCount) + 1) : (this.AllCount / this.PageCount);
        this.NowPage = 1;
        this.GetData();
        this.GetAllMoneyToShow();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
    }
}