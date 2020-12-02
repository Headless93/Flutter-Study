import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mbapp/pages/collection/collectionListView.dart';
import 'package:mbapp/pages/collection/collection_provider.dart';
import 'package:provider/provider.dart';

class CollectionList extends StatefulWidget {
  CollectionList({Key key}) : super(key: key);

  @override
  _CollectionListState createState() => _CollectionListState();
}

class _CollectionListState extends State<CollectionList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('我的收藏'),
        ),
        body: FutureBuilder(
            future: _getCollectionDatasInfo(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CollectionListView();
              } else {
                return Center(
                  child: SpinKitFadingCircle(color: Colors.grey, size: 50.0),
                );
              }
            }));
  }

  // 获取首页接口homePageContent
  Future _getCollectionDatasInfo(BuildContext context) async {
    await Provider.of<CollectionProvider>(context, listen: false)
        .getCollectionList(
      1,
    );
    return '加载完成';
  }
}
