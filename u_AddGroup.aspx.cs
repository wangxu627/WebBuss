using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yuenanGupiao.Model;
using yuenanGupiao.Bll;

public partial class u_AddGroup : System.Web.UI.Page
{
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
            this.userName = this.Session["userName"].ToString();
            this.GetData();
        }
    }

    private void GetNewGroup(string manaNum)
    {
        ManaData model = new ManaDataManager().GetModel(manaNum);
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
                switch (i)
                {
                    case 1:
                        this.oneGroupMoneyInput.Value = new GroupSysManager().GetModel(i).regMoney.ToString("F2");
                        this.oneGroupNameInput.Value = Mark.GetGroupName(i);
                        break;

                    case 2:
                        this.twoGroupMoneyInput.Value = new GroupSysManager().GetModel(i).regMoney.ToString("F2");
                        this.twoGroupNameInput.Value = Mark.GetGroupName(i);
                        break;

                    case 3:
                        this.thrGroupMoneyInput.Value = new GroupSysManager().GetModel(i).regMoney.ToString("F2");
                        this.thrGroupNameInput.Value = Mark.GetGroupName(i);
                        break;

                    case 4:
                        this.forGroupMoneyInput.Value = new GroupSysManager().GetModel(i).regMoney.ToString("F2");
                        this.forGroupNameInput.Value = Mark.GetGroupName(i);
                        break;
                }
                this.DropDownList1.Items.Add(new ListItem(Mark.GetGroupName(i), i.ToString()));
            }
            this.addUserBtn.Enabled = true;
        }
    }

    protected void GetData()
    {
        UserData model = new UserDataManager().GetModel(this.userName);
        this.addUserBtn.Enabled = true;
        if ((model == null) || !model.isSenhe)
        {
            this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('请退出重新登录后再操作');", true);
        }
        else
        {
            List<ManaData> list = new ManaDataManager().GetList(model.userName);
            this.DropDownList2.Items.Clear();
            foreach (ManaData data2 in list)
            {
                this.DropDownList2.Items.Add(new ListItem(data2.manaNum, data2.manaNum));
            }
            this.ficitLb.Text = model.zhuceMoney.ToString("F2");
            this.lastMoneyLb.Text = model.lastMoney.ToString("F2");
            this.GetNewGroup(list[0].manaNum);
            if (model.isKou == 0)
            {
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('您是空单，不能升级');", true);
                this.addUserBtn.Enabled = false;
            }
        }
    }

    protected void addUserBtn_Click(object sender, EventArgs e)
    {
        int newGroup = Convert.ToInt32(this.DropDownList1.SelectedValue);
        switch (new UserDataManager().AddGroupMothodByMoney(this.DropDownList2.SelectedValue, newGroup))
        {
            case 2:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('升级成功');window.location.href='" + base.Request.RawUrl + "'", true);
                break;

            case 3:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('请退出重新登录后再操作');", true);
                break;

            case 4:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('升级级别不高于原级别，无法升级');", true);
                break;

            case 5:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('可用电子币不足');", true);
                break;

            case 6:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('只有实单可以使用实单升级');", true);
                break;

            default:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('数据库访问失败');", true);
                break;
        }
        this.GetData();
    }


    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.GetNewGroup(this.DropDownList2.SelectedValue);
    }

    public string userName
    {
        get
        {
            if (this.ViewState["userName"] == null)
            {
                return "";
            }
            return this.ViewState["userName"].ToString();
        }
        set
        {
            this.ViewState["userName"] = value;
        }
    }
}