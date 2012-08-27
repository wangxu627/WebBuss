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

public partial class Admin_ad_UserAllMark : System.Web.UI.Page
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
            return 0;
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
            this.AllCount = new UserDataManager().GetListBack(this.userName, this.Flat, this.State).Count;
            this.AllPage = ((this.AllCount % this.PageCount) > 0) ? ((this.AllCount / this.PageCount) + 1) : (this.AllCount / this.PageCount);
            this.NowPage = 1;
            this.GetData();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        this.Flat = Convert.ToInt32(((Button)sender).ToolTip);
        this.userName = this.untx.Text.Trim();
        switch (this.Flat)
        {
            case 1:
                if (new UserDataManager().GetModel(this.userName) != null)
                {
                    break;
                }
                this.userName = "";
                this.Flat = 0;
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('您搜索的会员编号不存在');", true);
                return;

            case 2:
                if ((new UserDataManager().GetModel(this.userName) != null) && new UserDataManager().GetModel(this.userName).isSenhe)
                {
                    break;
                }
                this.userName = "";
                this.Flat = 0;
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('您搜索的推荐人不存在或未审核');", true);
                return;

            case 3:
                try
                {
                    Convert.ToDateTime(this.userName);
                }
                catch
                {
                    this.userName = "";
                }
                if (!(this.userName == ""))
                {
                    break;
                }
                this.Flat = 0;
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('请输入格式正确的日期(如2009-11-11)');", true);
                return;

            case 4:
                if ((new UserDataManager().GetModel(this.userName) != null) && new UserDataManager().GetModel(this.userName).isSenhe)
                {
                    break;
                }
                this.userName = "";
                this.Flat = 0;
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('您搜索的注册人不存在或未审核');", true);
                return;

            case 5:
                break;

            default:
                this.userName = "";
                break;
        }
        this.AllCount = new UserDataManager().GetListBack(this.userName, this.Flat, this.State).Count;
        this.AllPage = ((this.AllCount % this.PageCount) > 0) ? ((this.AllCount / this.PageCount) + 1) : (this.AllCount / this.PageCount);
        this.NowPage = 1;
        this.GetData();
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        this.State = Convert.ToInt32(((Button)sender).ToolTip);
        this.AllCount = new UserDataManager().GetListBack(this.userName, this.Flat, this.State).Count;
        this.AllPage = ((this.AllCount % this.PageCount) > 0) ? ((this.AllCount / this.PageCount) + 1) : (this.AllCount / this.PageCount);
        this.NowPage = 1;
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
        this.GridView1.DataSource = new UserDataManager().GetListBack(this.userName, this.Flat, this.State).Skip<UserData>(count).Take<UserData>(num2).ToList<UserData>();
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
            UserData dataItem = (UserData)e.Row.DataItem;
            e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#FFF6D0'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c");
            e.Row.Cells[0].Text = dataItem.realName;
            e.Row.Cells[1].Text = string.Concat(new object[] { "<a href='ad_SetUserData.aspx?id=", dataItem.id, "' >", dataItem.userName, "</a>" });
            e.Row.Cells[2].Text = dataItem.refName;
            e.Row.Cells[3].Text = new ManaDataManager().GetModel(dataItem.userName).topName;
            e.Row.Cells[4].Text = dataItem.regName;
            e.Row.Cells[5].Text = Mark.GetGroupName(dataItem.groupId);
            e.Row.Cells[6].Text = dataItem.markTime.ToString();
            e.Row.Cells[7].Text = dataItem.phone;
            e.Row.Cells[8].Text = dataItem.zhuceMoney.ToString("F2");
            e.Row.Cells[9].Text = (dataItem.isKou == 0) ? "空单" : "实单";
            if (dataItem.isSenhe)
            {
                LinkButton button = (LinkButton)e.Row.FindControl("ToFirst");
                button.ToolTip = dataItem.userName;
                e.Row.Cells[10].Text = "已审核";
            }
            else
            {
                e.Row.Cells[11].Text = "";
                LinkButton button2 = (LinkButton)e.Row.FindControl("ToSen");
                button2.ToolTip = dataItem.userName;
                button2.Attributes.Add("onclick", "return isSen()");
                LinkButton button3 = (LinkButton)e.Row.FindControl("ToDel");
                button3.ToolTip = dataItem.userName;
                button3.Attributes.Add("onclick", "return isDel()");
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
        this.GridView1.DataSource = new UserDataManager().GetListBack(this.userName, this.Flat, this.State);
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

    protected void ToDel_Click(object sender, EventArgs e)
    {
        string toolTip = ((LinkButton)sender).ToolTip;
        switch (new UserDataManager().DelModel(toolTip))
        {
            case 0:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('会员已审核或者以删除');", true);
                break;

            case 1:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('删除成功');", true);
                break;
        }
        this.AllCount = new UserDataManager().GetListBack(this.userName, this.Flat, this.State).Count;
        this.AllPage = ((this.AllCount % this.PageCount) > 0) ? ((this.AllCount / this.PageCount) + 1) : (this.AllCount / this.PageCount);
        this.NowPage = (this.NowPage > this.AllPage) ? this.AllPage : this.NowPage;
        this.GetData();
    }

    protected void ToFirst_Click(object sender, EventArgs e)
    {
        string toolTip = ((LinkButton)sender).ToolTip;
        this.Session["userName"] = toolTip;
        this.Session["twoLogin"] = true;
        base.Response.Redirect("../u_Huanying.aspx", false);
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

    protected void ToSen_Click(object sender, EventArgs e)
    {
        string toolTip = ((LinkButton)sender).ToolTip;
        switch (new UserDataManager().Senhe(toolTip))
        {
            case 1:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('审核成功');", true);
                break;

            case 2:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('会员已审核或不存在');", true);
                break;

            case 3:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('注册钱包不足');", true);
                break;
        }
        this.AllCount = new UserDataManager().GetListBack(this.userName, this.Flat, this.State).Count;
        this.AllPage = ((this.AllCount % this.PageCount) > 0) ? ((this.AllCount / this.PageCount) + 1) : (this.AllCount / this.PageCount);
        this.NowPage = (this.NowPage > this.AllPage) ? this.AllPage : this.NowPage;
        this.GetData();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
    }
}