import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mbapp/res/color.dart';
import 'package:mbapp/res/font.dart';
import 'package:mbapp/model/productdetail.dart';
import 'package:mbapp/model/CompoundBaikeDetail.dart';
import 'package:mbapp/res/strings.dart';
import 'package:flutter_html/flutter_html.dart';

class MsdsDetailWidget extends StatefulWidget  {
  final BaikeDetailInfoData baikeDetailInfoData;

  MsdsDetailWidget(this.baikeDetailInfoData);

  @override
  _MsdsDetailPageState createState() => _MsdsDetailPageState();
}

class _MsdsDetailPageState extends State<MsdsDetailWidget> {
  List<bool> expands = List();
  @override
  void initState() {
    for(int i=0;i<widget.baikeDetailInfoData.data.length;i++){
      expands.insert(i,false);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //计算宽高 按比例

    return Container(child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Divider(
            height: 2.0,
            indent: 0.0,
            color: MbColors.color_e5e5e5,
          ),
          ListView.builder(
              itemCount: widget.baikeDetailInfoData.data.length,
              shrinkWrap: true,
              physics: new NeverScrollableScrollPhysics(),
              itemBuilder: (context,index){
                BaikeMsdsInfo baikeMsdsInfo = BaikeMsdsInfo.fromJson(widget.baikeDetailInfoData.data[index]);
                return Container(
                  decoration: new BoxDecoration(
                      color: MbColors.color_fff),
                  child:_build(context,baikeMsdsInfo,index),
                );
              }),
        ]),);
  }

  _changeOpacity(int index,bool expand){
    setState(() {
      if(expand){
        expands[index] = true;
      }else{
        expands[index] = false;
      }
    });
  }

  Widget _build(
      BuildContext context, BaikeMsdsInfo product,int index) {

    return ExpansionTile(
        title: Container(
          transform: Matrix4.translationValues(5, 0.0, 0.0),
          child: Text(product.title,style: TextStyle(color:MbColors.color_555,fontSize: 16),),
        ),
        trailing: Text(expands.elementAt(index)?YStrings.collectStr:YStrings.expandStr,style: TextStyle(color:MbColors.color_3f6bdc,fontSize: 14),),
        backgroundColor: Colors.white,
        initiallyExpanded: false,
        onExpansionChanged: (bool) {
          _changeOpacity(index,bool);
        },// 是否默认展开
        children: <Widget>[
          Divider(
            height: 2.0,
            indent: 0.0,
            color: MbColors.color_e5e5e5,
          ),
          Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top:15,left: 15, right: 15),
              //产品信息垂直布局
              child:Html(
                data: product.fileContent,
                backgroundColor: Colors.white70,
                defaultTextStyle: ProductFonts.itemValueStyle,
              )
          ),
        ]);
  }

}
