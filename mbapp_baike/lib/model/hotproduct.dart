
//产品列表项数据转换
class HotProductItemModal{
  String desc;//产品描述
  String type;//产品类型
  String name;//产品名称
  String imageUrl;//产品图片路径
  String point;

  HotProductItemModal({
    this.desc,
    this.type,
    this.name,
    this.imageUrl,
    this.point,
});

  factory HotProductItemModal.fromJson(dynamic json){
    return HotProductItemModal(
      desc: json['desc'],
      type: json['type'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      point: json['point'],
    );
  }

}

//产品列表数据转换
class HotProductListModal{

  List<HotProductItemModal> data;
  HotProductListModal(this.data);

  factory HotProductListModal.fromJson(List json){
    return HotProductListModal(
      json.map((i) => HotProductItemModal.fromJson((i))).toList()
    );
  }

}