import 'package:flutter/material.dart';
import 'package:mbapp/pages/personal/personal_center.dart';
import 'package:mbapp/pages/search/search_list.dart';
import 'package:mbapp/pages/search/search_provider.dart';
import 'dart:ui';
import 'dart:convert';
import 'package:mbapp/res/color.dart';
import 'package:mbapp/res/strings.dart';
import 'package:provider/provider.dart';
import 'home_banner.dart';
import 'home_hotproduct.dart';
import 'package:mbapp/common/api.dart';
import 'package:mbapp/http/HttpManager.dart';
import 'package:mbapp/http/HttpError.dart';
import 'package:mbapp/http/HeaderInterceptor.dart';
import 'package:mbapp/http/LogInterceptor.dart';
import 'package:mbapp/model/productBanner.dart';
import 'package:mbapp/model/hotproduct.dart';
import 'package:mbapp/model/RecommendProducts.dart';
import 'package:mbapp/pages/baike/product_detail.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

var products = {
  "items": [
    {
      "id": 3321,
      "termValue": null,
      "molStruc": {
        "smiles": "OCC(CO)O",
        "formula": "C3H8O3",
        "inchi": "InChI=1S/C3H8O3/c4-1-3(6)2-5/h3-6H,1-2H2",
        "molWeight": 92.0938,
        "exactMass": 92.0473,
        "numAtoms": 14,
        "numBonds": 13,
        "numResidus": 0,
        "psa": 60.69,
        "logp": -1.6681,
        "mr": 20.0204,
        "numRings": 0,
        "sequence": "-"
      },
      "cas": "56-81-5",
      "casAlias": [],
      "cnName": "甘油",
      "cnNameAlias": ["醋精", "1,2,3-丙三醇", "丙三醇"],
      "enName": "glycerol",
      "enNameAlias": [
        "Glycerin",
        "1,2,3-trihydroxypropane",
        "Glycerol",
        "1,2,3-Propanetriol"
      ],
      "label": [
        {"id": 86, "name": "表面活性剂"},
        {"id": 127, "name": "非离子型表面活性剂"},
        {"id": 150, "name": "合成香料"},
        {"id": 158, "name": "化学药物"},
        {"id": 159, "name": "化妆品类"},
        {"id": 272, "name": "乳化香精"},
        {"id": 333, "name": "甜味剂"},
        {"id": 369, "name": "消化系统药物"},
        {"id": 432, "name": "专用油脂类"}
      ],
      "labelName": [
        "表面活性剂",
        "非离子型表面活性剂",
        "合成香料",
        "化学药物",
        "化妆品类",
        "乳化香精",
        "甜味剂",
        "消化系统药物",
        "专用油脂类"
      ],
      "classId": [27, 66, 144, 147, 176, 177, 178, 269, 311, 372, 570, 693],
      "classTree": null,
      "storeAggs": {
        "storeTotal": 106,
        "chinaCount": 106,
        "priceCount": 17,
        "type1Count": 2,
        "type2Count": 0,
        "type3Count": 0,
        "type4Count": 0,
        "goodsCount": 137,
        "goodsCountMall": 2,
        "goodsCountPlat": 137,
        "hasSelf": false
      },
      "storeAggsEn": {
        "storeTotal": 24,
        "chinaCount": 16,
        "priceCount": 1,
        "type1Count": 0,
        "type2Count": 0,
        "type3Count": 0,
        "type4Count": 0,
        "goodsCount": 29,
        "goodsCountMall": 0,
        "goodsCountPlat": 29,
        "hasSelf": false
      },
      "structImage":
          "http://saasimg.molbase.net/mol_command/49f5052bca6d49e4abb524129e5f4235.png",
      "black": [],
      "prop": [
        {"id": 1, "name": "化合物简介", "enName": "jianjie"},
        {"id": 68, "name": "编号系统", "enName": "1"},
        {"id": 2, "name": "物化性质", "enName": "wuhua"},
        {"id": 3, "name": "安全信息", "enName": "anquan"},
        {"id": 57, "name": "分析方法", "enName": "analysis"},
        {"id": 44, "name": "图谱", "enName": "tupu"},
        {"id": 65, "name": "合成路线", "enName": "xianlu"},
        {"id": 66, "name": "海关数据", "enName": "haiguan"},
        {"id": 63, "name": "上游原料", "enName": "shangyou"},
        {"id": 64, "name": "下游产品", "enName": "shangxiayou"}
      ],
      "propEn": [
        {"id": 2, "name": "Properties", "enName": "properties"},
        {"id": 3, "name": "Safety Info", "enName": "safe"},
        {"id": 57, "name": "GC Analysis", "enName": "analysis"},
        {"id": 44, "name": "Spectrum", "enName": "spectrum"},
        {"id": 65, "name": "Synthesis Route", "enName": "synthesis"},
        {"id": 63, "name": "Precursor", "enName": "precursor"},
        {"id": 64, "name": "Downstream Product", "enName": "downstream"}
      ]
    },
    {
      "id": 57523,
      "termValue": null,
      "molStruc": {
        "smiles": "O[Al](O)O",
        "formula": "AlH3O3",
        "inchi": "InChI=1S/Al.3H2O/h;3*1H2/q+3;;;/p-3",
        "molWeight": 78.0036,
        "exactMass": 77.9898,
        "numAtoms": 7,
        "numBonds": 6,
        "numResidus": 0,
        "psa": 60.69,
        "logp": -0.5304,
        "mr": 5.8074,
        "numRings": 0,
        "sequence": "-"
      },
      "cas": "21645-51-2",
      "casAlias": [],
      "cnName": "氢氧化铝",
      "cnNameAlias": ["氢氧化", "纳米氢氧化铝"],
      "enName": "aluminium hydroxide",
      "enNameAlias": ["Aluminium hydroxide", "Aluminum hydroxide"],
      "label": [
        {"id": 145, "name": "贵金属催化剂"},
        {"id": 158, "name": "化学药物"},
        {"id": 159, "name": "化妆品类"},
        {"id": 258, "name": "燃料油"},
        {"id": 302, "name": "食品稳定剂"},
        {"id": 322, "name": "塑料橡胶助剂"},
        {"id": 382, "name": "氧化物催化剂"},
        {"id": 436, "name": "阻燃剂"}
      ],
      "labelName": [
        "贵金属催化剂",
        "化学药物",
        "化妆品类",
        "燃料油",
        "食品稳定剂",
        "塑料橡胶助剂",
        "氧化物催化剂",
        "阻燃剂"
      ],
      "classId": [
        148,
        156,
        158,
        172,
        175,
        177,
        179,
        211,
        242,
        273,
        274,
        283,
        300,
        585,
        675
      ],
      "classTree": null,
      "storeAggs": {
        "storeTotal": 56,
        "chinaCount": 56,
        "priceCount": 9,
        "type1Count": 0,
        "type2Count": 0,
        "type3Count": 1,
        "type4Count": 0,
        "goodsCount": 65,
        "goodsCountMall": 0,
        "goodsCountPlat": 65,
        "hasSelf": false
      },
      "storeAggsEn": {
        "storeTotal": 14,
        "chinaCount": 8,
        "priceCount": 1,
        "type1Count": 0,
        "type2Count": 0,
        "type3Count": 0,
        "type4Count": 0,
        "goodsCount": 15,
        "goodsCountMall": 0,
        "goodsCountPlat": 15,
        "hasSelf": false
      },
      "structImage":
          "http://saasimg.molbase.net/mol_command/21784e812a5449648b6acf4fe10a74cc.png",
      "black": [],
      "prop": [
        {"id": 1, "name": "化合物简介", "enName": "jianjie"},
        {"id": 68, "name": "编号系统", "enName": "1"},
        {"id": 2, "name": "物化性质", "enName": "wuhua"},
        {"id": 3, "name": "安全信息", "enName": "anquan"},
        {"id": 66, "name": "海关数据", "enName": "haiguan"}
      ],
      "propEn": [
        {"id": 2, "name": "Properties", "enName": "properties"},
        {"id": 3, "name": "Safety Info", "enName": "safe"}
      ]
    },
    {
      "id": 3078,
      "termValue": null,
      "molStruc": {
        "smiles": "OCCO",
        "formula": "C2H6O2",
        "inchi": "InChI=1S/C2H6O2/c3-1-2-4/h3-4H,1-2H2",
        "molWeight": 62.0678,
        "exactMass": 62.0368,
        "numAtoms": 10,
        "numBonds": 9,
        "numResidus": 0,
        "psa": 40.46,
        "logp": -1.029,
        "mr": 14.0516,
        "numRings": 0,
        "sequence": "-"
      },
      "cas": "107-21-1",
      "casAlias": [],
      "cnName": "乙二醇",
      "cnNameAlias": ["甘醇", "1,2-亚乙基二醇", "乙撑二醇", "次乙基甘醇"],
      "enName": "Ethylene glycol",
      "enNameAlias": [
        "1,2-dihydroxy ethane",
        "Ethane-1,2-diol",
        "1,2-Ethanediol",
        "1,2-Dihydroxyethane",
        "2-hydroxy ethanol"
      ],
      "label": [
        {"id": 86, "name": "表面活性剂"},
        {"id": 129, "name": "肥皂类"},
        {"id": 142, "name": "工业催化剂"},
        {"id": 174, "name": "建筑涂料"},
        {"id": 239, "name": "农药中间体"},
        {"id": 258, "name": "燃料油"},
        {"id": 322, "name": "塑料橡胶助剂"},
        {"id": 326, "name": "酸性染料"},
        {"id": 339, "name": "涂料"},
        {"id": 360, "name": "洗涤用品"},
        {"id": 402, "name": "有机抽提剂"}
      ],
      "labelName": [
        "表面活性剂",
        "肥皂类",
        "工业催化剂",
        "建筑涂料",
        "农药中间体",
        "燃料油",
        "塑料橡胶助剂",
        "酸性染料",
        "涂料",
        "洗涤用品",
        "有机抽提剂"
      ],
      "classId": [
        19,
        21,
        39,
        55,
        64,
        156,
        172,
        174,
        176,
        177,
        178,
        213,
        260,
        307,
        344,
        407,
        416,
        442,
        570
      ],
      "classTree": null,
      "storeAggs": {
        "storeTotal": 5,
        "chinaCount": 5,
        "priceCount": 5,
        "type1Count": 1,
        "type2Count": 0,
        "type3Count": 0,
        "type4Count": 1,
        "goodsCount": 6,
        "goodsCountMall": 1,
        "goodsCountPlat": 5,
        "hasSelf": false
      },
      "storeAggsEn": {
        "storeTotal": 0,
        "chinaCount": 0,
        "priceCount": 0,
        "type1Count": 0,
        "type2Count": 0,
        "type3Count": 0,
        "type4Count": 0,
        "goodsCount": 0,
        "goodsCountMall": 0,
        "goodsCountPlat": 0,
        "hasSelf": false
      },
      "structImage":
          "http://saasimg.molbase.net/mol_command/8f78ad92897547799c34d052ddf1fc3d.png",
      "black": [],
      "prop": [
        {"id": 68, "name": "编号系统", "enName": "1"},
        {"id": 57, "name": "分析方法", "enName": "analysis"},
        {"id": 44, "name": "图谱", "enName": "tupu"},
        {"id": 65, "name": "合成路线", "enName": "xianlu"},
        {"id": 66, "name": "海关数据", "enName": "haiguan"},
        {"id": 63, "name": "上游原料", "enName": "shangyou"},
        {"id": 64, "name": "下游产品", "enName": "shangxiayou"}
      ],
      "propEn": [
        {"id": 57, "name": "GC Analysis", "enName": "analysis"},
        {"id": 44, "name": "Spectrum", "enName": "spectrum"},
        {"id": 65, "name": "Synthesis Route", "enName": "synthesis"},
        {"id": 63, "name": "Precursor", "enName": "precursor"},
        {"id": 64, "name": "Downstream Product", "enName": "downstream"}
      ]
    },
    {
      "id": 2393395,
      "termValue": null,
      "molStruc": {
        "smiles": "O=[Ti]=O",
        "formula": "O2Ti",
        "inchi": "InChI=1S/2O.Ti",
        "molWeight": 79.8658,
        "exactMass": 79.9378,
        "numAtoms": 3,
        "numBonds": 2,
        "numResidus": 0,
        "psa": 34.14,
        "logp": -0.2376,
        "mr": 1.373,
        "numRings": 0,
        "sequence": "-"
      },
      "cas": "13463-67-7",
      "casAlias": [],
      "cnName": "钛白粉",
      "cnNameAlias": [],
      "enName": "Titanium dioxide",
      "enNameAlias": [],
      "label": [
        {"id": 99, "name": "船舶涂料"},
        {"id": 130, "name": "分散剂"},
        {"id": 131, "name": "分散染料"},
        {"id": 141, "name": "高分子聚合物添加剂"},
        {"id": 146, "name": "还原染料"},
        {"id": 159, "name": "化妆品类"},
        {"id": 166, "name": "活性染料"},
        {"id": 174, "name": "建筑涂料"},
        {"id": 220, "name": "路用涂料"},
        {"id": 223, "name": "媒介染料"},
        {"id": 322, "name": "塑料橡胶助剂"},
        {"id": 328, "name": "特种涂料"},
        {"id": 336, "name": "通用涂料"},
        {"id": 339, "name": "涂料"},
        {"id": 341, "name": "涂料助剂"},
        {"id": 359, "name": "洗涤剂"},
        {"id": 360, "name": "洗涤用品"},
        {"id": 367, "name": "橡胶漆类"},
        {"id": 381, "name": "氧化染料"},
        {"id": 382, "name": "氧化物催化剂"},
        {"id": 389, "name": "印染纺织助剂"},
        {"id": 391, "name": "荧光染料"},
        {"id": 392, "name": "荧光增白剂"},
        {"id": 396, "name": "油墨"},
        {"id": 398, "name": "油漆"},
        {"id": 414, "name": "着色剂"},
        {"id": 435, "name": "阻聚剂"}
      ],
      "labelName": [
        "船舶涂料",
        "分散剂",
        "分散染料",
        "高分子聚合物添加剂",
        "还原染料",
        "化妆品类",
        "活性染料",
        "建筑涂料",
        "路用涂料",
        "媒介染料",
        "塑料橡胶助剂",
        "特种涂料",
        "通用涂料",
        "涂料",
        "涂料助剂",
        "洗涤剂",
        "洗涤用品",
        "橡胶漆类",
        "氧化染料",
        "氧化物催化剂",
        "印染纺织助剂",
        "荧光染料",
        "荧光增白剂",
        "油墨",
        "油漆",
        "着色剂",
        "阻聚剂"
      ],
      "classId": [
        44,
        54,
        61,
        151,
        172,
        197,
        207,
        211,
        227,
        231,
        260,
        273,
        276,
        283,
        288,
        300,
        321,
        326,
        327,
        338,
        352,
        367,
        368,
        375,
        384,
        395,
        412,
        427,
        471,
        491,
        504,
        507,
        508,
        585,
        722
      ],
      "classTree": null,
      "storeAggs": {
        "storeTotal": 73,
        "chinaCount": 73,
        "priceCount": 8,
        "type1Count": 1,
        "type2Count": 0,
        "type3Count": 1,
        "type4Count": 0,
        "goodsCount": 115,
        "goodsCountMall": 1,
        "goodsCountPlat": 115,
        "hasSelf": false
      },
      "storeAggsEn": {
        "storeTotal": 24,
        "chinaCount": 11,
        "priceCount": 1,
        "type1Count": 0,
        "type2Count": 0,
        "type3Count": 0,
        "type4Count": 0,
        "goodsCount": 26,
        "goodsCountMall": 0,
        "goodsCountPlat": 26,
        "hasSelf": false
      },
      "structImage":
          "http://saasimg.molbase.net/mol_command/ec3e01054e454357ac398ce0ad18f90e.png",
      "black": [],
      "prop": [
        {"id": 1, "name": "化合物简介", "enName": "jianjie"},
        {"id": 68, "name": "编号系统", "enName": "1"},
        {"id": 3, "name": "安全信息", "enName": "anquan"},
        {"id": 44, "name": "图谱", "enName": "tupu"},
        {"id": 66, "name": "海关数据", "enName": "haiguan"},
        {"id": 64, "name": "下游产品", "enName": "shangxiayou"}
      ],
      "propEn": [
        {"id": 3, "name": "Safety Info", "enName": "safe"},
        {"id": 44, "name": "Spectrum", "enName": "spectrum"},
        {"id": 64, "name": "Downstream Product", "enName": "downstream"}
      ]
    },
    {
      "id": 58,
      "termValue": null,
      "molStruc": {
        "smiles": "Oc1ccc(cc1)/C=C/c1cc(O)cc(c1)O",
        "formula": "C14H12O3",
        "inchi":
            "InChI=1S/C14H12O3/c15-12-5-3-10(4-6-12)1-2-11-7-13(16)9-14(17)8-11/h1-9,15-17H/b2-1+",
        "molWeight": 228.243,
        "exactMass": 228.079,
        "numAtoms": 29,
        "numBonds": 30,
        "numResidus": 0,
        "psa": 60.69,
        "logp": 2.9738,
        "mr": 67.881,
        "numRings": 2,
        "sequence": "-"
      },
      "cas": "501-36-0",
      "casAlias": [],
      "cnName": "白藜芦醇",
      "cnNameAlias": [
        "3,4,5-三羟基反式",
        "淫羊藿素",
        "反式-1,2-(3,4',5-三羟基二苯基)乙烯",
        "茋三酚",
        "虎杖甙元",
        "芪三酚",
        "培利替尼",
        "白黎芦醇",
        "白藜芦醇.3,4',5-三羟基芪,虎杖甙元",
        "3,4',5-三羟基茋",
        "3,4',5-三羟基二苯乙烯",
        "3,4',5-三羟基芪"
      ],
      "enName": "resveratrol",
      "enNameAlias": [
        "trans-3,5,4'-trihydroxy-stilbene",
        "1,3-Benzenediol, 5-[2-(4-hydroxyphenyl)ethenyl]-, (E)-",
        "3,4',5-Trihydroxy-trans-stilbene",
        "5-[(1E)-2-(4-Hydroxyphenyl)ethenyl]-1,3-benzenediol",
        "(E)-5-(4-Hydroxystyryl)benzene-1,3-diol",
        "RESVERATROLE",
        "trans-1,2-(3,4',5-Trihydroxydiphenyl)ethylene",
        "Resveratrol",
        "TRANS-RESVERATROL",
        "3',4,5'-trihydroxy-trans-stilbene",
        "RESVERTROL"
      ],
      "label": [
        {"id": 80, "name": "保健品原料"},
        {"id": 158, "name": "化学药物"},
        {"id": 192, "name": "抗癌类"},
        {"id": 211, "name": "抗肿瘤类药物"},
        {"id": 296, "name": "食品加香剂"},
        {"id": 376, "name": "循环（心血管）系统药物"},
        {"id": 385, "name": "医药化工原料、植物药"},
        {"id": 418, "name": "植物提取物"},
        {"id": 424, "name": "中草药提取物"}
      ],
      "labelName": [
        "保健品原料",
        "化学药物",
        "抗癌类",
        "抗肿瘤类药物",
        "食品加香剂",
        "循环（心血管）系统药物",
        "医药化工原料、植物药",
        "植物提取物",
        "中草药提取物"
      ],
      "classId": [22, 33, 47, 167, 171, 175, 180, 425, 556, 581],
      "classTree": null,
      "storeAggs": {
        "storeTotal": 182,
        "chinaCount": 182,
        "priceCount": 31,
        "type1Count": 0,
        "type2Count": 0,
        "type3Count": 2,
        "type4Count": 0,
        "goodsCount": 194,
        "goodsCountMall": 0,
        "goodsCountPlat": 194,
        "hasSelf": false
      },
      "storeAggsEn": {
        "storeTotal": 26,
        "chinaCount": 20,
        "priceCount": 2,
        "type1Count": 0,
        "type2Count": 0,
        "type3Count": 0,
        "type4Count": 0,
        "goodsCount": 35,
        "goodsCountMall": 0,
        "goodsCountPlat": 35,
        "hasSelf": false
      },
      "structImage":
          "http://saasimg.molbase.net/mol_command/9a9bd80742424d329a9796ce4d11c94e.png",
      "black": [],
      "prop": [
        {"id": 1, "name": "化合物简介", "enName": "jianjie"},
        {"id": 68, "name": "编号系统", "enName": "1"},
        {"id": 2, "name": "物化性质", "enName": "wuhua"},
        {"id": 3, "name": "安全信息", "enName": "anquan"},
        {"id": 44, "name": "图谱", "enName": "tupu"},
        {"id": 65, "name": "合成路线", "enName": "xianlu"},
        {"id": 66, "name": "海关数据", "enName": "haiguan"},
        {"id": 63, "name": "上游原料", "enName": "shangyou"},
        {"id": 64, "name": "下游产品", "enName": "shangxiayou"}
      ],
      "propEn": [
        {"id": 2, "name": "Properties", "enName": "properties"},
        {"id": 3, "name": "Safety Info", "enName": "safe"},
        {"id": 44, "name": "Spectrum", "enName": "spectrum"},
        {"id": 65, "name": "Synthesis Route", "enName": "synthesis"},
        {"id": 63, "name": "Precursor", "enName": "precursor"},
        {"id": 64, "name": "Downstream Product", "enName": "downstream"}
      ]
    }
  ]
};

