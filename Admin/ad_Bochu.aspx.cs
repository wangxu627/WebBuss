using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yuenanGupiao.Bll;
using yuenanGupiao.Model;

public partial class Admin_ad_Bochu : System.Web.UI.Page
{
    private int AllNum
    {
        get
        {
            if (this.ViewState["AllNum"] == null)
            {
                return 0;
            }
            return Convert.ToInt32(this.ViewState["AllNum"]);
        }
        set
        {
            this.ViewState["AllNum"] = value;
        }
    }

    private int Num
    {
        get
        {
            if (this.ViewState["Num"] == null)
            {
                return 0;
            }
            return Convert.ToInt32(this.ViewState["Num"]);
        }
        set
        {
            this.ViewState["Num"] = value;
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
            this.GetData();
        }
    }

    private void GetData()
    {
        decimal allMoney = new UserDataManager().GetAllMoney();
        List<DetailedAward> model = new DetailedAwardManager().GetModel();
        this.allMoneyLb.InnerHtml = allMoney.ToString("F2");
        if ((model.Count == 0) || (allMoney == 0M))
        {
            this.refAwardLb.InnerText = "0";
            this.pengAwardLb.InnerText = "0";
            this.refPengAwardLb.InnerText = "0";
            this.fenHongAwardLb.InnerText = "0";
            this.allAwardLb.InnerText = "0";
            this.kouOneLb.InnerText = "0";
            this.realAwardLb.InnerText = "0";
            this.refAwardPicLb.InnerText = "0";
            this.pengAwardPicLb.InnerText = "0";
            this.refPengAwardPicLb.InnerText = "0";
            this.fenHongAwardPicLb.InnerText = "0";
            this.allAwardPicLb.InnerText = "0";
            this.kouOnePicLb.InnerText = "0";
            this.realAwardPicLb.InnerText = "0";
        }
        else
        {
            this.refAwardLb.InnerText = model[0].refAward.ToString("F2");
            this.pengAwardLb.InnerText = model[0].pengAward.ToString("F2");
            this.refPengAwardLb.InnerText = model[0].refPengAward.ToString("F2");
            this.fenHongAwardLb.InnerText = model[0].fenHongAward.ToString("F2");
            this.allAwardLb.InnerText = model[0].allAward.ToString("F2");
            this.kouOneLb.InnerText = model[0].kouOne.ToString("F2");
            this.realAwardLb.InnerText = model[0].realAward.ToString("F2");
            this.refAwardPicLb.InnerText = ((model[0].refAward / allMoney) * 100M).ToString("F2");
            this.pengAwardPicLb.InnerText = ((model[0].pengAward / allMoney) * 100M).ToString("F2");
            this.refPengAwardPicLb.InnerText = ((model[0].refPengAward / allMoney) * 100M).ToString("F2");
            this.fenHongAwardPicLb.InnerText = ((model[0].fenHongAward / allMoney) * 100M).ToString("F2");
            this.allAwardPicLb.InnerText = ((model[0].allAward / allMoney) * 100M).ToString("F2");
            this.kouOnePicLb.InnerText = ((model[0].kouOne / allMoney) * 100M).ToString("F2");
            this.realAwardPicLb.InnerText = ((model[0].realAward / allMoney) * 100M).ToString("F2");
        }
    }
}