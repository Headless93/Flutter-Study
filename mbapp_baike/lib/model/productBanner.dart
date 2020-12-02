
class ProductBannerDetail {
  int id;
  String cas;
  String cnName;
  String enName;
  String structImage;
  List<String> cnNameAlias;
  List<String> enNameAlias;
  MolStructData molStruc;
  List<PropInfoData> prop;

  ProductBannerDetail({this.id, this.cas, this.cnName, this.enName, this.structImage, this.cnNameAlias, this.enNameAlias, this.molStruc, this.prop});

  ProductBannerDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cas = json['cas'];
    cnName = json['cnName'];
    enName = json['enName'];
    structImage = json['structImage'];
    if (json['cnNameAlias'] != null) {
      cnNameAlias = new List<String>();(json['cnNameAlias'] as List).forEach((v) { cnNameAlias.add(v); });
    }
    if (json['enNameAlias'] != null) {
      enNameAlias = new List<String>();(json['enNameAlias'] as List).forEach((v) { enNameAlias.add(v); });
    }
    if (json['molStruc'] != null) {
      molStruc = json['molStruc'] != null ? new MolStructData.fromJson(json['molStruc']) : null;
    }
    if (json['prop'] != null) {
      prop = new List<PropInfoData>();(json['prop'] as List).forEach((v) { prop.add(new PropInfoData.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cas'] = this.cas;
    data['cnName'] = this.cnName;
    data['enName'] = this.enName;
    data['structImage'] = this.structImage;
    if (this.cnNameAlias != null) {
      data['cnNameAlias'] =  this.cnNameAlias.map((v) => v).toList();
    }
    if (this.enNameAlias != null) {
      data['enNameAlias'] =  this.enNameAlias.map((v) => v).toList();
    }
    if (this.molStruc != null) {
      data['molStruc'] =  this.molStruc.toJson();
    }
    if (this.prop != null) {
      data['prop'] = this.prop.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class MolStructData {
  String smiles;
  String formula;
  String inchi;
  double molWeight;
  double exactMass;
  int numAtoms;
  int numBonds;
  int numResidus;
  double psa;
  double logp;
  double mr;
  int numRings;
  String sequence;
  String processingStatus;

  MolStructData({this.smiles, this.formula, this.inchi,this.molWeight, this.exactMass, this.numAtoms,this.numBonds, this.numResidus, this.psa,this.logp, this.mr, this.numRings,this.sequence, this.processingStatus});

  MolStructData.fromJson(Map<String, dynamic> json) {
    smiles = json['smiles'];
    formula = json['formula'];
    inchi = json['inchi'];
    molWeight = json['molWeight'];
    exactMass = json['exactMass'];
    numAtoms = json['numAtoms'];
    numBonds = json['numBonds'];
    numResidus = json['numResidus'];
    psa = json['psa'];
    logp = json['logp'];
    mr = json['mr'];
    numRings = json['numRings'];
    sequence = json['sequence'];
    processingStatus = json['processingStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['smiles'] = this.smiles;
    data['formula'] = this.formula;
    data['inchi'] = this.inchi;
    data['molWeight'] = this.molWeight;
    data['exactMass'] = this.exactMass;
    data['numAtoms'] = this.numAtoms;
    data['numBonds'] = this.numBonds;
    data['numResidus'] = this.numResidus;
    data['psa'] = this.psa;
    data['logp'] = this.logp;
    data['mr'] = this.mr;
    data['numRings'] = this.numRings;
    data['sequence'] = this.sequence;
    data['processingStatus'] = this.processingStatus;
    return data;
  }
}

class PropInfoData {
  int id;
  String name;
  String enName;

  PropInfoData({this.id, this.name, this.enName});

  PropInfoData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    enName = json['enName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['enName'] = this.enName;
    return data;
  }
}

class ProductBannerListModal{

  List<ProductBannerDetail> data;
  ProductBannerListModal(this.data);

  factory ProductBannerListModal.fromJson(List json){
    return ProductBannerListModal(
        json.map((i) => ProductBannerDetail.fromJson((i))).toList()
    );
  }
}