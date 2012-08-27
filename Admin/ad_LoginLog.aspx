<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ad_LoginLog.aspx.cs" Inherits="Admin_ad_LoginLog" %>

<%@ Register src="admin_Top.ascx" tagname="admin_Top" tagprefix="uc1" %>
<%@ Register src="admin_Left.ascx" tagname="admin_Left" tagprefix="uc2" %>
<%@ Register src="admin_Bottom.ascx" tagname="admin_Bottom" tagprefix="uc3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>在线人员统计</title>
    <link rel="Stylesheet" type="text/css" href="Css/Main.css" />
    <style type="text/css" >
        .gv1
        {
            width:100%;
            margin-top:20px;
			line-height:22px;
        }
        .aduaDiv
        {
            width:90%;
         
            margin-top:30px;
            margin-left:30px;
            padding-left:15px;
            font-size:13px;
            vertical-align:bottom;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="top">
    
        <uc1:admin_Top ID="admin_Top1" runat="server" />
    
    </div>
    
    <div id="main">
        <div id="left">
            <uc2:admin_Left ID="admin_Left1" runat="server" />
        </div>
        
        <div id="right">
               <div class="k">在线人员统计</div> 
               
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                CssClass="gv1" onrowdatabound="GridView1_RowDataBound">
                <Columns>
                    <asp:BoundField HeaderText="用户姓名" >
                        <ItemStyle BorderColor="#D3CDD0" BorderStyle="Solid" BorderWidth="1px" 
                              HorizontalAlign="Center" VerticalAlign="Middle"/>
                    </asp:BoundField>
                    <asp:BoundField HeaderText="会员编号" >
                        <ItemStyle BorderColor="#D3CDD0" BorderStyle="Solid" BorderWidth="1px" 
                              HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="推荐人" >
                        <ItemStyle BorderColor="#D3CDD0" BorderStyle="Solid" BorderWidth="1px" 
                              HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="会员级别" >
                        <ItemStyle BorderColor="#D3CDD0" BorderStyle="Solid" BorderWidth="1px" 
                              HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="入单时间" >
                        <ItemStyle BorderColor="#D3CDD0" BorderStyle="Solid" BorderWidth="1px" 
                              HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="联系电话" >
                        <ItemStyle BorderColor="#D3CDD0" BorderStyle="Solid" BorderWidth="1px" 
                              HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="登录IP" >
                        <ItemStyle BorderColor="#D3CDD0" BorderStyle="Solid" BorderWidth="1px" 
                              HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="登录时间" >
                        <ItemStyle BorderColor="#D3CDD0" BorderStyle="Solid" BorderWidth="1px" 
                              HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            <div id="pagediv" runat="server" style="text-align:center; margin-top:10px">
                        共有<asp:Label runat="server" ID="AllPagelb"></asp:Label>页&nbsp;&nbsp;<asp:LinkButton 
                        ID="BackBt" runat="server" onclick="left_Click" CausesValidation="False">上一页</asp:LinkButton> &nbsp;&nbsp;<asp:LinkButton 
                        runat="server" ID="FromBt" onclick="Right_Click" CausesValidation="False">下一页</asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;当前第<asp:Label runat="server" ID="NowPagelb"></asp:Label>页&nbsp;&nbsp;转到第<asp:TextBox runat="server" ID="pagetx"  Width="40px"></asp:TextBox>页<asp:Button 
                        ID="Gobt" runat="server" Text="Go"
                        CausesValidation="False" UseSubmitBehavior="False" onclick="Gobt_Click" 
                      style="height: 26px" /> 共有<asp:Label ID="allnumlb" runat="server"></asp:Label>条记录，当前显示第
                      <asp:Label ID="nownumlb" runat="server"></asp:Label>条
          </div>
      </div>
    </div>
    
    <div id="bottom">
    
        <uc3:admin_Bottom ID="admin_Bottom1" runat="server" />
    
    </div>
    </form>
</body>
</html>

