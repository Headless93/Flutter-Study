import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mbapp/res/color.dart';
import 'package:mbapp/res/font.dart';
import 'package:mbapp/model/productdetail.dart';
import 'package:mbapp/model/CompoundBaikeDetail.dart';
import 'package:mbapp/res/strings.dart';

class SpectrumDetailWidget extends StatefulWidget {
  final BaikeDetailInfoData baikeDetailInfoData;

  SpectrumDetailWidget(this.baikeDetailInfoData);
  @override
  _SpectrumDetailPageState createState() => _SpectrumDetailPageState();
}

class _SpectrumDetailPageState extends State<SpectrumDetailWidget> {
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
                BaikeSpectrumInfo baikeSpectrumInfo = BaikeSpectrumInfo.fromJson(widget.baikeDetailInfoData.data[index]);
                return Container(
                  decoration: new BoxDecoration(
                      color: MbColors.color_fff),
                  child:_build(context,baikeSpectrumInfo,index),
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
      BuildContext context, BaikeSpectrumInfo product,int index) {

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
              child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(
                    'http:'+product.image,
                      fit: BoxFit.contain
                  ),
              ]
              ),
          ),
        ]);
  }

}
