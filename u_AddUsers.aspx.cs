using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yuenanGupiao.Bll;
using yuenanGupiao.Model;
using System.Web.Security;

public partial class u_AddUsers : System.Web.UI.Page
{
    public string regName
    {
        get
        {
            if (this.ViewState["regName"] == null)
            {
                return "";
            }
            return this.ViewState["regName"].ToString();
        }
        set
        {
            this.ViewState["regName"] = value;
        }
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
 
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Session["userName"] == null)
        {
            base.Response.Write("<script type='text/javascript'>window.location.href='index.aspx';</script>");
        }
        else if (this.Session["twoLogin"] == null)
        {
            this.Session["PostBack"] = base.Request.RawUrl;
            base.Response.Write("<script type='text/javascript'>window.location.replace('TwoLogin.aspx');</script>");
        }
        else if (!base.IsPostBack)
        {
            string userName = "";
            int num = 0;
            try
            {
                userName = Convert.ToString(base.Request.QueryString["tn"]);
                num = Convert.ToInt32(base.Request.QueryString["il"]);
            }
            catch
            {
                userName = "";
                num = 0;
            }
            this.regName = this.Session["userName"].ToString();
            UserData model = new UserDataManager().GetModel(this.regName);
            Random random = new Random();
            int num2 = random.Next(0x186a1, 0xf423f);
            while (new UserDataManager().GetModel("cn" + num2.ToString()) != null)
            {
                num2 = random.Next(0x186a1, 0xf423f);
            }
            this.untx.Value = "cn" + num2.ToString();
            this.rntx.Value = model.userName;
            if (new UserDataManager().GetModel(userName) != null)
            {
                this.topTx.Value = userName;
            }
            this.RadioButtonList1.SelectedValue = num.ToString();
        }
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void addUserBtn_Click(object sender, EventArgs e)
    {
        string bankAddr = this.bankAddr.Value.Trim();
        string userName = this.untx.Value.Trim();
        string password = this.pstx1.Value.Trim();
        string str4 = this.pstx3.Value.Trim();
        string refName = this.rntx.Value.Trim();
        string selectedValue = this.DropDownList2.SelectedValue;
        string bankNum = this.butx.Value.Trim();
        string realName = this.realtx.Value.Trim();
        string phone = this.phtx.Value.Trim();
        string address = this.addtx.Value.Trim();
        string zip = this.zipTx.Value.Trim();
        string pid = this.pidTx.Value.Trim();
        string qqNum = this.qqNumTx.Value.Trim();
        string niCheng = this.niChengTx.Value.Trim();
        int groupId = Convert.ToInt32(this.DropDownList1.SelectedValue);
        int isLeft = Convert.ToInt32(this.RadioButtonList1.SelectedValue);
        string topName = this.topTx.Value.Trim();
        password = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "MD5");
        str4 = FormsAuthentication.HashPasswordForStoringInConfigFile(str4, "MD5");
        int num3 = new UserDataManager().AddModel(userName, password, str4, address, pid, phone, selectedValue, bankNum, realName, refName, bankAddr, zip, qqNum, niCheng, topName, isLeft, groupId, this.regName, 1);
        Random random = new Random();
        int num4 = random.Next(0x186a1, 0xf423f);
        while (new UserDataManager().GetModel("cn" + num4.ToString()) != null)
        {
            num4 = random.Next(0x186a1, 0xf423f);
        }
        switch (num3)
        {
            case 0:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('数据库繁忙，请重试');", true);
                return;

            case 1:
                this.untx.Value = "cn" + num4.ToString();
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('注册成功');window.location.href='u_dailiMark.aspx';", true);
                return;

            case 2:
                this.untx.Value = "cn" + num4.ToString();
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('账号已存在');", true);
                return;

            case 3:
                this.rntx.Value = "";
                this.rntx.Focus();
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('推荐人不存在');", true);
                return;

            case 5:
                this.topTx.Value = "";
                this.topTx.Focus();
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('安置人不可用');", true);
                return;

            case 6:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('所选分区已满');", true);
                return;

            case 7:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('注册失败，请退出重新登录');", true);
                return;
        }
        this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('数据库繁忙，请重试');", true);
    }
}