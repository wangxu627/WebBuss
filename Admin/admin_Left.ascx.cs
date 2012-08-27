using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yuenanGupiao.Bll;
using yuenanGupiao.Model;
using System.IO;
using System.Text;

public partial class Admin_admin_Left : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime time = Helper.NowDay();
        DateTime lastTime = new SysSetManager().GetModel().lastTime;
        if (time >= lastTime)
        {
            new SysSetManager().UpdateTime(lastTime.AddDays(1.0));
            new StockPayLogManager().SetAllOk();
            decimal countByTime = new StockPayLogManager().GetCountByTime(lastTime.AddDays(-1.0), lastTime);
            decimal singMoney = new StockPayLogManager().GetSingMoney(lastTime.AddDays(-1.0), lastTime);
            FileStream stream = new FileStream(base.Server.MapPath("~/payStock/data.txt"), FileMode.Append, FileAccess.Write, FileShare.None, 0x1000, true);
            string s = string.Concat(new object[] { "\r\n\r\n", lastTime.Year, "-", lastTime.Month.ToString("D2"), "-", lastTime.Day.ToString("D2"), ";", countByTime.ToString("F0"), ";", singMoney.ToString("F2"), ";" });
            byte[] bytes = Encoding.ASCII.GetBytes(s);
            stream.Write(bytes, 0, bytes.Length);
            stream.Flush();
            stream.Close();
            stream.Dispose();
        }
    }

    protected void outLg_Click(object sender, EventArgs e)
    {
        base.Session["adminName"] = null;
        base.Response.Write("<script type='text/javascript'>alert('您已经安全退出');window.location.href='index.aspx';</script>");
    }

 

}