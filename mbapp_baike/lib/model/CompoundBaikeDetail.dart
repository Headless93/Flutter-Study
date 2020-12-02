
class ProductDetailData {
  BaikeDetailInfoData description;//基本信息
  BaikeDetailInfoData properties;//物化信息
  BaikeDetailInfoData safe;//安全信息
  BaikeDetailInfoData use;//生产方法及用途
  BaikeDetailInfoData msds;//MSDS
  BaikeDetailInfoData spectrum;//图谱
  BaikeDetailInfoData analysis;//分析方法
  BaikeDetailInfoData synthesis;//合成路线
  BaikeDetailInfoData import;//海关数据
  BaikeDetailInfoData precursor;//上游原料
  BaikeDetailInfoData downstream;//下游产品
  BaikeDetailInfoData toxicity;//毒性

  ProductDetailData({this.description, this.properties, this.safe, this.use, this.msds, this.spectrum, this.analysis, this.synthesis, this.import, this.precursor, this.downstream, this.toxicity});

  ProductDetailData.fromJson(Map<String, dynamic> json) {
    description = json['description'] != null ? new BaikeDetailInfoData.fromJson(json['description']) : null;
    properties = json['properties'] != null ? new BaikeDetailInfoData.fromJson(json['properties']) : null;
    safe = json['safe'] != null ? new BaikeDetailInfoData.fromJson(json['safe']) : null;
    use = json['use'] != null ? new BaikeDetailInfoData.fromJson(json['use']) : null;
    msds = json['msds'] != null ? new BaikeDetailInfoData.fromJson(json['msds']) : null;
    spectrum = json['spectrum'] != null ? new BaikeDetailInfoData.fromJson(json['spectrum']) : null;
    analysis = json['analysis'] != null ? new BaikeDetailInfoData.fromJson(json['analysis']) : null;
    synthesis = json['synthesis'] != null ? new BaikeDetailInfoData.fromJson(json['synthesis']) : null;
    import = json['import'] != null ? new BaikeDetailInfoData.fromJson(json['import']) : null;
    precursor = json['precursor'] != null ? new BaikeDetailInfoData.fromJson(json['precursor']) : null;
    downstream = json['downstream'] != null ? new BaikeDetailInfoData.fromJson(json['downstream']) : null;
    toxicity = json['toxicity'] != null ? new BaikeDetailInfoData.fromJson(json['toxicity']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.description != null) {
      data['description'] = this.description.toJson();
    }
    if (this.properties != null) {
      data['properties'] = this.properties.toJson();
    }
    if (this.safe != null) {
      data['safe'] = this.safe.toJson();
    }
    if (this.use != null) {
      data['use'] = this.use.toJson();
    }
    if (this.msds != null) {
      data['msds'] = this.msds.toJson();
    }
    if (this.spectrum != null) {
      data['spectrum'] = this.spectrum.toJson();
    }
    if (this.analysis != null) {
      data['analysis'] = this.analysis.toJson();
    }
    if (this.synthesis != null) {
      data['synthesis'] = this.synthesis.toJson();
    }
    if (this.import != null) {
      data['import'] = this.import.toJson();
    }
    if (this.precursor != null) {
      data['precursor'] = this.precursor.toJson();
    }
    if (this.downstream != null) {
      data['downstream'] = this.downstream.toJson();
    }
    if (this.toxicity != null) {
      data['toxicity'] = this.toxicity.toJson();
    }
    return data;
  }
}

//父类 公共字段
class BaikeDetailInfoData {
  int propertyGroupId;
  String propertyGroupName;
  String nameUrl;
  String propertyGroupEnName;
  String enNameUrl;
  int propertyGroupType;
  List<Map<String ,dynamic>> data;
  int size;
  int nmrTotal;
  int sort;

  BaikeDetailInfoData({this.propertyGroupId, this.propertyGroupName, this.nameUrl,this.propertyGroupEnName, this.enNameUrl, this.propertyGroupType,this.data,this.size, this.nmrTotal, this.sort});

