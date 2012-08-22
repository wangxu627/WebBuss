using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yuenanGupiao.Model;
using yuenanGupiao.Bll;
using System.Web.UI.HtmlControls;

public partial class u_ManaTu : System.Web.UI.Page
{
    public string topName
    {
        get
        {
            if (this.ViewState["topName"] == null)
            {
                return "";
            }
            return this.ViewState["topName"].ToString();
        }
        set
        {
            this.ViewState["topName"] = value;
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
            this.topName = this.Session["userName"].ToString();
            this.DataTopBing(this.topName);
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string manaNum = this.untx.Text.Trim();
        ManaData model = new ManaDataManager().GetModel(manaNum);
        if ((model != null) && model.isSenhe)
        {
            while ((model != null) && (model.manaNum != this.topName))
            {
                model = new ManaDataManager().GetModel(model.topName);
            }
            if (model == null)
            {
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('您搜索的账号不在您的管理区');", true);
            }
            else
            {
                this.DataTopBing(manaNum);
            }
        }
        else
        {
            this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('您输入的账号不存在或者未审核');", true);
        }
    }

    private void databingtable(string manaNum, ImageButton img1, Label unlb, Label rnlb, Label mn1, Label mn2, HtmlTableCell td, string Name, int isLeft)
    {
        ManaData model = new ManaDataManager().GetModel(manaNum);
        if (model == null)
        {
            if (Name == "")
            {
                img1.AlternateText = this.topName;
                img1.ImageUrl = "Images/p6.gif";
                unlb.Text = "空位";
                rnlb.Text = "";
                mn1.Text = "";
                mn2.Text = "";
                td.Style[HtmlTextWriterStyle.BackgroundColor] = "#79554E";
            }
            else
            {
                img1.AlternateText = this.topName;
                img1.ImageUrl = "Images/p6.gif";
                unlb.Text = string.Concat(new object[] { "<a href='u_AddUsers.aspx?tn=", Name, "&il=", isLeft, "'><span style='background-color:#FFCC99;padding-left:5px; padding-right:5px'>注册</span></a>" });
                rnlb.Text = "";
                mn1.Text = "";
                mn2.Text = "";
                td.Style[HtmlTextWriterStyle.BackgroundColor] = "#79554E";
            }
        }
        else if (!model.isSenhe)
        {
            img1.AlternateText = this.topName;
            img1.ImageUrl = "Images/p6.gif";
            unlb.Text = "未审核";
            rnlb.Text = "";
            mn1.Text = "";
            mn2.Text = "";
            td.Style[HtmlTextWriterStyle.BackgroundColor] = "#79554E";
        }
        else
        {
            img1.AlternateText = model.manaNum;
            switch (model.groupId)
            {
                case 1:
                    img1.ImageUrl = "Images/p1.gif";
                    td.Style[HtmlTextWriterStyle.BackgroundColor] = "#97C618";
                    break;

                case 2:
                    img1.ImageUrl = "Images/p2.gif";
                    td.Style[HtmlTextWriterStyle.BackgroundColor] = "#00549D";
                    break;

                case 3:
                    img1.ImageUrl = "Images/p4.gif";
                    td.Style[HtmlTextWriterStyle.BackgroundColor] = "#FFBA00";
                    break;

                case 4:
                    img1.ImageUrl = "Images/p5.gif";
                    td.Style[HtmlTextWriterStyle.BackgroundColor] = "#B20003";
                    break;

                default:
                    img1.ImageUrl = "Images/p6.gif";
                    td.Style[HtmlTextWriterStyle.BackgroundColor] = "#79554E";
                    break;
            }
            unlb.Text = model.manaNum;
            rnlb.Text = new UserDataManager().GetNiCheng(model.fromName);
            mn1.Text = model.leftCount.ToString();
            mn2.Text = model.rightCount.ToString();
        }
    }

    private void DataTopBing(string manaNum)
    {
        ManaData model = new ManaDataManager().GetModel(manaNum);
        if (manaNum == this.topName)
        {
            this.LinkButton1.ToolTip = model.manaNum;
            this.topImg.AlternateText = model.manaNum;
        }
        else
        {
            this.LinkButton1.ToolTip = model.topName;
            this.topImg.AlternateText = model.topName;
        }
        switch (model.groupId)
        {
            case 1:
                this.topImg.ImageUrl = "Images/p1.gif";
                this.toptd.Style[HtmlTextWriterStyle.BackgroundColor] = "#97C618";
                break;

            case 2:
                this.topImg.ImageUrl = "Images/p2.gif";
                this.toptd.Style[HtmlTextWriterStyle.BackgroundColor] = "#00549D";
                break;

            case 3:
                this.topImg.ImageUrl = "Images/p4.gif";
                this.toptd.Style[HtmlTextWriterStyle.BackgroundColor] = "#FFBA00";
                break;

            case 4:
                this.topImg.ImageUrl = "Images/p5.gif";
                this.toptd.Style[HtmlTextWriterStyle.BackgroundColor] = "#B20003";
                break;

            default:
                this.topImg.ImageUrl = "Images/p6.gif";
                this.toptd.Style[HtmlTextWriterStyle.BackgroundColor] = "#79554E";
                break;
        }
        this.topunlb.Text = model.manaNum;
        this.toprnlb.Text = new UserDataManager().GetNiCheng(model.fromName);
        this.tmb1.Text = model.leftCount.ToString();
        this.tmn2.Text = model.rightCount.ToString();
        this.left1Bind(model.leftLower, model.manaNum);
        this.right1Bind(model.rightLower, model.manaNum);
    }

    protected void img1_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton button = (ImageButton)sender;
        string alternateText = button.AlternateText;
        new ManaDataManager().GetModel(alternateText);
        this.DataTopBing(alternateText);
    }

