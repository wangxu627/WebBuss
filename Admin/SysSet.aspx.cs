using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yuenanGupiao.Model;
using yuenanGupiao.Bll;

public partial class Admin_SysSet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Session["AdminName"] == null)
        {
            base.Response.Write("<script type='text/javascript'>alert('您还没有登陆或者已经登陆超时');window.location.replace('index.aspx');</script>");
        }
        else if (!base.IsPostBack)
        {
            this.DataShow();
        }
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        bool state = Convert.ToInt32(this.StateList.SelectedValue) == 1;
        decimal tiXian = Convert.ToDecimal(this.tiXianTx.Text.Trim());
        int onePic = Convert.ToInt32(this.onePicTx.Text.Trim());
        int kouPic = Convert.ToInt32(this.kouPicTx.Text.Trim());
        decimal guPiao = Convert.ToDecimal(this.guPiaoTx.Text.Trim());
        int kouGpPic = Convert.ToInt32(this.kouGpPicTx.Text.Trim());
        int inFicitPic = Convert.ToInt32(this.inFicitPicTx.Text.Trim());
        if (1 == new SysSetManager().UpdateModel(state, tiXian, onePic, kouPic, guPiao, kouGpPic, inFicitPic))
        {
            this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('设置保存成功');", true);
        }
        else
        {
            this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('数据库繁忙');", true);
        }
        this.DataShow();
    }

    private void DataShow()
    {
        SysSet model = new SysSetManager().GetModel();
        this.StateList.SelectedValue = model.state ? "1" : "0";
        this.tiXianTx.Text = model.tiXian.ToString("F2");
        this.kouPicTx.Text = model.kouPic.ToString("G");
        this.onePicTx.Text = model.onePic.ToString("G");
        this.guPiaoTx.Text = model.guPiao.ToString("F2");
        this.kouGpPicTx.Text = model.kouGpPic.ToString("G");
        this.inFicitPicTx.Text = model.inFicitPic.ToString("G");
    }
}