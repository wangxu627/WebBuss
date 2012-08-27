<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ad_GongGao.aspx.cs" Inherits="Admin_ad_GongGao" %>

<%@ Register src="admin_Bottom.ascx" tagname="admin_Bottom" tagprefix="uc1" %>
<%@ Register src="admin_Left.ascx" tagname="admin_Left" tagprefix="uc2" %>
<%@ Register src="admin_Top.ascx" tagname="admin_Top" tagprefix="uc3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>公告列表</title>
    <link rel="Stylesheet" type="text/css" href="Css/Main.css" />
     <style type="text/css" >
        .gv1
        {
            width:96%;
            margin-left:2%;
            margin-top:20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="top">
    
        <uc3:admin_Top ID="admin_Top1" runat="server" />
    
    </div>
    
    <div id="main">
        <div id="left">
        
            <uc2:admin_Left ID="admin_Left1" runat="server" />
        
        </div>
        
        <div id="right">
              <div class="k">公告列表</div>
              <asp:GridView ID="GridView1" runat="server" Width="90%" CssClass="gv1"
                            AutoGenerateColumns="False"  onrowdatabound="GridView1_RowDataBound">
                            <Columns>
                                <asp:BoundField HeaderText="公告标题">
                                    <HeaderStyle   />
                                    <ItemStyle   HorizontalAlign="Center" VerticalAlign="Middle" 
                                        Width="40%" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="公告时间">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"  Width="30%"/>
                                </asp:BoundField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="ToSee" runat="server" CausesValidation="False">查看</asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"/>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="ToDel" runat="server" CausesValidation="False" 
                                            onclick="ToDel_Click">删除</asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"/>
                                </asp:TemplateField>
                            </Columns>
          </asp:GridView>
               <div id="pagediv" runat="server" style="text-align:center; margin-top:10px">
                        共有<asp:Label runat="server" ID="AllPagelb"></asp:Label>页&nbsp;&nbsp;<asp:LinkButton 
                        ID="BackBt" runat="server" onclick="left_Click" CausesValidation="False">上一页</asp:LinkButton> &nbsp;&nbsp;<asp:LinkButton 
                        runat="server" ID="FromBt" onclick="Right_Click" CausesValidation="False">下一页</asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;当前第<asp:Label runat="server" ID="NowPagelb"></asp:Label>页&nbsp;&nbsp;转到第<asp:TextBox   runat="server" ID="pagetx"  Width="40px"></asp:TextBox>页<asp:Button 
                        ID="Gobt" runat="server" Text="Go"
                        CausesValidation="False" UseSubmitBehavior="False" onclick="Gobt_Click" 
                      style="height: 26px" /> 共有<asp:Label ID="allnumlb" runat="server"></asp:Label>条记录，当前显示第
                      <asp:Label ID="nownumlb" runat="server"></asp:Label>条
               </div>
      </div>
    </div>
    
    <div id="bottom">
    
        <uc1:admin_Bottom ID="admin_Bottom1" runat="server" />
    
    </div>
    </form>
</body>
</html>

