using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yuenanGupiao.Bll;
using yuenanGupiao.Model;
using System.Web.Security;

public partial class Admin_ad_SetUserData : System.Web.UI.Page
{
    private int Id
    {
        get
        {
            if (this.ViewState["Id"] != null)
            {
                return Convert.ToInt32(this.ViewState["Id"]);
            }
            return 0;
        }
        set
        {
            this.ViewState["Id"] = value;
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
            try
            {
                this.Id = Convert.ToInt32(base.Request.QueryString["id"]);
            }
            catch
            {
                this.Id = -1;
            }
            if ((this.Id <= 0) || (new UserDataManager().GetModel(this.Id) == null))
            {
                base.Response.Write("<script type='text/javascript'>alert('非法访问');window.location.href='ad_UserAllMark.aspx';</script>");
            }
            else
            {
                this.GetData();
            }
        }
    }

    private void GetData()
    {
        UserData model = new UserDataManager().GetModel(this.Id);
        this.unLb.Text = model.userName;
        this.rfLb.Text = model.refName;
        this.realtx.Text = model.realName;
        this.baLb.Text = model.bankName;
        this.buLb.Text = model.bankNum;
        this.phtx.Text = model.phone;
        this.topLb.Text = model.fenGroup.ToString("F2");
        this.pidTx.Text = model.pid;
        this.bankAddrTx.Text = model.bankAddr;
        this.qqNumTx.Text = model.qqNum;
        this.addtx.Text = model.address;
        this.zipTx.Text = model.zip;
        this.niChengTx.Text = model.niCheng;
        this.topNameLb.Text = new ManaDataManager().GetModel(model.userName).topName;
        this.groupLb.Text = Mark.GetGroupName(model.groupId);
        this.regNameLb.Text = model.regName;
        this.lastMoney.Text = model.lastMoney.ToString("F2");
        this.ficit.Text = model.zhuceMoney.ToString("F2");
        this.jiaoyiLb.Text = model.cfMoney.ToString("F2");
        this.gupiaoLb.Text = model.guPiao.ToString();
        model = null;
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

    protected void Button1_Click(object sender, EventArgs e)
    {
        string pwd = FormsAuthentication.HashPasswordForStoringInConfigFile(this.pwdtx1.Text.Trim(), "MD5");
        int num = new UserDataManager().ResetPwd(this.unLb.Text, pwd);
        if (new UserDataManager().ResetTwoPwd(this.unLb.Text, pwd) == 0)
        {
            this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('密码修改成功');window.location.href='" + base.Request.RawUrl + "';", true);
        }
    }

 

 

}