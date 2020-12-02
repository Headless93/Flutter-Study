class ProductBaseDetailData {
  int id;
  String cas;
  String cnName;
  String enName;
  String structImage;
  List<String> cnNameAlias;
  List<String> enNameAlias;
  MolStructData molStruc;
  int price;
  String unit;
  List<BaikeInfoData> baikeInfos;
  bool blacklist;
  bool supplier;
  bool shopping;

  ProductBaseDetailData(
      {this.id,
      this.cas,
      this.cnName,
      this.enName,
      this.structImage,
      this.cnNameAlias,
      this.enNameAlias,
      this.molStruc,
      this.price,
      this.unit,
      this.baikeInfos,
      this.blacklist,
      this.supplier,
      this.shopping});

  ProductBaseDetailData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cas = json['cas'];
    cnName = json['cnName'];
    enName = json['enName'];
    structImage = json['structImage'];
    if (json['cnNameAlias'] != null) {
      cnNameAlias = new List<String>();
      (json['cnNameAlias'] as List).forEach((v) {
        cnNameAlias.add(v);
      });
    }
    if (json['enNameAlias'] != null) {
      enNameAlias = new List<String>();
      (json['enNameAlias'] as List).forEach((v) {
        enNameAlias.add(v);
      });
    }
    if (json['molStruc'] != null) {
      molStruc = json['molStruc'] != null
          ? new MolStructData.fromJson(json['molStruc'])
          : null;
    }
    price = json['price'];
    unit = json['unit'];
    if (json['baikeInfos'] != null) {
      baikeInfos = new List<BaikeInfoData>();
      (json['baikeInfos'] as List).forEach((v) {
        baikeInfos.add(new BaikeInfoData.fromJson(v));
      });
    }
    blacklist = json['blacklist'];
    supplier = json['supplier'];
    shopping = json['shopping'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cas'] = this.cas;
    data['cnName'] = this.cnName;
    data['enName'] = this.enName;
    data['structImage'] = this.structImage;
    if (this.cnNameAlias != null) {
      data['cnNameAlias'] = this.cnNameAlias.map((v) => v).toList();
    }
    if (this.enNameAlias != null) {
      data['enNameAlias'] = this.enNameAlias.map((v) => v).toList();
    }
    if (this.molStruc != null) {
      data['molStruc'] = this.molStruc.toJson();
    }
    data['price'] = this.price;
    data['unit'] = this.unit;
    if (this.baikeInfos != null) {
      data['baikeInfos'] = this.baikeInfos.map((v) => v.toJson()).toList();
    }

    data['blacklist'] = this.blacklist;
    data['supplier'] = this.supplier;
    data['shopping'] = this.shopping;
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

  MolStructData(
      {this.smiles,
      this.formula,
      this.inchi,
      this.molWeight,
      this.exactMass,
      this.numAtoms,
      this.numBonds,
      this.numResidus,
      this.psa,
      this.logp,
      this.mr,
      this.numRings,
      this.sequence,
      this.processingStatus});

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

class BaikeInfoData {
  int id;
  String propertyGroupName;
  String nameUrl;
  bool isExpanded;

  BaikeInfoData(
      {this.id, this.propertyGroupName, this.nameUrl, this.isExpanded});

  BaikeInfoData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyGroupName = json['propertyGroupName'];
    nameUrl = json['nameUrl'];
    isExpanded = json['isExpanded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['propertyGroupName'] = this.propertyGroupName;
    data['nameUrl'] = this.nameUrl;
    data['isExpanded'] = this.isExpanded;
    return data;
  }
}