class HomePageState extends State<HomePage> {
  ProductBannerListModal listProduct = ProductBannerListModal([]);
  RecommendProductListModal recommendProduct = RecommendProductListModal([]);

  TextEditingController searchCon = TextEditingController();
  @override
  void initState() {
    getHttp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        image: new DecorationImage(
          image: new AssetImage('assets/images/home/home_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, //把scaffold的背景色改成透明
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQueryData.fromWindow(window).padding.top),
          child: SafeArea(
            top: true,
            child: Offstage(),
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: ListView(
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/home/icon_search.png',
                              height: 24,
                              width: 24,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              YStrings.titleSearch,
                              style: TextStyle(
                                  fontSize: 21.0,
                                  color: MbColors.color_000,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: _screenWidth() - 40,
                                child: TextField(
                                  controller: searchCon,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: YStrings.searchHint,
                                    prefixIcon: new Image.asset(
                                        'assets/images/home/iv_search.png'),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        Provider.of<SearchProvider>(context,
                                                listen: false)
                                            .searchText = searchCon.text;
                                        //todo
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SearchList()),
                                        );
                                      },
                                      child: Container(
                                        width: 30,
                                        decoration: new BoxDecoration(
                                          image: new DecorationImage(
                                            image: new AssetImage(
                                                'assets/images/home/btn_search.png'),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              YStrings.searchStr,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: MbColors.color_fff),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  cursorWidth: 2,
                                  cursorRadius: Radius.elliptical(2, 8),
                                ),
                              )
                            ],
                          ),
                        ),
                        HotProductWidget(recommendProduct),
                        BannerWidget(listProduct),
                        Align(
                            alignment: Alignment.bottomCenter,
                            heightFactor: 3,
                            child: Text(
                              YStrings.companyName,
                              style: TextStyle(
                                  fontSize: 16.0, color: MbColors.color_555),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: new GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            // ProductDetailPage(item:listProduct.data[0])
                            PersonCenter()),
                  );
                },
                child: Image.asset(
                  'assets/images/home/icon_default.png',
                  height: 32,
                  width: 32,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _screenHeight() {
    return MediaQuery.of(context).size.height;
  }

  double _screenWidth() {
    return MediaQuery.of(context).size.width;
  }

  void getHttp() async {
    try {
      HttpManager().getOld(
        url: Api.HOT_KEY,
        successCallback: (data) {
          var json = jsonDecode(data);
          RecommendProductListModal recommend =
              RecommendProductListModal.fromJson(json);
          setState(() {
            recommendProduct.products.addAll(recommend.products);
          });
        },
        errorCallback: (HttpError error) {
          print(error.message);
        },
        tag: "hotsearch",
      );
      HttpManager().get(
        url: Api.HOME_BAIKE_ALLSEE,
        successCallback: (data) {
          ProductBannerListModal list = ProductBannerListModal.fromJson(data);
          setState(() {
            listProduct.data.addAll(list.data);
          });
        },
        errorCallback: (HttpError error) {
          print(error.message);
        },
        tag: "product_banner",
      );
    } catch (e) {
      print(e);
    }
  }
}
