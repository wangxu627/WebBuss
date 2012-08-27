<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>WQ.Edit - 插入表格</title>
    <style type="text/css">
        table
        {
            font-size: 12px;
            color: #333333;
            border: solid 1px #A0B2C3;
            margin: 4px;
        }
        input, select
        {
            font-size: 12px;
            font-family: Tahoma;
            color: #333333;
            width: 80px;
        }
        div
        {
            text-align: center;
        }
    </style>

    <script language="javascript" type="text/javascript">
        function InsertTable() {
            _text = "<table";
            _border = document.f1.tborder;
            _width = document.f1.twidth;
            _height = document.f1.theight;
            _class = document.f1.tclass;
            _padding = document.f1.tpadding;
            _spacing = document.f1.tspacing;
            _col = document.f1.tcol;
            _row = document.f1.trow;
            _valign = document.f1.tvalign;
            _halign = document.f1.thalign;
            v_td = "";
            if (_valign.value != "") {
                v_td = " align=\"" + _valign.value + "\"";
            }
            h_td = "";
            if (_halign.value != "") {
                h_td = " valign=\"" + _halign.value + "\"";
            }
            _text += " border=\"" + _border.value + "\" cellpadding=\"" + _padding.value + "\" cellspacing=\"" + _spacing.value + "\" width=\"" + _width.value + "\" height=\"" + _height.value + "\"";
            if (_class.value != "") {
                _text += " class=\"" + _class.value + "\"";
            }
            _text += ">";
            for (m = 0; m < _row.value; m++) {
                _text += "<tr>";
                for (n = 0; n < _col.value; n++) {
                    _text += "<td" + v_td + h_td + ">&nbsp;&nbsp;</td>";
                }
                _text += "</tr>";
            }
            _text += "</table>";
            parent.WQeditInsertHTML(_text);
        }
    </script>

</head>
<body>
    <form name="f1" action="#">
    <div>
        <table border="0" cellpadding="0" cellspacing="4">
            <tr>
                <td>
                    宽度
                </td>
                <td>
                    <input type="text" name="twidth" value="500" />
                </td>
                <td>
                    高度
                </td>
                <td>
                    <input type="text" name="theight" value="200" />
                </td>
            </tr>
            <tr>
                <td>
                    边距
                </td>
                <td>
                    <input type="text" name="tpadding" value="0" />
                </td>
                <td>
                    间距
                </td>
                <td>
                    <input type="text" name="tspacing" value="0" />
                </td>
            </tr>
            <tr>
                <td>
                    边框
                </td>
                <td>
                    <input type="text" name="tborder" value="1" />
                </td>
                <td>
                    样式
                </td>
                <td>
                    <input type="text" name="tclass" value="" />
                </td>
            </tr>
        </table>
        <table border="0" cellpadding="0" cellspacing="4">
            <tr>
                <td>
                    例数
                </td>
                <td>
                    <input name="tcol" value="3" />
                </td>
                <td>
                    行数
                </td>
                <td>
                    <input name="trow" value="3" />
                </td>
            </tr>
            <tr>
                <td>
                    垂直
                </td>
                <td>
                    <select name="tvalign">
                        <option>默认</option>
                        <option value="top">顶端对齐</option>
                        <option value="middle">垂直居中</option>
                        <option value="bottom">底端对齐</option>
                    </select>
                </td>
                <td>
                    水平
                </td>
                <td>
                    <select name="thalign">
                        <option>默认</option>
                        <option value="left">左对齐</option>
                        <option value="center">居中对齐</option>
                        <option value="right">右对齐</option>
                        <option value="justify">两端对齐</option>
                    </select>
                </td>
            </tr>
        </table>
        <div>
            <input type="button" value="插入" onclick="InsertTable()" />
            <input type="reset" value="取消" onclick="parent.WQeditInsertClosed()" />
        </div>
    </div>
    </form>
</body>
</html>