  BaikeDetailInfoData.fromJson(Map<String, dynamic> json) {
    propertyGroupId = json['propertyGroupId'];
    propertyGroupName = json['propertyGroupName'];
    nameUrl = json['nameUrl'];
    propertyGroupEnName = json['propertyGroupEnName'];
    enNameUrl = json['enNameUrl'];
    propertyGroupType = json['propertyGroupType'];
//    if (json['data'] != null) {
//      //data = json['data'] as List;
//    }
    if (json['data'] != null) {
      data = new List<Map<String ,dynamic>>();(json['data'] as List).forEach((v) { data.add(new Map<String ,dynamic>.from(v)); });
    }
    size = json['size'];
    nmrTotal = json['nmrTotal'];
    sort = json['sort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['propertyGroupId'] = this.propertyGroupId;
    data['propertyGroupName'] = this.propertyGroupName;
    data['nameUrl'] = this.nameUrl;
    data['propertyGroupEnName'] = this.propertyGroupEnName;
    data['enNameUrl'] = this.enNameUrl;
    data['propertyGroupType'] = this.propertyGroupType;
    data['data'] = this.data;

    if (this.data != null) {
      data['data'] =  this.data.toList();
    }
    data['size'] = this.size;
    data['nmrTotal'] = this.nmrTotal;
    data['sort'] = this.sort;
    return data;
  }
}

//毒性
class BaikeToxicityInfo {
  int id;
  String secondCategoryCn;
  String typeOfTestCn;
  String routeOfExposureCn;
  String speciesObservedCn;
  String doseDuration;
  String toxicStr;
  String reference;
  BaikeToxicityInfo({this.id,this.secondCategoryCn,this.typeOfTestCn,this.routeOfExposureCn,this.speciesObservedCn,this.doseDuration,this.toxicStr,this.reference});

  BaikeToxicityInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    secondCategoryCn = json['secondCategoryCn'];
    typeOfTestCn = json['typeOfTestCn'];
    routeOfExposureCn = json['routeOfExposureCn'];
    speciesObservedCn = json['speciesObservedCn'];
    doseDuration = json['doseDuration'];
    toxicStr = json['toxicStr'];
    reference = json['reference'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['secondCategoryCn'] = this.secondCategoryCn;
    data['typeOfTestCn'] = this.typeOfTestCn;
    data['routeOfExposureCn'] = this.routeOfExposureCn;
    data['speciesObservedCn'] = this.speciesObservedCn;
    data['doseDuration'] = this.doseDuration;
    data['toxicStr'] = this.toxicStr;
    data['reference'] = this.reference;
    return data;
  }
}

//MSDS
class BaikeMsdsInfo {
  int language;
  String title;
  int type;
  String fileContent;
  BaikeMsdsInfo({this.language,this.title,this.type,this.fileContent});

  BaikeMsdsInfo.fromJson(Map<String, dynamic> json) {
    language = json['language'];
    title = json['title'];
    type = json['type'];
    fileContent = json['fileContent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['language'] = this.language;
    data['title'] = this.title;
    data['type'] = this.type;
    data['fileContent'] = this.fileContent;
    return data;
  }
}

//图谱
class BaikeSpectrumInfo {
  String image;
  String name;
  int type;
  String subType;
  String title;
  String beforeContent;
  String afterContent;
  int sort;
  String nmrType;
  String companyId;
  String companyName;
  String createTime;
  String chIntro;
  BaikeSpectrumInfo({this.image,this.name,this.type,this.subType,this.title,this.beforeContent,this.afterContent,this.sort,this.nmrType,this.companyId,this.companyName,this.createTime,this.chIntro});

