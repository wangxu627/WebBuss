using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yuenanGupiao.Model;
using yuenanGupiao.Bll;

public partial class Admin_ad_AddGroup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Session["adminName"] == null)
        {
            base.Response.Write("<script type='text/javascript'>alert('您没有登陆或者登陆已超时');window.location.href='index.aspx';</script>");
        }
    }

    protected void addUserBtn_Click(object sender, EventArgs e)
    {
        string manaNum = this.untx.Value.Trim();
        int newGroup = Convert.ToInt32(this.DropDownList1.SelectedValue);
        switch (new UserDataManager().AddGroupMothodByMoney(manaNum, newGroup))
        {
            case 2:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('升级成功');window.location.href='" + base.Request.RawUrl + "'", true);
                return;

            case 3:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('账号不存在或未审核');", true);
                return;

            case 4:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('升级级别不高于原级别，无法升级');", true);
                return;

            case 5:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('可用电子币不足');", true);
                return;

            case 6:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('只有实单可以使用实单升级');", true);
                return;
        }
        this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('数据库访问失败');", true);
    }

    protected void addUserBtn0_Click(object sender, EventArgs e)
    {
        string manaNum = this.untx.Value.Trim();
        int newGroup = Convert.ToInt32(this.DropDownList1.SelectedValue);
        switch (new UserDataManager().AddGroupMothod(manaNum, newGroup))
        {
            case 2:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('升级成功');window.location.href='" + base.Request.RawUrl + "'", true);
                return;

            case 3:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('账号不存在或未审核');", true);
                return;

            case 4:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('升级级别不高于原级别，无法升级');", true);
                return;
        }
        this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('数据库访问失败');", true);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string manaNum = this.untx.Value.Trim();
        ManaData model = new ManaDataManager().GetModel(manaNum);
        if ((model == null) || !model.isSenhe)
        {
            this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('点位不存在或未审核');", true);
        }
        else
        {
            this.groupLb.Text = Mark.GetGroupName(model.groupId);
            this.DropDownList1.Items.Clear();
            if (model.groupId == 4)
            {
                this.DropDownList1.Items.Add(new ListItem(Mark.GetGroupName(4), "4"));
                this.addUserBtn.Enabled = false;
            }
            else
            {
                for (int i = model.groupId + 1; i <= 4; i++)
                {
                    this.DropDownList1.Items.Add(new ListItem(Mark.GetGroupName(i), i.ToString()));
                }
                this.addUserBtn.Enabled = true;
            }
        }
    }
}