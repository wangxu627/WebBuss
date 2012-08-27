<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WQ.InsertPast.aspx.cs" Inherits="WQInsertPast" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>WQ.Edit - 插入服务器附件</title>
    <style type="text/css">
        body
        {
            font-size: 12px;
            font-family: Tahoma;
            margin: 0px;
            padding: 0px;
        }
        table
        {
            width: 100%;
            height: 100%;
        }
        table .Menu
        {
            height: 41px;
            background: url("editimage/ico/menu_bg.gif") repeat-x;
        }
        table .BtnTD
        {
            clear: both;
            background: url("editimage/ico/menu_bg.gif") repeat-x;
            padding: 8px;
        }
        table .Menu a
        {
            display: block;
            width: auto;
            height: auto;
            float: left;
            padding: 4px;
            text-decoration: none;
            border: 0px;
            color: #333333;
            margin: 2px;
        }
        table .Menu a:hover
        {
            background-color: #FAFCFC;
        }
        table .Menu img
        {
            border: 0px;
            vertical-align: middle;
            margin: 2px;
        }
        table .FileContent
        {
            height: 350px;
            width: 100%;
            background-color: #FFFFFF;
        }
        div.FileList
        {
            width: 100%;
            height: 100%;
            background-color: #FFFFFF;
            overflow: auto;
        }
        input
        {
            font-size: 12px;
            font-family: Tahoma;
        }
        .fileBtn
        {
            padding: 5px;
            width: 300px;
        }
        .ftpBtn
        {
            padding: 2px;
        }
        label
        {
            display: block;
            width: 70px;
            height: 60px;
            padding: 6px;
            margin: 4px;
            float: left;
            text-align: center;
            border: solid 1px #FFFFFF;
            white-space: nowrap;
            overflow: hidden;
        }
        .moveLabel
        {
            border: solid 1px #E6E6E6;
            background-color: #F8F8F8;
        }
        .outLabel
        {
            border: solid 1px #FFFFFF;
            background-color: #FFFFFF;
        }
    </style>
    <script language="javascript" type="text/javascript">
        var selectFileObj = false;
        var openFileObj = false;
        function selectFile(_obj) {
            if (selectFileObj != false) {
                selectFileObj.className = "outLabel";
            }
            selectFileObj = _obj;
            selectFileObj.className = "moveLabel";
        }

        function openFile(_obj) {
            var turl = _obj.title.split("\\");
            if (turl[turl.length - 1].indexOf(".") == -1) {
                this.location = "WQ.InsertPast.aspx?Dir=" + escape(_obj.title);
            }
            else {
                _rooturl = document.getElementById("SelectPath").value;
                _fileUrl = _obj.title.replace(_rooturl, "");
                _fileUrl = _fileUrl.replace("\\", "/");
                parent.WQeditInsertHTML(_fileUrl)
            }
        }

        function PathBack() {
            _path = document.getElementById("ParentPath");
            if (_path.value.indexOf("upfile") == -1) {
                alert("为了安全，不可以返回根目录");
                return;
            }
            else {
                document.location = "WQ.InsertPast.aspx?Dir=" + _path.value;
            }
        }

        function AddField() {
            filedDate = new Date();
            _tempname = filedDate.getFullYear().toString() + filedDate.getMonth().toString() + filedDate.getDate().toString() + filedDate.getHours().toString() + filedDate.getMinutes().toString() + filedDate.getSeconds().toString();
            _name = window.prompt("请输入文件夹的名称", _tempname);
            if (_name != "" && _name != null) {
                _path = document.getElementById("RootPath").value + "\\" + escape(_name);
                document.location = "WQ.InsertPast.aspx?action=Add&addPath=" + _path;
            }
        }

        function RenFile() {
            if (selectFileObj != false) {
                _tempname = window.prompt("请输入新的名称", "");
                if (_tempname != "" && _tempname != null) {
                    _renurl = "WQ.InsertPast.aspx?action=Ren&newname=" + escape(_tempname) + "&renPath=" + escape(selectFileObj.title);
                    document.location = _renurl;
                }
            }
        }

        function DeleteFile() {
            if (selectFileObj != false) {
                if (window.confirm("确定要删除?") == true) {
                    _delurl = "WQ.InsertPast.aspx?action=Del&delPath=" + escape(selectFileObj.title);
                    document.location = _delurl;
                }
            }
        }

        function windowRefresh() {
            document.location = "WQ.InsertPast.aspx?Dir=" + escape(document.getElementById("RootPath").value);
        }

        function icoFace() {
            document.location = "WQ.InsertPast.aspx?action=fico&refPath=" + escape(document.getElementById("RootPath").value);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField ID="RootPath" runat="server" />
    <asp:HiddenField ID="SelectPath" runat="server" />
    <asp:HiddenField ID="ParentPath" runat="server" />
    <div>
        <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="Menu">
                    <a href="JavaScript:PathBack()">
                        <img src="editimage/ico/back.gif" alt="返回" />返回</a> <a href="JavaScript:AddField()">
                            <img src="editimage/ico/addfile.gif" alt="创新文件夹" />文件夹</a> <a href="JavaScript:RenFile()">
                                <img src="editimage/ico/edit.gif" alt="重命名" />重命名</a> <a href="JavaScript:DeleteFile()"
                                    id="BtnDelete">
                                    <img src="editimage/ico/delete.gif" alt="删除" />删除</a> <a href="JavaScript:windowRefresh()"
                                        id="A1">
                                        <img src="editimage/ico/Refresh.gif" alt="刷新" />刷新</a> <a href="JavaScript:icoFace()"
                                            id="BtnFace">
                                            <img src="editimage/ico/faceico.gif" alt="缩略图" />缩略图</a>
                </td>
            </tr>
            <tr>
                <td class="FileContent">
                    <div class="FileList" id="FileList" runat="server">
                    </div>
                </td>
            </tr>
            <tr>
                <td class="BtnTD">
                    <asp:FileUpload ID="ftp" runat="server" CssClass="fileBtn" />
                    <asp:Button runat="server" Text="上传文件" ID="ftpBtn" CssClass="ftpBtn" />
                    <input type="button" onclick="parent.WQeditInsertClosed()" value="关闭" class="ftpBtn" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
