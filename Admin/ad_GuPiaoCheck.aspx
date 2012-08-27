<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ad_GuPiaoCheck.aspx.cs" Inherits="Admin_ad_GuPiaoCheck" %>

<%@ Register src="admin_Left.ascx" tagname="admin_Left" tagprefix="uc1" %>
<%@ Register src="admin_Top.ascx" tagname="admin_Top" tagprefix="uc2" %>
<%@ Register src="admin_Bottom.ascx" tagname="admin_Bottom" tagprefix="uc3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<link rel="Stylesheet" type="text/css" href="Css/Main.css" />
    <title>股票记录</title>
    <style type="text/css" >
        .adtxgv1
        {
            width:99%;
            margin-top:15px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="top">
    
        <uc2:admin_Top ID="admin_Top1" runat="server" />
    
    </div>
    
    <div id="main">
        <div id="left">
        
            <uc1:admin_Left ID="admin_Left1" runat="server" />
        
        </div>
        
        <div id="right">
            <div class="k">股票记录</div>
            <div style="margin-top:10px; margin-left:4%">
                账号/时间:&nbsp;&nbsp;<asp:TextBox ID="untx" runat="server" MaxLength="50"  Width="100px"></asp:TextBox>
                &nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" Text="查看全部" ToolTip="0" onclick="Button1_Click" />&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Text="按日期查找" ToolTip="2" onclick="Button1_Click" />&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button3" runat="server" Text="按账号查找" ToolTip="1" onclick="Button1_Click" />                
            </div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                CssClass="adtxgv1" onrowdatabound="GridView1_RowDataBound">
                <Columns>
                    <asp:BoundField HeaderText="卖出账号" >
                        <ItemStyle   HorizontalAlign="Center" VerticalAlign="Middle" />
                        <HeaderStyle Height="30px" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="买入账号" >
                        <ItemStyle   HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="每股单价" >
                        <ItemStyle   HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="交易股数" >
                        <ItemStyle   HorizontalAlign="Center" VerticalAlign="Middle"  />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="本次金额" >
                        <ItemStyle   HorizontalAlign="Center" VerticalAlign="Middle"  />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="解冻时间" >
                        <ItemStyle   HorizontalAlign="Center" VerticalAlign="Middle"  />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="操作时间" >
                        <ItemStyle   HorizontalAlign="Center" VerticalAlign="Middle"/>
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            <div id="pagediv" runat="server" style="text-align:center; margin-top:10px; margin-bottom:10px">
                    共有<asp:Label runat="server" ID="AllPagelb"></asp:Label>页&nbsp;&nbsp;<asp:LinkButton 
                    ID="BackBt" runat="server" onclick="left_Click" CausesValidation="False">上一页</asp:LinkButton> &nbsp;&nbsp;<asp:LinkButton 
                    runat="server" ID="FromBt" onclick="Right_Click" CausesValidation="False">下一页</asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;当前第<asp:Label runat="server" ID="NowPagelb"></asp:Label>页&nbsp;&nbsp;转到第<asp:TextBox runat="server" ID="pagetx"  Width="40px"></asp:TextBox>页<asp:Button 
                    ID="Gobt" runat="server" Text="Go"
                    CausesValidation="False" UseSubmitBehavior="False" onclick="Gobt_Click" 
                  style="height: 26px" /> 共有<asp:Label ID="allnumlb" runat="server"></asp:Label>条记录，当前显示第
                  <asp:Label ID="nownumlb" runat="server"></asp:Label>条
           </div>
            <label id="zongJiLb" runat="server" style="line-height:23px; text-align:center"></label><br />
             <asp:LinkButton  ID="LinkButton4" runat="server" onclick="LinkButton4_Click">导出Excel</asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;
           <input type="button" name="Submit4" value="打印帐单" onclick="javascript:window.print()"/> &nbsp;&nbsp;&nbsp;&nbsp;
      </div>
    </div>
    
    <div id="bottom">
    
        <uc3:admin_Bottom ID="admin_Bottom1" runat="server" />
    
    </div>
    </form>
</body>
</html>

