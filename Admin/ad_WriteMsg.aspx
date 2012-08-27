<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ad_WriteMsg.aspx.cs" Inherits="Admin_ad_WriteMsg" %>

<%@ Register src="admin_Bottom.ascx" tagname="admin_Bottom" tagprefix="uc1" %>
<%@ Register src="admin_Top.ascx" tagname="admin_Top" tagprefix="uc2" %>
<%@ Register src="admin_Left.ascx" tagname="admin_Left" tagprefix="uc3" %>

<%@ Register assembly="WQeditor" namespace="WQeditControl" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>写邮件</title>
    <link rel="Stylesheet" type="text/css" href="Css/Main.css" />
    <style type="text/css">
        .wmtb1
        {
            width: 80%;
            margin-left:30px;
            margin-top:50px;
        }
        .wmtd1
        {
            width:15%;
            text-align:center;
            line-height:20px;
        }
    </style>
    <script type="text/javascript" >
        function keyDown() {
            if (event.keyCode == 13) {
                document.getElementById("AddMsgIbt").focus();
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="top">
    
        <uc2:admin_Top ID="admin_Top1" runat="server" />
    
    </div>
    
    <div id="main">
        <div id="left">
        
            <uc3:admin_Left ID="admin_Left1" runat="server" />
        
        </div>
        
        <div id="right">
           <div class="k">发送邮件</div>
           <table class="wmtb1">
                <tr>
                    <td class="wmtd1">
                        邮件标题:
                    </td>
                    <td align="left">
                        <asp:TextBox   ID="tltx" runat="server" Width="190px" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="wmvc1" runat="server" ControlToValidate="tltx" 
                            Display="Dynamic" ErrorMessage="邮件标题不能为空" BorderStyle="Solid" 
                            BorderWidth="1px"></asp:RequiredFieldValidator>
                  </td>
                </tr>
                <tr>
                    <td class="wmtd1">
                        收件人账号:</td>
                    <td align="left">
                        <asp:TextBox   ID="untx" runat="server" Width="100px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="wmvc2" runat="server" 
                            ControlToValidate="untx" Display="Dynamic" ErrorMessage="收信人不能为空" 
                            BorderStyle="Solid" BorderWidth="1px"></asp:RequiredFieldValidator>
                  </td>
                </tr>
                <tr>
                    <td class="wmtd1">
                        正文
                    </td>
                    <td align="left">
                       
                        <cc1:WQeditor ID="WQeditor1" runat="server">
                        </cc1:WQeditor>
                    </td>
                </tr>
                <tr>
                    <td class="wmtd1">
                        发送邮件:
                    </td>
                    <td align="left">
                        <asp:ImageButton ID="AddMsgIbt" runat="server"  ImageUrl="~/images/btn_add.gif" 
                            AlternateText="添加" onclick="AddMsgIbt_Click" />                  </td>
                </tr>
          </table>
      </div>


    </div>
    
    <div id="bottom">
    
        <uc1:admin_Bottom ID="admin_Bottom1" runat="server" />
    
    </div>
    </form>
</body>
</html>
