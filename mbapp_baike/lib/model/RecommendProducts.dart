
//推荐产品列表项数据转换
class RecommendProductItemModal{
  int id;//产品ID
  String name;//产品名称
  String remark;//产品备注
  int is_delete;//删除标记
  CompoundDetail compound;
  int mol_id;

  RecommendProductItemModal({this.id, this.name, this.remark, this.is_delete, this.compound});

  RecommendProductItemModal.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    remark = json['remark'];
    is_delete = json['is_delete'];
    compound = json['compound'] != null ? new CompoundDetail.fromJson(json['compound']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['remark'] = this.remark;
    data['is_delete'] = this.is_delete;
    if (this.compound != null) {
      data['compound'] = this.compound.toJson();
    }
    return data;
  }
}

class CompoundDetail {
  int mol_id;
  String mol_name;
  String en_synonyms;
  String zh_synonyms;
  String name_cn;
  String cas_no;
  CompoundDetail({this.mol_id,this.mol_name,this.en_synonyms,this.zh_synonyms,this.name_cn,this.cas_no});

  CompoundDetail.fromJson(Map<String, dynamic> json) {
    mol_id = json['mol_id'];
    mol_name = json['mol_name'];
    en_synonyms = json['en_synonyms'];
    zh_synonyms = json['zh_synonyms'];
    name_cn = json['name_cn'];
    cas_no = json['cas_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mol_id'] = this.mol_id;
    data['mol_name'] = this.mol_name;
    data['en_synonyms'] = this.en_synonyms;
    data['zh_synonyms'] = this.zh_synonyms;
    data['name_cn'] = this.name_cn;
    data['cas_no'] = this.cas_no;
    return data;
  }
}

//推荐产品列表数据转换
class RecommendProductListModal{

  List<RecommendProductItemModal> products;
  RecommendProductListModal(this.products);

  RecommendProductListModal.fromJson(Map<String, dynamic> json){
    if (json['products'] != null) {
      products = new List<RecommendProductItemModal>();(json['products'] as List).forEach((v) { products.add(new RecommendProductItemModal.fromJson(v)); });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] =  this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}