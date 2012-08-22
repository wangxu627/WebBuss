using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_Top : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (base.Session["userName"] == null)
        {
            base.Response.Write("<script type='text/javascript'>window.location.href='index.aspx';</script>");
        }
    }

    protected void toOutLg_Click(object sender, EventArgs e)
    {
        base.Session["twoLogin"] = null;
        base.Session["userName"] = null;
        base.Response.Write("<script type='text/javascript'>alert('您已经安全退出！');window.location.href='index.aspx';</script>");
    }

 

}