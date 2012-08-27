using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using yuenanGupiao.Bll;
using yuenanGupiao.Model;

public partial class Admin_ad_GroupSys : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Session["AdminName"] == null)
        {
            base.Response.Write("<script type='text/javascript'>alert('您还没有登陆或者已经登陆超时');window.location.replace('index.aspx');</script>");
        }
        else if (!base.IsPostBack)
        {
            this.DataShow();
        }
    }

    private void DataShow()
    {
        GroupSys model = new GroupSysManager().GetModel(1);
        this.regMoneyTx1.Text = model.regMoney.ToString("F2");
        this.regCountTx1.Text = model.regCount.ToString("G");
        this.gpMoneyTx1.Text = model.gpMoney.ToString("F2");
        this.noMoneyTx1.Text = model.noMoney.ToString("F2");
        this.noMonthTx1.Text = model.noMonth.ToString("G");
        this.dayTopTx1.Text = model.dayTop.ToString("F2");
        this.refPicTx1.Text = model.refPic.ToString("G");
        this.pengMoneyTx1.Text = model.pengMoney.ToString("F2");
        this.refCellsTx1.Text = model.refCells.ToString("G");
        model = new GroupSysManager().GetModel(2);
        this.regMoneyTx2.Text = model.regMoney.ToString("F2");
        this.regCountTx2.Text = model.regCount.ToString("G");
        this.gpMoneyTx2.Text = model.gpMoney.ToString("F2");
        this.noMoneyTx2.Text = model.noMoney.ToString("F2");
        this.noMonthTx2.Text = model.noMonth.ToString("G");
        this.dayTopTx2.Text = model.dayTop.ToString("F2");
        this.refPicTx2.Text = model.refPic.ToString("G");
        this.pengMoneyTx2.Text = model.pengMoney.ToString("F2");
        this.refCellsTx2.Text = model.refCells.ToString("G");
        model = new GroupSysManager().GetModel(3);
        this.regMoneyTx3.Text = model.regMoney.ToString("F2");
        this.regCountTx3.Text = model.regCount.ToString("G");
        this.gpMoneyTx3.Text = model.gpMoney.ToString("F2");
        this.noMoneyTx3.Text = model.noMoney.ToString("F2");
        this.noMonthTx3.Text = model.noMonth.ToString("G");
        this.dayTopTx3.Text = model.dayTop.ToString("F2");
        this.refPicTx3.Text = model.refPic.ToString("G");
        this.pengMoneyTx3.Text = model.pengMoney.ToString("F2");
        this.refCellsTx3.Text = model.refCells.ToString("G");
        model = new GroupSysManager().GetModel(4);
        this.regMoneyTx4.Text = model.regMoney.ToString("F2");
        this.regCountTx4.Text = model.regCount.ToString("G");
        this.gpMoneyTx4.Text = model.gpMoney.ToString("F2");
        this.noMoneyTx4.Text = model.noMoney.ToString("F2");
        this.noMonthTx4.Text = model.noMonth.ToString("G");
        this.dayTopTx4.Text = model.dayTop.ToString("F2");
        this.refPicTx4.Text = model.refPic.ToString("G");
        this.pengMoneyTx4.Text = model.pengMoney.ToString("F2");
        this.refCellsTx4.Text = model.refCells.ToString("G");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        decimal regMoney = 0M;
        decimal num2 = 0M;
        decimal num3 = 0M;
        decimal num4 = 0M;
        int regCount = 0;
        int num6 = 0;
        int num7 = 0;
        int num8 = 0;
        decimal gpMoney = 0M;
        decimal num10 = 0M;
        decimal num11 = 0M;
        decimal num12 = 0M;
        decimal noMoney = 0M;
        decimal num14 = 0M;
        decimal num15 = 0M;
        decimal num16 = 0M;
        int noMonth = 0;
        int num18 = 0;
        int num19 = 0;
        int num20 = 0;
        decimal dayTop = 0M;
        decimal num22 = 0M;
        decimal num23 = 0M;
        decimal num24 = 0M;
        int refPic = 0;
        int num26 = 0;
        int num27 = 0;
        int num28 = 0;
        decimal pengMoney = 0M;
        decimal num30 = 0M;
        decimal num31 = 0M;
        decimal num32 = 0M;
        int refCells = 0;
        int num34 = 0;
        int num35 = 0;
        int num36 = 0;
        try
        {
            regMoney = Convert.ToDecimal(this.regMoneyTx1.Text.Trim());
            num2 = Convert.ToDecimal(this.regMoneyTx2.Text.Trim());
            num3 = Convert.ToDecimal(this.regMoneyTx3.Text.Trim());
            num4 = Convert.ToDecimal(this.regMoneyTx4.Text.Trim());
        }
        catch
        {
            regMoney = -1M;
        }
        if (((regMoney <= 0M) || (num2 == 0M)) || ((num3 == 0M) || (num4 == 0M)))
        {
            this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('注册金额必须为大于0的金额');", true);
        }
        else
        {
            try
            {
                regCount = Convert.ToInt32(this.regCountTx1.Text.Trim());
                num6 = Convert.ToInt32(this.regCountTx2.Text.Trim());
                num7 = Convert.ToInt32(this.regCountTx3.Text.Trim());
                num8 = Convert.ToInt32(this.regCountTx4.Text.Trim());
            }
            catch
            {
                regCount = -1;
            }
            if (((regCount <= 0) || (num6 <= 0)) || ((num7 <= 0) || (regCount <= 0)))
            {
                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('注册单数必须为大于0的整数');", true);
            }
            else
            {
                try
                {
                    gpMoney = Convert.ToDecimal(this.gpMoneyTx1.Text.Trim());
                    num10 = Convert.ToDecimal(this.gpMoneyTx2.Text.Trim());
                    num11 = Convert.ToDecimal(this.gpMoneyTx3.Text.Trim());
                    num12 = Convert.ToDecimal(this.gpMoneyTx4.Text.Trim());
                }
                catch
                {
                    gpMoney = -1M;
                }
                if (((gpMoney < 0M) || (num10 < 0M)) || ((num11 < 0M) || (num12 < 0M)))
                {
                    this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('配送股金为大于0的数字');", true);
                }
                else
                {
                    try
                    {
                        noMoney = Convert.ToDecimal(this.noMoneyTx1.Text.Trim());
                        num14 = Convert.ToDecimal(this.noMoneyTx2.Text.Trim());
                        num15 = Convert.ToDecimal(this.noMoneyTx3.Text.Trim());
                        num16 = Convert.ToDecimal(this.noMoneyTx4.Text.Trim());
                    }
                    catch
                    {
                        noMoney = -1M;
                    }
                    if (((noMoney < 0M) || (num14 < 0M)) || ((num15 < 0M) || (num16 < 0M)))
                    {
                        this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('内部股必须为大于0的金额');", true);
                    }
                    else
                    {
                        try
                        {
                            noMonth = Convert.ToInt32(this.noMonthTx1.Text.Trim());
                            num18 = Convert.ToInt32(this.noMonthTx2.Text.Trim());
                            num19 = Convert.ToInt32(this.noMonthTx3.Text.Trim());
                            num20 = Convert.ToInt32(this.noMonthTx4.Text.Trim());
                        }
                        catch
                        {
                            noMonth = -1;
                        }
                        if (((noMonth < 0) || (num18 < 0)) || ((num19 < 0) || (num20 < 0)))
                        {
                            this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('冻结日期必须为大于0的整数');", true);
                        }
                        else
                        {
                            try
                            {
                                dayTop = Convert.ToDecimal(this.dayTopTx1.Text.Trim());
                                num22 = Convert.ToDecimal(this.dayTopTx2.Text.Trim());
                                num23 = Convert.ToDecimal(this.dayTopTx3.Text.Trim());
                                num24 = Convert.ToDecimal(this.dayTopTx4.Text.Trim());
                            }
                            catch
                            {
                                dayTop = -1M;
                            }
                            if (((dayTop < 0M) || (num22 < 0M)) || ((num23 < 0M) || (num24 < 0M)))
                            {
                                this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('日封顶必须为大于0的金额');", true);
                            }
                            else
                            {
                                try
                                {
                                    refPic = Convert.ToInt32(this.refPicTx1.Text.Trim());
                                    num26 = Convert.ToInt32(this.refPicTx2.Text.Trim());
                                    num27 = Convert.ToInt32(this.refPicTx3.Text.Trim());
                                    num28 = Convert.ToInt32(this.refPicTx4.Text.Trim());
                                }
                                catch
                                {
                                    refPic = -1;
                                }
                                if (((refPic < 0) || (num26 < 0)) || ((num27 < 0) || (num28 < 0)))
                                {
                                    this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('推荐比例必须为大于0的整数');", true);
                                }
                                else
                                {
                                    try
                                    {
                                        pengMoney = Convert.ToDecimal(this.pengMoneyTx1.Text.Trim());
                                        num30 = Convert.ToDecimal(this.pengMoneyTx2.Text.Trim());
                                        num31 = Convert.ToDecimal(this.pengMoneyTx3.Text.Trim());
                                        num32 = Convert.ToDecimal(this.pengMoneyTx4.Text.Trim());
                                    }
                                    catch
                                    {
                                        pengMoney = -1M;
                                    }
                                    if (((pengMoney < 0M) || (num30 < 0M)) || ((num31 < 0M) || (num32 < 0M)))
                                    {
                                        this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('市场推广奖金额为大于0的金额');", true);
                                    }
                                    else
                                    {
                                        try
                                        {
                                            refCells = Convert.ToInt32(this.refCellsTx1.Text.Trim());
                                            num34 = Convert.ToInt32(this.refCellsTx2.Text.Trim());
                                            num35 = Convert.ToInt32(this.refCellsTx3.Text.Trim());
                                            num36 = Convert.ToInt32(this.refCellsTx4.Text.Trim());
                                        }
                                        catch
                                        {
                                            refCells = -1;
                                        }
                                        if (((refCells <= 0) || (num34 <= 0)) || ((num35 <= 0) || (num36 <= 0)))
                                        {
                                            this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('销售管理奖必须为大于0的整数');", true);
                                        }
                                        else
                                        {
                                            new GroupSysManager().UpdateGroup(1, regMoney, regCount, 1, gpMoney, noMoney, noMonth, dayTop, refPic, pengMoney, refCells, 0M);
                                            new GroupSysManager().UpdateGroup(2, num2, num6, 1, num10, num14, num18, num22, num26, num30, num34, 0M);
                                            new GroupSysManager().UpdateGroup(3, num3, num7, 1, num11, num15, num19, num23, num27, num31, num35, 0M);
                                            new GroupSysManager().UpdateGroup(4, num4, num8, 1, num12, num16, num20, num24, num28, num32, num36, 0M);
                                            new GroupSysManager().UpdateGroup(5, num4 * 3M, num8, 3, num12 * 3M, num16 * 3M, num20, num24, num28, num32, num36, num4 * 3M);
                                            new GroupSysManager().UpdateGroup(6, num4 * 5M, num8, 5, num12 * 5M, num16 * 5M, num20, num24, num28, num32, num36, num4 * 5M);
                                            new GroupSysManager().UpdateGroup(7, num4 * 7M, num8, 7, num12 * 7M, num16 * 7M, num20, num24, num28, num32, num36, num4 * 7M);
                                            new GroupSysManager().UpdateGroup(8, num4 * 15M, num8, 15, num12 * 15M, num16 * 15M, num20, num24, num28, num32, num36, num4 * 15M);
                                            this.Page.ClientScript.RegisterStartupScript(base.GetType(), "", "alert('等级设置保存成功');", true);
                                            this.DataShow();
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

 

 


 

}