  BaikeSpectrumInfo.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    type = json['type'];
    subType = json['subType'];
    title = json['title'];
    beforeContent = json['beforeContent'];
    afterContent = json['afterContent'];
    sort = json['sort'];
    nmrType = json['nmrType'];
    companyId = json['companyId'];
    companyName = json['companyName'];
    createTime = json['createTime'];
    chIntro = json['chIntro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['type'] = this.type;
    data['subType'] = this.subType;
    data['title'] = this.title;
    data['beforeContent'] = this.beforeContent;
    data['afterContent'] = this.afterContent;
    data['sort'] = this.sort;
    data['nmrType'] = this.nmrType;
    data['companyId'] = this.companyId;
    data['companyName'] = this.companyName;
    data['createTime'] = this.createTime;
    data['chIntro'] = this.chIntro;
    return data;
  }
}

//分析方法
class BaikeAnalysisInfo {
  String title;
  String temprCtrlMethod;
  String temprCtrlMethodCn;
  String columnType;
  String columnTypeCn;
  String columnTypeDetail;
  String columnTypeDetailCn;
  String activePhase;
  String temperature;
  String retentionIndex;
  String reference;
  String comment;
  String reference1;
  String reference2;
  String reference3;
  String reference4;
  String reference5;
  String url;
  String allUrl;
  BaikeAnalysisInfo({this.title,this.temprCtrlMethod,this.temprCtrlMethodCn,this.columnType,this.columnTypeCn,this.columnTypeDetail,this.columnTypeDetailCn,this.activePhase,this.temperature,this.retentionIndex,this.reference,this.comment,this.reference1,this.reference2,this.reference3,this.reference4,this.reference5,this.url,this.allUrl});

  BaikeAnalysisInfo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    temprCtrlMethod = json['temprCtrlMethod'];
    temprCtrlMethodCn = json['temprCtrlMethodCn'];
    columnType = json['columnType'];
    columnTypeCn = json['columnTypeCn'];
    columnTypeDetail = json['columnTypeDetail'];
    columnTypeDetailCn = json['columnTypeDetailCn'];
    activePhase = json['activePhase'];
    temperature = json['temperature'];
    retentionIndex = json['retentionIndex'];
    reference = json['reference'];
    comment = json['comment'];
    reference1 = json['reference1'];
    reference2 = json['reference2'];
    reference3 = json['reference3'];
    reference4 = json['reference4'];
    reference5 = json['reference5'];
    url = json['url'];
    allUrl = json['allUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['temprCtrlMethod'] = this.temprCtrlMethod;
    data['temprCtrlMethodCn'] = this.temprCtrlMethodCn;
    data['columnType'] = this.columnType;
    data['columnTypeCn'] = this.columnTypeCn;
    data['columnTypeDetail'] = this.columnTypeDetail;
    data['columnTypeDetailCn'] = this.columnTypeDetailCn;
    data['activePhase'] = this.activePhase;
    data['temperature'] = this.temperature;
    data['retentionIndex'] = this.retentionIndex;
    data['reference'] = this.reference;
    data['comment'] = this.comment;
    data['reference1'] = this.reference1;
    data['reference2'] = this.reference2;
    data['reference3'] = this.reference3;
    data['reference4'] = this.reference4;
    data['reference5'] = this.reference5;
    data['url'] = this.url;
    data['allUrl'] = this.allUrl;
    return data;
  }
}

//海关数据
class BaikeImportInfo {
  String hscodeNo;
  String country;
  String chCountry;
  double modifyTime;
  bool showCsData;
  String csDataInfoList;
  String csQualificationInfoList;
  BaikeImportInfo({this.hscodeNo,this.country,this.chCountry,this.modifyTime,this.showCsData,this.csDataInfoList,this.csQualificationInfoList});

  BaikeImportInfo.fromJson(Map<String, dynamic> json) {
    hscodeNo = json['hscodeNo'];
    country = json['country'];
    chCountry = json['chCountry'];
    modifyTime = json['modifyTime'];
    showCsData = json['showCsData'];
    csDataInfoList = json['csDataInfoList'];
    csQualificationInfoList = json['csQualificationInfoList'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hscodeNo'] = this.hscodeNo;
    data['country'] = this.country;
    data['chCountry'] = this.chCountry;
    data['modifyTime'] = this.modifyTime;
    data['showCsData'] = this.showCsData;
    data['csDataInfoList'] = this.csDataInfoList;
    data['csQualificationInfoList'] = this.csQualificationInfoList;
    return data;
  }
}

//上游原料//下游产品downstream
class BaikeRouteInfo {
  int id;
  String cas;
  String name;
  String structImage;
  String type;
  String routeRate;
  BaikeRouteInfo({this.id,this.cas,this.name,this.structImage,this.type,this.routeRate});

  BaikeRouteInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cas = json['cas'];
    name = json['name'];
    structImage = json['structImage'];
    type = json['type'];
    routeRate = json['routeRate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cas'] = this.cas;
    data['name'] = this.name;
    data['structImage'] = this.structImage;
    data['type'] = this.type;
    data['routeRate'] = this.routeRate;
    return data;
  }
}

class BaikeUpDownstreamInfo {
  int id;
  String cas;
  String name;
  String structImage;
  String rate;
  bool buyCompound;
  BaikeUpDownstreamInfo({this.id,this.cas,this.name,this.structImage,this.rate,this.buyCompound});

  BaikeUpDownstreamInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cas = json['cas'];
    name = json['name'];
    structImage = json['structImage'];
    rate = json['rate'];
    buyCompound = json['buyCompound'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cas'] = this.cas;
    data['name'] = this.name;
    data['structImage'] = this.structImage;
    data['rate'] = this.rate;
    data['buyCompound'] = this.buyCompound;
    return data;
  }
}

//合成路线synthesis

class RouteDoc {
  String doc1;
  String doc2;
  String doc3;
  String doc4;
  String doc5;
  RouteDoc({this.doc1,this.doc2,this.doc3,this.doc4,this.doc5});

  RouteDoc.fromJson(Map<String, dynamic> json) {
    doc1 = json['doc1'];
    doc2 = json['doc2'];
    doc3 = json['doc3'];
    doc4 = json['doc4'];
    doc5 = json['doc5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doc1'] = this.doc1;
    data['doc2'] = this.doc2;
    data['doc3'] = this.doc3;
    data['doc4'] = this.doc4;
    data['doc5'] = this.doc5;
    return data;
  }
}

class BaikeSynthesisInfo {
  int id;
  String cas;
  List<BaikeUpDownstreamInfo> upRoute;
  List<BaikeUpDownstreamInfo> downRoute;
  RouteDoc routeDoc;
  String routeUpAndDownStr;
  String routeRate;
  String routeSource;
  String urlSource;
  String userIdSource;
  String companyIdSource;
  String routeConditions;
  BaikeSynthesisInfo({this.id,this.cas,this.upRoute,this.downRoute,this.routeDoc,this.routeUpAndDownStr,this.routeRate,this.routeSource,this.urlSource,this.userIdSource,this.companyIdSource,this.routeConditions});

  BaikeSynthesisInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cas = json['cas'];
    if (json['upRoute'] != null) {
      upRoute = new List<BaikeUpDownstreamInfo>();(json['upRoute'] as List).forEach((v) { upRoute.add(new BaikeUpDownstreamInfo.fromJson(v)); });
    }
    if (json['upRoute'] != null) {
      downRoute = new List<BaikeUpDownstreamInfo>();(json['downRoute'] as List).forEach((v) { downRoute.add(new BaikeUpDownstreamInfo.fromJson(v)); });
    }
    routeDoc = json['routeDoc'] != null ? new RouteDoc.fromJson(json['routeDoc']) : null;
    routeUpAndDownStr = json['routeUpAndDownStr'];
    routeRate = json['routeRate'];
    routeSource = json['routeSource'];
    urlSource = json['urlSource'];
    userIdSource = json['userIdSource'];
    companyIdSource = json['companyIdSource'];
    routeConditions = json['routeConditions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cas'] = this.cas;
    if (this.upRoute != null) {
      data['upRoute'] =  this.upRoute.map((v) => v.toJson()).toList();
    }
    if (this.downRoute != null) {
      data['downRoute'] =  this.downRoute.map((v) => v.toJson()).toList();
    }
    if (this.routeDoc != null) {
      data['routeDoc'] = this.routeDoc.toJson();
    }
    data['routeUpAndDownStr'] = this.routeUpAndDownStr;
    data['routeRate'] = this.routeRate;
    data['routeSource'] = this.routeSource;
    data['urlSource'] = this.urlSource;
    data['userIdSource'] = this.userIdSource;
    data['companyIdSource'] = this.companyIdSource;
    data['routeConditions'] = this.routeConditions;
    return data;
  }
}
