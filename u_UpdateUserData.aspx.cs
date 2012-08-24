using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yuenanGupiao.Model;
using yuenanGupiao.Bll;

public partial class u_UpdateUserData : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Session["userName"] == null)
        {
            base.Response.Write("<script type='text/javascript'>window.location.href='index.aspx';</script>");
        }
        else if (this.Session["twoLogin"] == null)
        {
            this.Session["PostBack"] = "u_UpdateUserData.aspx";
            base.Response.Write("<script type='text/javascript'>window.location.replace('TwoLogin.aspx');</script>");
        }
        else if (!base.IsPostBack)
        {
            this.GetData();
        }
    }

    private void GetData()
    {
        UserData model = new UserDataManager().GetModel(this.Session["userName"].ToString());
        if (model == null)
        {
            base.Response.Write("<script type='text/javascript'>window.location.href='index.aspx';</script>");
        }
        else
        {
            this.unLb.Text = model.userName;
            this.rfLb.Text = model.refName;
            this.realtx.Text = model.realName;
            this.baLb.Text = model.bankName;
            this.topNameLb.Text = new ManaDataManager().GetModel(model.userName).topName;
            this.grouplb.Text = Mark.GetGroupName(model.groupId);
            this.buLb.Text = model.bankNum;
            this.phtx.Text = model.phone;
            this.pidTx.Text = model.pid;
            this.bankAddrTx.Text = model.bankAddr;
            this.qqNumTx.Text = model.qqNum;
            this.addtx.Text = model.address;
            this.zipTx.Text = model.zip;
            this.niChengTx.Text = model.niCheng;
            this.regNameLb.Text = model.regName;
            this.lastMoney.Text = model.lastMoney.ToString("F2");
            this.ficit.Text = model.zhuceMoney.ToString("F2");
            this.jiaoyiLb.Text = model.cfMoney.ToString("F2");
            model = null;
        }
    }

    protected void ToSave_Click(object sender, EventArgs e)
    {
        string text = this.unLb.Text;
        string bankNum = this.buLb.Text.Trim();
        string realName = this.realtx.Text.Trim();
        string phone = this.phtx.Text.Trim();
        string address = this.addtx.Text.Trim();
        string zip = this.zipTx.Text.Trim();
        string pid = this.pidTx.Text.Trim();
        string qqNum = this.qqNumTx.Text.Trim();
        string bankName = this.baLb.Text.Trim();
        string bankAddr = this.bankAddrTx.Text.Trim();
        string niCheng = this.niChengTx.Text.Trim();
        if (new UserDataManager().UpdateData(text, address, phone, bankNum, niCheng, realName, pid, zip, qqNum, bankName, bankAddr) == 1)
        {
            this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('修改成功');window.location.href='" + base.Request.RawUrl + "';", true);
        }
        else
        {
            this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('操作失败，请重试');", true);
        }
        this.GetData();
    }
}