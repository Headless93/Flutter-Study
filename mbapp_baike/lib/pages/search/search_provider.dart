import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:mbapp/common/api.dart';
import 'package:mbapp/http/HttpError.dart';
import 'package:mbapp/http/HttpManager.dart';
import 'package:mbapp/model/search_list_model.dart';

class SearchProvider with ChangeNotifier {
  int currentPage = 1;
  String searchText = '';
  List<CompoundsModel> searchList = List();
  SearchListModel searchListModel = SearchListModel();

  void searchListHttpGet(String searchText, int currentPage) {
    HttpManager().getOld(
      url: Api.BAIKE_SEARCH,
      params: {"keyword": searchText, "page": currentPage},
      successCallback: (data) {
        var json = jsonDecode(data);

        print('json---$json');

        searchListModel = SearchListModel.fromJson(json);
        if (currentPage == 1) {
          searchList = searchListModel.compounds;
        } else {
          searchList.addAll(searchListModel.compounds);
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
}
