import 'package:flutter/material.dart';

class CollectionModel {
  int total;
  List<BaikeModel> baikes;
  CollectionModel({this.total, this.baikes});

  CollectionModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    baikes = new List<BaikeModel>();
    (json['baikes'] as List).forEach((v) {
      baikes.add(new BaikeModel.fromJson(v));
    });
    //   BaikeModel(
    //   json.map((i) => BaikeModel.fromJson((i))).toList()
    // );
  }
}

class BaikeModel {
  int id;
  int user_id;
  int mol_id;
  int category_id;
  String category_name;
  String extend;
  String created_at;
  String name_zh;
  String name_en;
  String cas_no;
  String img;

  BaikeModel(
      {this.id,
      this.user_id,
      this.mol_id,
      this.category_id,
      this.category_name,
      this.extend,
      this.created_at,
      this.name_zh,
      this.name_en,
      this.cas_no,
      this.img});

  BaikeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_id = json['user_id'];
    mol_id = json['mol_id'];
    category_id = json['category_id'];
    category_name = json['category_name'];
    extend = json['extend'];
    created_at = json['created_at'];
    name_zh = json['name_zh'];
    name_en = json['name_en'];
    cas_no = json['cas_no'];
    img = json['img'];
  }
}

// {"total":5,
// "baikes":[
//   {"id":1841,
//   "user_id":704835,
//   "mol_id":1576169,
//   "category_id":130,
//   "category_name":"其他",
//   "extend":"{
//     \"name_zh\":\"5-[[(2R,3R)-2-[(1R)-1-[3,5-二(三氟甲基)苯基]乙氧基]-3-(4-氟苯基)-4-吗啉基]甲基]
//     -1,2-二氢-3H-1,2,4-三唑-3-酮\",
//     \"name_en\":\"(R,R,R)-Aprepitant\",\"cas_no\":\"1148113-53-4\",
//     \"img\":\"http:\\/\\/saasimg.molbase.net\\/mol_command\\/f2f041d5b7e548608ed654694d63a0db.png\"
//     }",
//     "created_at":"2019-12-16 07:48:52",
//     "name_zh":"5-[[(2R,3R)-2-[(1R)-1-[3,5-二(三氟甲基)苯基]乙氧基]-3-(4-氟苯基)-4-吗啉基]甲基]-1,2-二氢-3H-1,2,4-三唑-3-酮",
//     "name_en":"(R,R,R)-Aprepitant",
//     "cas_no":"1148113-53-4",
//     "img":"http://saasimg.molbase.net/mol_command/f2f041d5b7e548608ed654694d63a0db.png"
//     },
// }
