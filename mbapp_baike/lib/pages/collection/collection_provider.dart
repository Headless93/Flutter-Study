import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:mbapp/common/api.dart';
import 'package:mbapp/http/HttpError.dart';
import 'package:mbapp/http/HttpManager.dart';
import 'package:mbapp/model/collection_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CollectionProvider with ChangeNotifier {
  int currentPage = 1;
  String uid = '';
  List<BaikeModel> collectionList = List();
  CollectionModel collectionModel = CollectionModel();

  void getUid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance(); //初始化
    uid = prefs.getString('uid');
  }

  Future<void> getCollectionList(int currentPage) async {
    getUid();

    SharedPreferences prefs = await SharedPreferences.getInstance(); //初始化
    String sn_api = prefs.getString('SN_API');
    HttpManager().getOld(
      url: Api.FAVORITES_BAIKE_LIST,
      params: {"page": currentPage},
      options: Options(headers: {
        'Auth-Basic-Token': sn_api,
      }),
      successCallback: (data) {
        print('CollectionModel------$data');
        var json = jsonDecode(data);
        collectionModel = CollectionModel.fromJson(json);
        if (currentPage == 1) {
          collectionList = collectionModel.baikes;
        } else {
          collectionList.addAll(collectionModel.baikes);
        }
        notifyListeners();
      },
      errorCallback: (HttpError error) {
        Fluttertoast.showToast(
          msg: error.message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER, // 消息框弹出的位置
        );
      },
      tag: "BAIKE_SEARCH",
    );
  }

  void notifyListeners() {}
}
