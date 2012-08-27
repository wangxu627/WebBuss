using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using yuenanGupiao.Bll;

public partial class Admin_ad_AddUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Session["adminName"] == null)
        {
            base.Response.Write("<script type='text/javascript'>alert('您没有登陆或者登陆已超时');window.location.href='index.aspx';</script>");
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
            if (new UserDataManager().GetModel(userName) != null)
            {
                this.topTx.Value = userName;
            }
            this.RadioButtonList1.SelectedValue = num.ToString();
        }
    }

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
        int isKou = 0;
        password = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "MD5");
        str4 = FormsAuthentication.HashPasswordForStoringInConfigFile(str4, "MD5");
        switch (new UserDataManager().AddModel(userName, password, str4, address, pid, phone, selectedValue, bankNum, realName, refName, bankAddr, zip, qqNum, niCheng, topName, isLeft, groupId, "king", isKou))
        {
            case 0:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('数据库繁忙，请重试');", true);
                return;

            case 1:
                this.untx.Value = "";
                this.untx.Focus();
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('注册成功');window.location.href='ad_UserAllMark.aspx';", true);
                return;

            case 2:
                this.untx.Value = "";
                this.untx.Focus();
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
        }
        this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('数据库繁忙，请重试');", true);
    }

 

 

}