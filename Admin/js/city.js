
var g_selProvince;
var g_selCity;
var Provinces=new Array(
new Array("110000","北京市"),
new Array("120000","天津市"),
new Array("130000","河北省"),
new Array("140000","山西省"),
new Array("150000","内蒙古自治区"),
new Array("210000","辽宁省"),
new Array("220000","吉林省"),
new Array("230000","黑龙江省"),
new Array("310000","上海市"),
new Array("320000","江苏省"),
new Array("330000","浙江省"),
new Array("340000","安徽省"),
new Array("350000","福建省"),
new Array("360000","江西省"),
new Array("370000","山东省"),
new Array("410000","河南省"),
new Array("420000","湖北省"),
new Array("430000","湖南省"),
new Array("440000","广东省"),
new Array("450000","广西壮族自治区"),
new Array("460000","海南省"),
new Array("500000","重庆市"),
new Array("510000","四川省"),
new Array("520000","贵州省"),
new Array("530000","云南省"),
new Array("540000","西藏自治区"),
new Array("610000","陕西省"),
new Array("620000","甘肃省"),
new Array("630000","青海省"),
new Array("640000","宁夏回族自治区"),
new Array("650000","新疆维吾尔自治区"),
new Array("710000","台湾省"),
new Array("810000","香港特别行政区"),
new Array("820000","澳门特别行政区")
);

