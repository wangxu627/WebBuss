using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yuenanGupiao.Model;
using yuenanGupiao.Bll;

public partial class u_dailiMark : System.Web.UI.Page
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

    private string dailiNum
    {
        get
        {
            if (this.ViewState["dailiNum"] == null)
            {
                return "";
            }
            return Convert.ToString(this.ViewState["dailiNum"]);
        }
        set
        {
            this.ViewState["dailiNum"] = value;
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
 


    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Session["userName"] == null)
        {
            base.Response.Write("<script type='text/javascript'>window.location.href='index.aspx';</script>");
        }
        else if (this.Session["twoLogin"] == null)
        {
            this.Session["PostBack"] = "u_dailiMark.aspx";
            base.Response.Write("<script type='text/javascript'>window.location.replace('TwoLogin.aspx');</script>");
        }
        else if (!base.IsPostBack)
        {
            this.dailiNum = this.Session["userName"].ToString();
            UserData model = new UserDataManager().GetModel(this.dailiNum);
            this.ShowMsg.InnerHtml = "您的现金钱包" + model.lastMoney.ToString("F2") + ",注册钱包:" + model.zhuceMoney.ToString("F2");
            this.AllCount = new UserDataManager().GetListByRegName(this.dailiNum, this.State).Count;
            this.AllPage = ((this.AllCount % this.PageCount) > 0) ? ((this.AllCount / this.PageCount) + 1) : (this.AllCount / this.PageCount);
            this.NowPage = 1;
            this.GetData();
        }

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
        UserData model = new UserDataManager().GetModel(this.dailiNum);
        this.ShowMsg.InnerHtml = "您的现金钱包" + model.lastMoney.ToString("F2") + ",注册钱包:" + model.zhuceMoney.ToString("F2");
        this.AllCount = new UserDataManager().GetListByRegName(this.dailiNum, this.State).Count;
        this.AllPage = ((this.AllCount % this.PageCount) > 0) ? ((this.AllCount / this.PageCount) + 1) : (this.AllCount / this.PageCount);
        this.NowPage = (this.NowPage > this.AllPage) ? this.AllPage : this.NowPage;
        this.GetData();
    }

    protected void left_Click(object sender, EventArgs e)
    {
        this.NowPage--;
        this.GetData();
    }

    protected void Right_Click(object sender, EventArgs e)
    {
        this.NowPage++;
        this.GetData();
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
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('您的注册钱包不足');", true);
                break;
        }
        UserData model = new UserDataManager().GetModel(this.dailiNum);
        this.ShowMsg.InnerHtml = "您的现金钱包" + model.lastMoney.ToString("F2") + ",注册钱包:" + model.zhuceMoney.ToString("F2");
        this.AllCount = new UserDataManager().GetListByRegName(this.dailiNum, this.State).Count;
        this.AllPage = ((this.AllCount % this.PageCount) > 0) ? ((this.AllCount / this.PageCount) + 1) : (this.AllCount / this.PageCount);
        this.NowPage = (this.NowPage > this.AllPage) ? this.AllPage : this.NowPage;
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
        this.GridView1.DataSource = new UserDataManager().GetListByRegName(this.dailiNum, this.State).Skip<UserData>(count).Take<UserData>(num2).ToList<UserData>();
        this.GridView1.DataBind();
        this.ToPage();
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

    protected void Button4_Click(object sender, EventArgs e)
    {
        this.State = Convert.ToInt32(((Button)sender).ToolTip);
        this.AllCount = new UserDataManager().GetListByRegName(this.dailiNum, this.State).Count;
        this.AllPage = ((this.AllCount % this.PageCount) > 0) ? ((this.AllCount / this.PageCount) + 1) : (this.AllCount / this.PageCount);
        this.NowPage = 1;
        this.GetData();
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
            e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#ECECEC'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c");
            e.Row.Cells[0].Text = dataItem.userName;
            e.Row.Cells[1].Text = dataItem.refName;
            e.Row.Cells[2].Text = new ManaDataManager().GetModel(dataItem.userName).topName;
            e.Row.Cells[3].Text = Mark.GetGroupName(dataItem.groupId);
            e.Row.Cells[4].Text = dataItem.niCheng;
            e.Row.Cells[5].Text = dataItem.markTime.ToString();
            e.Row.Cells[6].Text = dataItem.phone;
            if (dataItem.isSenhe)
            {
                e.Row.Cells[7].Text = "已审核";
            }
            else
            {
                LinkButton button = (LinkButton)e.Row.FindControl("ToSen");
                button.ToolTip = dataItem.userName;
                button.Attributes.Add("onclick", "return isSen()");
                LinkButton button2 = (LinkButton)e.Row.FindControl("ToDel");
                button2.ToolTip = dataItem.userName;
                button2.Attributes.Add("onclick", "return isDel()");
            }
        }
    }

 


}