    private void left1Bind(string manaNum, string Name)
    {
        ManaData model = new ManaDataManager().GetModel(manaNum);
        this.databingtable(manaNum, this.leftimg1, this.leftunlb1, this.leftrnlb1, this.l1mn1, this.l1mn2, this.lefttd1, Name, 0);
        if (model == null)
        {
            this.left2Bind("0", manaNum);
            this.left3Bind("0", manaNum);
        }
        else
        {
            this.left2Bind(model.leftLower, manaNum);
            this.left3Bind(model.rightLower, manaNum);
        }
    }

    private void left2Bind(string manaNum, string Name)
    {
        ManaData model = new ManaDataManager().GetModel(manaNum);
        this.databingtable(manaNum, this.leftimg2, this.leftunlb2, this.leftrnlb2, this.l2mn1, this.l2mn2, this.lefttd2, Name, 1);
        if (model == null)
        {
            this.left4Bind("0", manaNum);
            this.left5Bind("0", manaNum);
        }
        else
        {
            this.left4Bind(model.leftLower, manaNum);
            this.left5Bind(model.rightLower, manaNum);
        }
    }

    private void left3Bind(string manaNum, string Name)
    {
        ManaData model = new ManaDataManager().GetModel(manaNum);
        this.databingtable(manaNum, this.leftimg3, this.leftunlb3, this.leftrnlb3, this.l3mn1, this.l3mn2, this.lefttd3, Name, 2);
        if (model == null)
        {
            this.left6Bind("0", manaNum);
            this.left7Bind("0", manaNum);
        }
        else
        {
            this.left6Bind(model.leftLower, manaNum);
            this.left7Bind(model.rightLower, manaNum);
        }
    }

    private void left4Bind(string manaNum, string Name)
    {
        this.databingtable(manaNum, this.leftimg4, this.leftunlb4, this.leftrnlb4, this.l4mn1, this.l4mn2, this.lefttd4, Name, 1);
    }

    private void left5Bind(string manaNum, string Name)
    {
        this.databingtable(manaNum, this.leftimg5, this.leftunlb5, this.leftrnlb5, this.l5mn1, this.l5mn2, this.lefttd5, Name, 2);
    }

    private void left6Bind(string manaNum, string Name)
    {
        this.databingtable(manaNum, this.leftimg6, this.leftunlb6, this.leftrnlb6, this.l6mn1, this.l6mn2, this.lefttd6, Name, 1);
    }

    private void left7Bind(string manaNum, string Name)
    {
        this.databingtable(manaNum, this.leftimg7, this.leftunlb7, this.leftrnlb7, this.l7mn1, this.l7mn2, this.lefttd7, Name, 2);
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton button = (LinkButton)sender;
        string toolTip = button.ToolTip;
        new ManaDataManager().GetModel(toolTip);
        this.DataTopBing(toolTip);
    }

    private void right1Bind(string manaNum, string Name)
    {
        ManaData model = new ManaDataManager().GetModel(manaNum);
        this.databingtable(manaNum, this.rightimg1, this.rightunlb1, this.rightrnlb1, this.r1mn1, this.r1mn2, this.righttd1, Name, 2);
        if (model == null)
        {
            this.right2Bind("0", manaNum);
            this.right3Bind("0", manaNum);
        }
        else
        {
            this.right2Bind(model.leftLower, manaNum);
            this.right3Bind(model.rightLower, manaNum);
        }
    }
    private void right2Bind(string manaNum, string Name)
    {
        ManaData model = new ManaDataManager().GetModel(manaNum);
        this.databingtable(manaNum, this.rightimg2, this.rightunlb2, this.rightrnlb2, this.r2mn1, this.r2mn2, this.righttd2, Name, 1);
        if (model == null)
        {
            this.right4Bind("0", manaNum);
            this.right5Bind("0", manaNum);
        }
        else
        {
            this.right4Bind(model.leftLower, manaNum);
            this.right5Bind(model.rightLower, manaNum);
        }
    }

    private void right3Bind(string manaNum, string Name)
    {
        ManaData model = new ManaDataManager().GetModel(manaNum);
        this.databingtable(manaNum, this.rightimg3, this.rightunlb3, this.rightrnlb3, this.r3mn1, this.r3mn2, this.righttd3, Name, 2);
        if (model == null)
        {
            this.right6Bind("0", manaNum);
            this.right7Bind("0", manaNum);
        }
        else
        {
            this.right6Bind(model.leftLower, manaNum);
            this.right7Bind(model.rightLower, manaNum);
        }
    }
    private void right4Bind(string manaNum, string Name)
    {
        this.databingtable(manaNum, this.rightimg4, this.rightunlb4, this.rightrnlb4, this.r4mn1, this.r4mn2, this.righttd4, Name, 1);
    }

    private void right5Bind(string manaNum, string Name)
    {
        this.databingtable(manaNum, this.rightimg5, this.rightunlb5, this.rightrnlb5, this.r5mn1, this.r5mn2, this.righttd5, Name, 2);
    }

    private void right6Bind(string manaNum, string Name)
    {
        this.databingtable(manaNum, this.rightimg6, this.rightunlb6, this.rightrnlb6, this.r6mn1, this.r6mn2, this.righttd6, Name, 1);
    }

    private void right7Bind(string manaNum, string Name)
    {
        this.databingtable(manaNum, this.rightimg7, this.rightunlb7, this.rightrnlb7, this.r7mn1, this.r7mn2, this.righttd7, Name, 2);
    }
}