var Citys=new Array(
new Array("110100","北京"),
new Array("120100","天津"),
new Array("130101","石家庄"),
new Array("130201","唐山"),
new Array("130301","秦皇岛"),
new Array("130701","张家口"),
new Array("130801","承德"),
new Array("131001","廊坊"),
new Array("130401","邯郸"),
new Array("130501","邢台"),
new Array("130601","保定"),
new Array("130901","沧州"),
new Array("133001","衡水"),
new Array("140101","太原"),
new Array("140201","大同"),
new Array("140301","阳泉"),
new Array("140501","晋城"),
new Array("140601","朔州"),
new Array("142201","忻州"),
new Array("142331","离石"),
new Array("142401","榆次"),
new Array("142601","临汾"),
new Array("142701","运城"),
new Array("140401","长治"),
new Array("150101","呼和浩特"),
new Array("150201","包头"),
new Array("150301","乌海"),
new Array("152601","集宁"),
new Array("152701","东胜"),
new Array("152801","临河"),
new Array("152921","阿拉善左旗"),
new Array("150401","赤峰"),
new Array("152301","通辽"),
new Array("152502","锡林浩特"),
new Array("152101","海拉尔"),
new Array("152201","乌兰浩特"),
new Array("210101","沈阳"),
new Array("210201","大连"),
new Array("210301","鞍山"),
new Array("210401","抚顺"),
new Array("210501","本溪"),
new Array("210701","锦州"),
new Array("210801","营口"),
new Array("210901","阜新"),
new Array("211101","盘锦"),
new Array("211201","铁岭"),
new Array("211301","朝阳"),
new Array("211401","锦西"),
new Array("210601","丹东"),
new Array("220101","长春"),
new Array("220201","吉林"),
new Array("220301","四平"),
new Array("220401","辽源"),
new Array("220601","浑江"),
new Array("222301","白城"),
new Array("222401","延吉"),
new Array("220501","通化"),
new Array("230101","哈尔滨"),
new Array("230301","鸡西"),
new Array("230401","鹤岗"),
new Array("230501","双鸭山"),
new Array("230701","伊春"),
new Array("230801","佳木斯"),
new Array("230901","七台河"),
new Array("231001","牡丹江"),
new Array("232301","绥化"),
new Array("230201","齐齐哈尔"),
new Array("230601","大庆"),
new Array("232601","黑河"),
new Array("232700","加格达奇"),
new Array("310100","上海"),
new Array("320101","南京"),
new Array("320201","无锡"),
new Array("320301","徐州"),
new Array("320401","常州"),
new Array("320501","苏州"),
new Array("320600","南通"),
new Array("320701","连云港"),
new Array("320801","淮阴"),
new Array("320901","盐城"),
new Array("321001","扬州"),
new Array("321101","镇江"),
new Array("330101","杭州"),
new Array("330201","宁波"),
new Array("330301","温州"),
new Array("330401","嘉兴"),
new Array("330501","湖州"),
new Array("330601","绍兴"),
new Array("330701","金华"),
new Array("330801","衢州"),
new Array("330901","舟山"),
new Array("332501","丽水"),
new Array("332602","临海"),
new Array("340101","合肥"),
new Array("340201","芜湖"),
new Array("340301","蚌埠"),
new Array("340401","淮南"),
new Array("340501","马鞍山"),
new Array("340601","淮北"),
new Array("340701","铜陵"),
new Array("340801","安庆"),
new Array("341001","黄山"),
new Array("342101","阜阳"),
new Array("342201","宿州"),
new Array("342301","滁州"),
new Array("342401","六安"),
new Array("342501","宣州"),
new Array("342601","巢湖"),
new Array("342901","贵池"),
new Array("350101","福州"),
new Array("350201","厦门"),
new Array("350301","莆田"),
new Array("350401","三明"),
new Array("350501","泉州"),
new Array("350601","漳州"),
new Array("352101","南平"),
new Array("352201","宁德"),
new Array("352601","龙岩"),
new Array("360101","南昌"),
new Array("360201","景德镇"),
new Array("362101","赣州"),
new Array("360301","萍乡"),
new Array("360401","九江"),
new Array("360501","新余"),
new Array("360601","鹰潭"),
new Array("362201","宜春"),
new Array("362301","上饶"),
new Array("362401","吉安"),
new Array("362502","临川"),
new Array("370101","济南"),
new Array("370201","青岛"),
new Array("370301","淄博"),
new Array("370401","枣庄"),
new Array("370501","东营"),
new Array("370601","烟台"),
new Array("370701","潍坊"),
new Array("370801","济宁"),
new Array("370901","泰安"),
new Array("371001","威海"),
new Array("371100","日照"),
new Array("372301","滨州"),
new Array("372401","德州"),
new Array("372501","聊城"),
new Array("372801","临沂"),
new Array("372901","菏泽"),
new Array("410101","郑州"),
new Array("410201","开封"),
new Array("410301","洛阳"),
new Array("410401","平顶山"),
new Array("410501","安阳"),
new Array("410601","鹤壁"),
new Array("410701","新乡"),
new Array("410801","焦作"),
new Array("410901","濮阳"),
new Array("411001","许昌"),
new Array("411101","漯河"),
new Array("411201","三门峡"),
new Array("412301","商丘"),
new Array("412701","周口"),
new Array("412801","驻马店"),
new Array("412901","南阳"),
new Array("413001","信阳"),
new Array("420101","武汉"),
new Array("420201","黄石"),
new Array("420301","十堰"),
new Array("420400","沙市"),
new Array("420501","宜昌"),
new Array("420601","襄樊"),
new Array("420701","鄂州"),
new Array("420801","荆门"),
new Array("422103","黄州"),
new Array("422201","孝感"),
new Array("422301","咸宁"),
new Array("422421","江陵"),
new Array("422801","恩施"),
new Array("430101","长沙"),
new Array("430401","衡阳"),
new Array("430501","邵阳"),
new Array("432801","郴州"),
new Array("432901","永州"),
new Array("430801","大庸"),
new Array("433001","怀化"),
new Array("433101","吉首"),
new Array("430201","株洲"),
new Array("430301","湘潭"),
new Array("430601","岳阳"),
new Array("430701","常德"),
new Array("432301","益阳"),
new Array("432501","娄底"),
new Array("440101","广州"),
new Array("440301","深圳"),
new Array("441501","汕尾"),
new Array("441301","惠州"),
new Array("441601","河源"),
new Array("440601","佛山"),
new Array("441801","清远"),
new Array("441901","东莞"),
new Array("440401","珠海"),
new Array("440701","江门"),
new Array("441201","肇庆"),
new Array("442001","中山"),
new Array("440801","湛江"),
new Array("440901","茂名"),
new Array("440201","韶关"),
new Array("440501","汕头"),
new Array("441401","梅州"),
new Array("441701","阳江"),
new Array("450101","南宁"),
new Array("450401","梧州"),
new Array("452501","玉林"),
new Array("450301","桂林"),
new Array("452601","百色"),
new Array("452701","河池"),
new Array("452802","钦州"),
new Array("450201","柳州"),
new Array("450501","北海"),
new Array("460100","海口"),
new Array("460200","三亚"),
new Array("510101","成都"),
new Array("513321","康定"),
new Array("513101","雅安"),
new Array("513229","马尔康"),
new Array("510301","自贡"),
new Array("500100","重庆"),
new Array("512901","南充"),
new Array("510501","泸州"),
new Array("510601","德阳"),
new Array("510701","绵阳"),
new Array("510901","遂宁"),
new Array("511001","内江"),
new Array("511101","乐山"),
new Array("512501","宜宾"),
new Array("510801","广元"),
new Array("513021","达县"),
new Array("513401","西昌"),
new Array("510401","攀枝花"),
new Array("500239","黔江土家族苗族自治县"),
new Array("520101","贵阳"),
new Array("520200","六盘水"),
new Array("522201","铜仁"),
new Array("522501","安顺"),
new Array("522601","凯里"),
new Array("522701","都匀"),
new Array("522301","兴义"),
new Array("522421","毕节"),
new Array("522101","遵义"),
new Array("530101","昆明"),
new Array("530201","东川"),
new Array("532201","曲靖"),
new Array("532301","楚雄"),
new Array("532401","玉溪"),
new Array("532501","个旧"),
new Array("532621","文山"),
new Array("532721","思茅"),
new Array("532101","昭通"),
new Array("532821","景洪"),
new Array("532901","大理"),
new Array("533001","保山"),
new Array("533121","潞西"),
new Array("533221","丽江纳西族自治县"),
new Array("533321","泸水"),
new Array("533421","中甸"),
new Array("533521","临沧"),
new Array("540101","拉萨"),
new Array("542121","昌都"),
new Array("542221","乃东"),
new Array("542301","日喀则"),
new Array("542421","那曲"),
new Array("542523","噶尔"),
new Array("542621","林芝"),
new Array("610101","西安"),
new Array("610201","铜川"),
new Array("610301","宝鸡"),
new Array("610401","咸阳"),
new Array("612101","渭南"),
new Array("612301","汉中"),
new Array("612401","安康"),
new Array("612501","商州"),
new Array("612601","延安"),
new Array("612701","榆林"),
new Array("620101","兰州"),
new Array("620401","白银"),
new Array("620301","金昌"),
new Array("620501","天水"),
new Array("622201","张掖"),
new Array("622301","武威"),
new Array("622421","定西"),
new Array("622624","成县"),
new Array("622701","平凉"),
new Array("622801","西峰"),
new Array("622901","临夏"),
new Array("623027","夏河"),
new Array("620201","嘉峪关"),
new Array("622102","酒泉"),
new Array("630100","西宁"),
new Array("632121","平安"),
new Array("632221","门源回族自治县"),
new Array("632321","同仁"),
new Array("632521","共和"),
new Array("632621","玛沁"),
new Array("632721","玉树"),
new Array("632802","德令哈"),
new Array("640101","银川"),
new Array("640201","石嘴山"),
new Array("642101","吴忠"),
new Array("642221","固原"),
new Array("650101","乌鲁木齐"),
new Array("650201","克拉玛依"),
new Array("652101","吐鲁番"),
new Array("652201","哈密"),
new Array("652301","昌吉"),
new Array("652701","博乐"),
new Array("652801","库尔勒"),
new Array("652901","阿克苏"),
new Array("653001","阿图什"),
new Array("653101","喀什"),
new Array("654101","伊宁"),
new Array("710001","台北"),
new Array("710002","基隆"),
new Array("710020","台南"),
new Array("710019","高雄"),
new Array("710008","台中"),
new Array("211001","辽阳"),
new Array("653201","和田"),
new Array("542200","泽当镇"),
new Array("542600","八一镇"),
new Array("820000","澳门"),
new Array("810000","香港")
);

