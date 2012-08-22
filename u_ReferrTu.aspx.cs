using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yuenanGupiao.Bll;
using yuenanGupiao.Model;

public partial class u_ReferrTu : System.Web.UI.Page
{
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
            base.Response.Write("<script type='text/javascript'>window.location.href='index.aspx';</script>");
        }
        else if (this.Session["twoLogin"] == null)
        {
            this.Session["PostBack"] = "u_ReferrTu.aspx";
            base.Response.Write("<script type='text/javascript'>window.location.replace('TwoLogin.aspx');</script>");
        }
        else if (!base.IsPostBack)
        {
            this.userName = this.Session["userName"].ToString();
            if (new UserDataManager().GetModel(this.userName) != null)
            {
                this.TopBind(this.userName);
            }
        }

    }

    protected void ReferrTree_SelectedNodeChanged(object sender, EventArgs e)
    {
        TreeNode selectedNode = ((TreeView)sender).SelectedNode;
        this.TopBind(selectedNode.Value);
    }

    private void TopBind(string topName)
    {
        this.ReferrTree.Nodes.Clear();
        UserData model = new UserDataManager().GetModel(topName);
        TreeNode child = null;
        if (model.userName.ToLower() == this.userName.ToLower())
        {
            child = new TreeNode("<img src='" + Mark.GetImgSrc(model.groupId) + "'/>&nbsp;" + model.userName + "&nbsp;[" + model.niCheng + "]", this.userName);
        }
        else
        {
            child = new TreeNode("<img src='" + Mark.GetImgSrc(model.groupId) + "'/>&nbsp;" + model.userName + "&nbsp;[" + model.niCheng + "]", model.refName);
        }
        if (this.ReferrTree.SelectedNode == null)
        {
            this.ReferrTree.Nodes.Add(child);
        }
        this.bindChid(topName, child, 1);
        this.ReferrTree.DataBind();
    }

    private void bindChid(string uName, TreeNode parentNode, int refCells)
    {
        foreach (UserData data in new UserDataManager().GetListByReferr(uName, 1))
        {
            TreeNode child = new TreeNode("<img src='" + Mark.GetImgSrc(data.groupId) + "'/>&nbsp;" + data.userName + "&nbsp;[" + data.niCheng + "]", data.userName);
            parentNode.ChildNodes.Add(child);
            if (refCells < 6)
            {
                this.bindChid(data.userName, child, refCells + 1);
            }
        }
    }
}