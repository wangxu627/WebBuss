using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Drawing.Imaging;

public partial class yanzhengma : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string checkCode = this.GenerateCheckCode(6);
        this.Session["CheckCode"] = checkCode;
        this.CreateCheckCodeImage(checkCode);

    }

    private string GenerateCheckCode(int codecount)
    {
        string str = string.Empty;
        Random random = new Random();
        for (int i = 0; i < 4; i++)
        {
            int num = random.Next();
            str = str + ((char)(0x30 + ((ushort)(num % 10)))).ToString();
        }
        this.Session["CheckCode"] = str;
        return str;
    }

    private void CreateCheckCodeImage(string checkCode)
    {
        if ((checkCode != null) && (checkCode.Trim() != string.Empty))
        {
            Bitmap image = new Bitmap((int)Math.Ceiling((double)(checkCode.Length * 11.5)), 20);
            Graphics graphics = Graphics.FromImage(image);
            try
            {
                new Random();
                graphics.Clear(Color.White);
                Font font = new Font("Arial", 13f, FontStyle.Bold);
                LinearGradientBrush brush = new LinearGradientBrush(new Rectangle(0, 0, image.Width, image.Height), Color.Black, Color.DarkRed, 1.2f, true);
                graphics.DrawString(checkCode, font, brush, (float)2f, (float)2f);
                graphics.DrawRectangle(new Pen(Color.Silver), 0, 0, image.Width - 1, image.Height - 1);
                MemoryStream stream = new MemoryStream();
                image.Save(stream, ImageFormat.Gif);
                base.Response.ClearContent();
                base.Response.ContentType = "image/Gif";
                base.Response.BinaryWrite(stream.ToArray());
            }
            finally
            {
                graphics.Dispose();
                image.Dispose();
            }
        }
    }
}