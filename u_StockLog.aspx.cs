﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yuenanGupiao.Bll;
using yuenanGupiao.Model;

public partial class u_StockLog : System.Web.UI.Page
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
        if (this.Session["userName"] == null)
        {
            base.Response.Write("<script type='text/javascript'>alert('你还没有登陆或登录已过期，请重新登录');window.location.href='index.aspx';</script>");
        }
        else if (this.Session["twoLogin"] == null)
        {
            this.Session["PostBack"] = base.Request.RawUrl;
            base.Response.Write("<script type='text/javascript'>alert('请输入二级密码');window.location.replace('TwoLogin.aspx');</script>");
        }
        else if (!base.IsPostBack)
        {
            this.userName = this.Session["userName"].ToString();
            this.AllCount = new StockPayLogManager().GetListByName(this.userName, this.State).Count;
            this.AllPage = ((this.AllCount % this.PageCount) > 0) ? ((this.AllCount / this.PageCount) + 1) : (this.AllCount / this.PageCount);
            this.NowPage = 1;
            this.GetData();
            this.GetAllMoneyToShow();
        }
    }

    private void GetAllMoneyToShow()
    {
        this.zongJiLb.InnerHtml = ("总额:" + new StockPayLogManager().GetCountByName(this.userName, this.State).ToString("F2")).ToString();
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
        this.GridView1.DataSource = new StockPayLogManager().GetListByName(this.userName, this.State).Skip<StockPayLog>(count).Take<StockPayLog>(num2).ToList<StockPayLog>();
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
            StockPayLog dataItem = (StockPayLog)e.Row.DataItem;
            e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#ECECEC'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c");
            e.Row.Cells[0].Text = dataItem.fromName;
            e.Row.Cells[1].Text = dataItem.toName;
            e.Row.Cells[2].Text = dataItem.singMoney.ToString("F2");
            e.Row.Cells[3].Text = dataItem.allCount.ToString();
            e.Row.Cells[4].Text = (dataItem.singMoney * dataItem.allCount).ToString("F2");
            e.Row.Cells[5].Text = dataItem.okTime.ToShortDateString();
            e.Row.Cells[6].Text = dataItem.markTime.ToShortDateString();
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
        this.AllCount = new StockPayLogManager().GetListByName(this.userName, this.State).Count;
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
}