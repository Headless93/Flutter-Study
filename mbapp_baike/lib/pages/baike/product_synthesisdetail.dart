import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mbapp/res/color.dart';
import 'package:mbapp/res/font.dart';
import 'package:mbapp/model/productdetail.dart';
import 'package:mbapp/model/CompoundBaikeDetail.dart';
import 'package:mbapp/res/strings.dart';

class SynthesisDetailWidget extends StatelessWidget {
  final BaikeDetailInfoData baikeDetailInfoData;

  SynthesisDetailWidget(this.baikeDetailInfoData);

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
              itemCount: baikeDetailInfoData.data.length,
              shrinkWrap: true,
              physics: new NeverScrollableScrollPhysics(),
              itemBuilder: (context,index){
                return Container(
                  decoration: new BoxDecoration(
                      color: MbColors.color_fff),
                  child:_build(BaikeSynthesisInfo.fromJson(baikeDetailInfoData.data[index]),index+1),
                );
              }),
        ]),);
  }

  Widget _build( BaikeSynthesisInfo product,int index) {
    //处理上下游的产品数据
    List<BaikeUpDownstreamInfo> upRoute = product.upRoute;
    List<BaikeUpDownstreamInfo> downRoute = product.downRoute;
    List<BaikeRouteInfo> routeInfos=new List<BaikeRouteInfo>();

    for(int i=0;i<upRoute.length;i++){
      BaikeRouteInfo routeInfo=BaikeRouteInfo();
      routeInfo.id = i == 0 ? 0 : upRoute[i].id;
      routeInfo.cas = upRoute[i].cas;
      routeInfo.name = upRoute[i].name;
      routeInfo.structImage =upRoute[i].structImage;
      routeInfo.type='1';
      routeInfos.add(routeInfo);
    }
    BaikeRouteInfo routeRateInfo=BaikeRouteInfo();
    routeRateInfo.type='3';
    routeRateInfo.routeRate=product.routeRate;
    routeInfos.add(routeRateInfo);
    for(int j=0;j<downRoute.length;j++){
      BaikeRouteInfo routeInfo=BaikeRouteInfo();
      routeInfo.id = j == 0 ? 0 :  downRoute[j].id;
      routeInfo.cas = downRoute[j].cas;
      routeInfo.name = downRoute[j].name;
      routeInfo.structImage =downRoute[j].structImage;
      routeInfo.type='2';
      routeInfos.add(routeInfo);
    }

    return Container(
        color: Colors.transparent,
        child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 15,top: 10),
                      child: Text(
                        index.toString()+YStrings.routetitleStr,
                        style: ProductFonts.routeTitleStyle,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.all(15),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          //单个子Widget的水平最大宽度
                          maxCrossAxisExtent: 90,
                          //水平单个子Widget之间间距
                          mainAxisSpacing: 10.0,
                          //垂直单个子Widget之间间距
                          crossAxisSpacing: 10.0,

                          childAspectRatio: 0.9,
                        ),
                        shrinkWrap: true,
                        physics: new NeverScrollableScrollPhysics(),
                        itemCount: routeInfos.length,
                        itemBuilder: (BuildContext context, int pos) {
                          return _buildItem(routeInfos[pos]);
                        },
                      ),
                    ),

                  ],
                ),
       );
  }

  Widget _buildItem(BaikeRouteInfo product) {
    //返回产品项

    return product.type == '3' ?
    Container(
        alignment: Alignment.center,
        child:Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            product.routeRate == null?'~':product.routeRate,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: ProductFonts.routeRateStyle,
          ),
        ),
        Image.asset(
      'assets/images/baike/icon_route.png',
      width: 60.0,
    ),
  ])):GestureDetector(
      onTap: () {
//        Navigator.push(
//          context,
//          MaterialPageRoute(
//              builder: (context) => ProductDetail(item:i)),
//        );
      },
      child: Expanded(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Row(
          mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Offstage(
                offstage: product.id == 0 , //这里控制 true  false 布尔值
                child: Image.asset(
                  'assets/images/baike/icon_routeadd.png',
                  width: 10.0,
                  height: 10.0,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Container(
                alignment: Alignment.topCenter,
                decoration: new BoxDecoration(
                    border: new Border.all(color: MbColors.color_f2f2f2, width: 1)),
                child: Image.network(
                  product.structImage,
                  width: 60.0,
                  height: 60.0,
                ),
              ),
              ]
          ),
              SizedBox(
                height: 4,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  product.cas,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: ProductFonts.casStreamStyle,
                ),
              ),

              SizedBox(
                height: 2,
              ),
            ],
          )),
    );
  }
}