function FillProvinces(selProvince)
{
    selProvince.options[0]=new Option("请选择","000000");
    for(i=0;i<Provinces.length;i++)
    {
        selProvince.options[i+1]=new Option(Provinces[i][1],Provinces[i][0]);
    }
    selProvince.options[0].selected=true;
    selProvince.length=i+1;
}

function FillCitys(selCity,ProvinceCode)
{
    //if the province is a direct-managed city, like Beijing, shanghai, tianjin, chongqin,hongkong, macro
        //need not "请选择选项"
        if(ProvinceCode=="110000"||ProvinceCode=="120000"||ProvinceCode=="310000"
                 ||ProvinceCode=="810000"||ProvinceCode=="820000"||ProvinceCode=="500000")
             count=0;
        else
                {selCity.options[0]=new Option("请选择",ProvinceCode);
                count=1;}
    for(i=0;i<Citys.length;i++)
    {
        if(Citys[i][0].toString().substring(0,2)==ProvinceCode.substring(0,2))
        {
            selCity.options[count]=new Option(Citys[i][1],Citys[i][0]);
            count=count+1;
        }
    }
    selCity.options[0].selected = true;
    selCity.length=count;
}

function Province_onchange()
{
    FillCitys(g_selCity,g_selProvince.value);
}

function InitCityselect(selProvince, selCity)
{
    //alert("begin");
    g_selProvince=selProvince;
    g_selCity=selCity;
    selProvince.onchange=Function("Province_onchange();");
    FillProvinces(selProvince);
    Province_onchange();
}
function InitCityselect2(selProvince, selCity, CityCode)
{
    InitCityselect(selProvince, selCity)
    for(i=0;i<selProvince.length;i++)
    {
        if(selProvince.options[i].value.substring(0,2)==CityCode.substring(0,2))
        {
            selProvince.options[i].selected = true;
        }
    }
    Province_onchange();
    for(i=0;i<selCity.length;i++)
    {
        if(selCity.options[i].value==CityCode)
        {
            selCity.options[i].selected = true;
        }
    }
}

