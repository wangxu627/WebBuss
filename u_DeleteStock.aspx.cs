using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yuenanGupiao.Bll;

public partial class u_DeleteStock : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = 0;
        try
        {
            id = Convert.ToInt32(base.Request.QueryString["id"]);
        }
        catch
        {
            id = 0;
        }
        switch (new StockLogManager().DelModel(id))
        {
            case 1:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('订单撤销成功');window.location.href='u_StockPayMark.aspx'", true);
                return;

            case 2:
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "window.location.href='u_StockPayMark.aspx'", true);
                return;
        }
        this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('您选择的订单无法撤销');window.location.href='u_StockPayMark.aspx'", true);
    }
}