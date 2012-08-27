using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class WQInsertPast : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        base.Response.Cache.SetNoStore();
        if (base.Request.Cookies["WQeditCookie"] == null)
        {
            base.Response.Write("Null");
            base.Response.End();
        }
        else if (base.Request.Cookies["WQeditCookie"].Value.ToString() != "WQedit")
        {
            base.Response.End();
        }
        string str = "";
        string str2 = "";
        this.SelectPath.Value = base.Server.MapPath("~/").ToString();
        if (base.Request.QueryString["dir"] != null)
        {
            str = base.Request.QueryString["dir"].ToString();
        }
        string path = base.Server.MapPath("upfile");
        if (str != "")
        {
            path = str;
        }
        if (base.Request.QueryString["action"] != null)
        {
            str2 = base.Request.QueryString["action"].ToString();
        }
        if (str2 == "Add")
        {
            string str4 = "";
            if (base.Request.QueryString["addPath"] != null)
            {
                str4 = base.Request.QueryString["addPath"].ToString();
                if (Directory.Exists(str4))
                {
                    base.Response.Write("<script>alert(\"该文件夹已存在\");window.history.back();</script>");
                    base.Response.End();
                }
                else
                {
                    DirectoryInfo info = new DirectoryInfo(str4);
                    info.Create();
                    path = info.Parent.FullName.ToString();
                }
            }
        }
        else if (str2 == "Ren")
        {
            string newValue = "";
            string str6 = "";
            if (base.Request.QueryString["renPath"] != null)
            {
                str6 = base.Request.QueryString["renPath"].ToString();
            }
            if (base.Request.QueryString["newname"] != null)
            {
                newValue = base.Request.QueryString["newname"].ToString();
            }
            if ((newValue != "") && (str6 != ""))
            {
                if (str6.IndexOf(".") == -1)
                {
                    DirectoryInfo info2 = new DirectoryInfo(str6);
                    if (info2.Exists)
                    {
                        info2.MoveTo(str6.Replace(info2.Name.ToString(), newValue));
                        path = info2.Parent.FullName.ToString();
                    }
                }
                else
                {
                    FileInfo info3 = new FileInfo(str6);
                    if (info3.Exists)
                    {
                        string str7 = info3.Extension.ToString();
                        info3.MoveTo(str6.Replace(info3.Name.ToString(), newValue + str7));
                        path = info3.Directory.FullName.ToString();
                    }
                }
            }
        }
        else if (str2 == "Del")
        {
            string str8 = "";
            if (base.Request.QueryString["delPath"] != null)
            {
                str8 = base.Request.QueryString["delPath"].ToString();
                if (str8.IndexOf(".") == -1)
                {
                    DirectoryInfo info4 = new DirectoryInfo(str8);
                    if (info4.Exists)
                    {
                        info4.Delete(true);
                        path = info4.Parent.FullName.ToString();
                    }
                    else
                    {
                        FileInfo info5 = new FileInfo(str8);
                        if (info5.Exists)
                        {
                            info5.Delete();
                            path = info5.Directory.FullName.ToString();
                        }
                    }
                }
                else
                {
                    FileInfo info6 = new FileInfo(str8);
                    if (info6.Exists)
                    {
                        info6.Delete();
                        path = info6.Directory.FullName.ToString();
                    }
                }
            }
        }
        else if (str2 == "fico")
        {
            string str9 = "";
            if (base.Request.QueryString["refPath"] != null)
            {
                if (base.Request.Cookies["faceIco"] == null)
                {
                    HttpCookie cookie = new HttpCookie("faceIco")
                    {
                        Value = "ok"
                    };
                    base.Response.AppendCookie(cookie);
                }
                else
                {
                    base.Response.Cookies["faceIco"].Expires = DateTime.Now.AddDays(-1.0);
                }
                str9 = base.Request.QueryString["refPath"].ToString();
                if (Directory.Exists(str9))
                {
                    path = str9;
                }
            }
        }
        if (this.ftp.HasFile)
        {
            string str10 = this.RootPath.Value.ToString() + @"\" + this.ftp.FileName.ToString();
            if (File.Exists(str10))
            {
                base.Response.Write("<script>alert(\"服务器上已存在该文件\");window.history.back();</script>");
            }
            else
            {
                this.ftp.SaveAs(str10);
                base.Response.Redirect("WQ.InsertPast.aspx?Dir=" + this.RootPath.Value.ToString());
            }
        }
        DirectoryInfo fileDirectory = new DirectoryInfo(path);
        this.FileList.InnerHtml = this.getFileList(fileDirectory);
    }

    private string getIco(string extname)
    {
        if (extname == null)
        {
            return "";
        }
        switch (extname)
        {
            case ".gif":
                return "imagegif.gif";

            case ".jpg":
                return "imagejpg.gif";

            case ".png":
                return "image.gif";

            case ".bmp":
                return "mspaint.gif";

            case ".rar":
            case ".zip":
                return "Winrar.gif";

            case ".mp3":
            case ".rm":
            case ".wma":
            case ".wmv":
                return "wmplayer.gif";

            case ".txt":
                return "NotePad.gif";

            case ".doc":
            case ".docx":
                return "doc.gif";

            case ".xls":
            case ".xlsx":
                return "xls.gif";

            case ".mdb":
            case ".mdbx":
                return "mdb.gif";

            case ".ppt":
            case ".pptx":
                return "ppt.gif";

            case ".aspx":
            case ".ascx":
            case ".asax":
                return "imageaspx.gif";

            case ".dll":
                return "imagedll.gif";

            case ".xml":
            case "xaml":
                return "msxml.gif";

            case ".config":
                return "config.gif";

            case ".html":
            case ".htm":
            case ".shtml":
                return "IExplore.gif";

            case ".js":
                return "imagejs.gif";

            case ".swf":
                return "imageswf.gif";
        }
        return "filecs.gif";
    }

    private string getFileList(DirectoryInfo FileDirectory)
    {
        string str = "";
        if (FileDirectory.Exists)
        {
            this.RootPath.Value = FileDirectory.FullName.ToString();
            this.ParentPath.Value = FileDirectory.Parent.FullName.ToString();
            DirectoryInfo[] directories = FileDirectory.GetDirectories();
            FileInfo[] files = FileDirectory.GetFiles();
            foreach (DirectoryInfo info in directories)
            {
                string str6 = str;
                str = str6 + "<label title=\"" + info.FullName.ToString() + "\" onclick=\"selectFile(this)\" ondblclick=\"openFile(this)\"><img src=\"editimage/ico/Folder.gif\"><br />" + info.Name.ToString() + "</label>";
            }
            foreach (FileInfo info2 in files)
            {
                string str2 = "<img src=\"editimage/ico/" + this.getIco(info2.Extension.ToString().ToLower()) + "\" />";
                if (base.Request.Cookies["faceIco"] != null)
                {
                    switch (info2.Extension.ToString().ToLower())
                    {
                        case ".gif":
                        case ".jpg":
                        case ".png":
                        case ".bmp":
                            {
                                string oldValue = base.Server.MapPath("~/").ToString();
                                string str5 = info2.FullName.Replace(oldValue, "").Replace(@"\", "/");
                                str2 = "<img src=\"" + str5 + "\" style=\"width:60px;height:40px\" />";
                                break;
                            }
                    }
                }
                string str7 = str;
                str = str7 + "<label title=\"" + info2.FullName.ToString() + "\" onClick=\"selectFile(this)\" ondblclick=\"openFile(this)\">" + str2 + "<br />" + info2.Name.ToString() + "</label>";
            }
        }
        return str;
    }
}