function setcity() {
    switch (document.form1.prv.value) {
        case "" :
            var cityOptions = new Array("", "");
            break;
        case "安徽" :
            var cityOptions = new Array(
            "合肥", "合肥","安庆", "安庆","蚌埠", "蚌埠","亳州", "亳州","巢湖", "巢湖","滁州", "滁州","阜阳", "阜阳","贵池", "贵池","淮北", "淮北","淮化", "淮化","淮南", "淮南", "黄山", "黄山", "九华山", "九华山", "六安", "六安","马鞍山", "马鞍山","宿州", "宿州","铜陵", "铜陵","屯溪", "屯溪","芜湖", "芜湖", "宣城", "宣城");
             break;
        case "北京" :
            var cityOptions = new Array( 
            "北京", "北京","东城","西城","崇文","宣武","朝阳","丰台","石景山","海淀","门头沟","房山","通州","顺义","昌平","大兴","平谷","怀柔","密云","延庆");
            break;
        case "重庆" :
            var cityOptions = new Array( 
            "重庆", "重庆","万州","涪陵","渝中","大渡口","江北","沙坪坝","九龙坡","南岸","北碚","万盛","双挢","渝北","巴南","黔江","长寿","綦江","潼南","铜梁","大足","荣昌","壁山","梁平","城口","丰都","垫江","武隆","忠县","开县","云阳","奉节","巫山","巫溪","石柱","秀山","酉阳","彭水","江津","合川","永川","南川");
            break;
        case "福建" :
            var cityOptions = new Array( 
            "福州", "福州","福安", "福安","龙岩", "龙岩","南平", "南平","宁德", "宁德","莆田", "莆田","泉州", "泉州","三明", "三明","邵武", "邵武","石狮", "石狮","永安","永安", "武夷山", "武夷山","厦门", "厦门", "漳州", "漳州");
             break;
        case "甘肃" :
            var cityOptions = new Array( 
            "兰州", "兰州",
            "白银", "白银",
            "定西", "定西",
            "敦煌", "敦煌",
            "甘南", "甘南",
            "金昌", "金昌",
            "酒泉", "酒泉",
            "临夏", "临夏",
            "平凉", "平凉",
            "天水", "天水",
            "武都", "武都", 
            "西峰", "西峰", 
            "张掖", "张掖");
            break;
        case "广东" :
            var cityOptions = new Array( 
            "广州", "广州",
            "潮阳", "潮阳",
            "潮州", "潮州",
            "澄海", "澄海",
            "东莞", "东莞",
            "佛山", "佛山",
            "河源", "河源",
            "惠州", "惠州",
            "江门", "江门",
            "揭阳", "揭阳",
            "开平", "开平",
            "茂名", "茂名",
            "梅州", "梅州",
            "清远", "清远",
            "汕头", "汕头",
            "汕尾", "汕尾",
            "韶关", "韶关",
            "深圳", "深圳",
            "顺德", "顺德",
            "阳江", "阳江",
            "阳江", "阳江",
            "英德", "英德",
            "云浮", "云浮",
            "增城", "增城",
            "湛江", "湛江",
            "肇庆", "肇庆", 
            "中山", "中山", 
            "珠海", "珠海");
            break;
        case "广西" :
            var cityOptions = new Array( 
            "南宁", "南宁",
            "百色", "百色",
            "北海", "北海",
            "桂林", "桂林",
            "防城港", "防城港",
            "河池", "河池",
            "柳州", "柳州",
            "钦州", "钦州", 
            "梧州", "梧州", 
            "玉林", "玉林");
            break;
        case "贵州" :
            var cityOptions = new Array( 
            "贵阳", "贵阳",
            "安顺", "安顺",
            "毕节", "毕节",
            "都匀", "都匀",
            "凯里", "凯里",
            "六盘水", "六盘水",
            "铜仁", "铜仁",
            "兴义", "兴义", 
            "玉屏", "玉屏", 
            "遵义", "遵义");
            break;
        case "海南" :
            var cityOptions = new Array( 
            "海口", "海口",
            "儋县", "儋县",
            "陵水", "陵水",
            "琼海", "琼海",
            "三亚", "三亚", 
            "通什", "通什", 
            "万宁", "万宁");
            break;
        case "河北" :
            var cityOptions = new Array( 
            "石家庄", "石家庄",
            "保定", "保定",
            "北戴河", "北戴河",
            "沧州", "沧州",
            "承德", "承德",
            "丰润", "丰润",
            "邯郸", "邯郸",
            "衡水", "衡水",
            "廊坊", "廊坊",
            "南戴河", "南戴河",
            "秦皇岛", "秦皇岛",
            "唐山", "唐山",
            "新城", "新城",
            "邢台", "邢台", 
            "张家口", "张家口");
            break;
        case "黑龙江" :
            var cityOptions = new Array( 
            "哈尔滨", "哈尔滨",
            "北安", "北安",
            "大庆", "大庆",
            "大兴安岭", "大兴安岭",
            "鹤岗", "鹤岗",
            "黑河", "黑河",
            "佳木斯", "佳木斯",
            "鸡西", "鸡西",
            "牡丹江", "牡丹江",
            "齐齐哈尔", "齐齐哈尔",
            "七台河", "七台河",
            "双鸭山", "双鸭山",
            "绥化", "绥化",
            "伊春", "伊春");
            break;
        case "河南" :
            var cityOptions = new Array( 
            "郑州", "郑州",
            "安阳", "安阳",
            "鹤壁", "鹤壁",
            "潢川", "潢川",
            "焦作", "焦作",
            "开封", "开封",
            "漯河", "漯河",
            "洛阳", "洛阳",
            "南阳", "南阳",
            "平顶山", "平顶山",
            "濮阳", "濮阳",
            "三门峡", "三门峡",
            "商丘", "商丘",
            "新乡", "新乡",
            "信阳", "信阳",
            "许昌", "许昌",
            "周口", "周口", 
            "驻马店", "驻马店");
            break;
        case "香港" :
            var cityOptions = new Array( 
            "香港", "香港", 
            "九龙", "九龙");
            break;
        case "湖北" : 
            var cityOptions = new Array( 
            "武汉", "武汉",
            "恩施", "恩施",
            "鄂州", "鄂州",
            "黄岗", "黄岗",
            "黄石", "黄石",
            "荆门", "荆门",
            "荆州", "荆州",
            "潜江", "潜江",
            "十堰", "十堰",
            "随州", "随州",
            "武穴", "武穴",
            "仙桃", "仙桃",
            "咸宁", "咸宁",
            "襄阳", "襄阳",
            "襄樊", "襄樊",
            "孝感", "孝感",
            "宜昌", "宜昌");
            break;
        case "湖南" :
            var cityOptions = new Array( 
            "长沙", "长沙",
            "常德", "常德",
            "郴州", "郴州",
            "衡阳", "衡阳",
            "怀化", "怀化",
            "吉首", "吉首",
            "娄底", "娄底",
            "邵阳", "邵阳",
            "湘潭", "湘潭",
            "益阳", "益阳",
            "岳阳", "岳阳",
            "永州", "永州",
            "张家界", "张家界",
            "株洲", "株洲");
            break;
        case "江苏" :
            var cityOptions = new Array( 
            "南京", "南京",
            "常熟", "常熟",
            "常州", "常州",
            "海门", "海门",
            "淮安", "淮安",
            "江都", "江都",
            "江阴", "江阴",
            "昆山", "昆山",
            "连云港", "连云港",
            "南通", "南通",
            "启东", "启东",
            "沭阳", "沭阳",
            "苏州", "苏州",
            "太仓", "太仓",
            "泰州", "泰州",
            "同里", "同里",
            "无锡", "无锡",
            "徐州", "徐州",
            "盐城", "盐城",
            "扬州", "扬州",
            "宜兴", "宜兴",
            "仪征", "仪征",
            "张家港", "张家港", 
            "镇江", "镇江", 
            "周庄", "周庄");
            break;
        case "江西" :
            var cityOptions = new Array(
            "南昌", "南昌",
            "抚州", "抚州",
            "赣州", "赣州",
            "吉安", "吉安",
            "景德镇", "景德镇",
            "井冈山", "井冈山",
            "九江", "九江",
            "庐山", "庐山",
            "萍乡", "萍乡",
            "上饶", "上饶",
            "新余", "新余", 
            "宜春", "宜春", 
            "鹰潭", "鹰潭");
            break;
        case "吉林" :
            var cityOptions = new Array( 
            "长春", "长春",
            "白城", "白城",
            "白山", "白山",
            "珲春", "珲春",
            "辽源", "辽源",
            "梅河", "梅河",
            "吉林", "吉林",
            "四平", "四平",
            "松原", "松原",
            "通化", "通化",
            "延吉", "延吉");
            break;
        case "辽宁" :
            var cityOptions = new Array( 
            "沈阳", "沈阳",
            "鞍山", "鞍山",
            "本溪", "本溪",
            "朝阳", "朝阳",
            "大连", "大连",
            "丹东", "丹东",
            "抚顺", "抚顺",
            "阜新", "阜新",
            "葫芦岛", "葫芦岛",
            "锦州", "锦州",
            "辽阳", "辽阳",
            "盘锦", "盘锦",
            "铁岭", "铁岭",
            "营口", "营口");
            break;
        case "澳门" :
            var cityOptions = new Array( 
            "澳门", "澳门");
            break;
        case "内蒙古" :
            var cityOptions = new Array( 
            "呼和浩特", "呼和浩特",
            "阿拉善盟", "阿拉善盟",
            "包头", "包头",
            "赤峰", "赤峰",
            "东胜", "东胜",
            "海拉尔", "海拉尔",
            "集宁", "集宁",
            "临河", "临河",
            "通辽", "通辽",
            "乌海", "乌海",
            "乌兰浩特", "乌兰浩特", 
            "锡林浩特", "锡林浩特");
            break;
        case "宁夏" :
            var cityOptions = new Array( 
            "银川", "银川",
            "固源", "固源", 
           "石嘴山", "石嘴山", 
            "吴忠", "吴忠");
            break;
        case "青海" :
            var cityOptions = new Array(
            "西宁", "西宁",
            "德令哈", "德令哈",
            "格尔木", "格尔木",
            "共和", "共和",
            "海东", "海东",
            "海晏", "海晏",
            "玛沁", "玛沁",
            "同仁", "同仁", 
            "玉树", "玉树");
            break;
        case "山东" :
            var cityOptions = new Array( 
            "济南", "济南",
            "滨州", "滨州",
            "兖州", "兖州",
            "德州", "德州",
            "东营", "东营",
            "荷泽", "荷泽",
            "济宁", "济宁",
            "莱芜", "莱芜",
            "聊城", "聊城",
            "临沂", "临沂",
            "蓬莱", "蓬莱",
            "青岛", "青岛",
            "曲阜", "曲阜",
            "日照", "日照",
            "泰安", "泰安",
            "潍坊", "潍坊",
            "威海", "威海",
            "烟台", "烟台",
            "枣庄", "枣庄",
            "淄博", "淄博");
            break;
        case "上海" :
            var cityOptions = new Array( 
            "上海", "上海", 
            "崇明", "崇明", 
            "朱家角", "朱家角");
            break;
        case "山西" :
            var cityOptions = new Array( 
            "太原", "太原",
            "长治", "长治",
            "大同", "大同",
            "候马", "候马",
            "晋城", "晋城",
            "离石", "离石",
            "临汾", "临汾",
            "宁武", "宁武",
            "朔州", "朔州",
            "忻州", "忻州",
            "阳泉", "阳泉", 
            "榆次", "榆次", 
            "运城", "运城");
            break;
        case "陕西" :
            var cityOptions = new Array( 
            "西安", "西安",
            "安康", "安康",
            "宝鸡", "宝鸡",
            "汉中", "汉中",
            "渭南", "渭南",
            "商州", "商州",
            "绥德", "绥德",
            "铜川", "铜川",
            "咸阳", "咸阳",
            "延安", "延安",
            "榆林", "榆林");
            break;
        case "四川" :
            var cityOptions = new Array( 
            "成都", "成都",
            "巴中", "巴中",
           "达安", "达安",
            "德阳", "德阳",
            "都江堰", "都江堰",
            "峨眉山", "峨眉山",
            "涪陵", "涪陵",
            "广安", "广安",
            "广元", "广元",
            "九寨沟", "九寨沟",
            "康定", "康定",
            "乐山", "乐山",
            "泸州", "泸州",
            "马尔康", "马尔康",
            "绵阳", "绵阳",
            "南充", "南充",
            "内江", "内江",
            "攀枝花", "攀枝花",
            "遂宁", "遂宁",
            "汶川", "汶川",
            "西昌", "西昌",
            "雅安", "雅安",
            "宜宾", "宜宾", 
            "自贡", "自贡");
            break;
        case "台湾" :
            var cityOptions = new Array( 
            "台北", "台北",
            "基隆", "基隆", 
            "台南", "台南", 
            "台中", "台中");
            break;
        case "天津" :
            var cityOptions = new Array( 
            "天津", "天津");
            break;
        case "新疆" :
            var cityOptions = new Array( 
            "乌鲁木齐", "乌鲁木齐",
            "阿克苏", "阿克苏",
            "阿勒泰", "阿勒泰",
            "阿图什", "阿图什",
            "博乐", "博乐",
            "昌吉", "昌吉",
            "东山", "东山",
            "哈密", "哈密",
            "和田", "和田",
            "喀什", "喀什",
            "克拉玛依", "克拉玛依",
            "库车", "库车",
            "库尔勒", "库尔勒",
            "奎屯", "奎屯",
            "石河子", "石河子",
            "塔城", "塔城",
            "吐鲁番", "吐鲁番", 
            "伊宁", "伊宁");
            break;
        case "西藏" :
            var cityOptions = new Array( 
            "拉萨", "拉萨",
            "阿里", "阿里",
            "昌都", "昌都",
            "林芝", "林芝",
            "那曲", "那曲", 
            "日喀则", "日喀则", 
            "山南", "山南");
            break;
        case "云南" :
            var cityOptions = new Array( 
            "昆明", "昆明",
            "大理", "大理",
            "保山", "保山",
            "楚雄", "楚雄",
            "大理", "大理",
            "东川", "东川",
            "个旧", "个旧",
            "景洪", "景洪",
            "开远", "开远",
            "临沧", "临沧",
            "丽江", "丽江",
            "六库", "六库",
            "潞西", "潞西",
            "曲靖", "曲靖",
            "思茅", "思茅",
            "文山", "文山",
            "西双版纳", "西双版纳",
            "玉溪", "玉溪", 
            "中甸", "中甸", 
            "昭通", "昭通");
            break;
        case "浙江" :
            var cityOptions = new Array( 
            "杭州", "杭州",
            "安吉", "安吉",
            "慈溪", "慈溪",
            "定海", "定海",
            "奉化", "奉化",
            "海盐", "海盐",
            "黄岩", "黄岩",
            "湖州", "湖州",
            "嘉兴", "嘉兴",
            "金华", "金华",
            "临安", "临安",
            "临海", "临海",
            "丽水", "丽水",
            "宁波", "宁波",
            "瓯海", "瓯海",
            "平湖", "平湖",
            "千岛湖", "千岛湖",
            "衢州", "衢州",
            "瑞安", "瑞安",
            "绍兴", "绍兴",
            "嵊州", "嵊州",
            "台州", "台州",
            "温岭", "温岭",
            "温州", "温州");
            break;     
    }
    document.form1.city.options.length = 0;
    for(var i = 0; i < cityOptions.length/2; i++) {
        document.form1.city.options[i]=new Option(cityOptions[i*2],cityOptions[i*2+1]);
        if (document.form1.city.options[i].value == "") document.form1.city.selectedIndex = i;
    }
}
function initprovcity() {
    for(var i = 0; i < document.form1.prv.options.length; i++) {
        if (document.form1.prv.options[i].value == "") document.form1.prv.selectedIndex = i;
    }
    setcity();
}
onload=initprovcity;
