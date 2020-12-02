class SearchListModel {
  int total;
  List<CompoundsModel> compounds;
  SearchListModel({this.total, this.compounds});

  SearchListModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    compounds = new List<CompoundsModel>();
    (json['compounds'] as List).forEach((v) {
      compounds.add(new CompoundsModel.fromJson(v));
    });
    //   CompoundsModel(
    //   json.map((i) => CompoundsModel.fromJson((i))).toList()
    // );
  }
}

class CompoundsModel {
  int id;
  String cas;
  String cn_name;
  String struct_image;
  int store_total;
  int is_hazardous;
  String cnNameAlias;
  String formula;

  CompoundsModel(
      {this.id,
      this.cas,
      this.cn_name,
      this.struct_image,
      this.store_total,
      this.is_hazardous,
      this.cnNameAlias,
      this.formula});

  CompoundsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cas = json['cas'];
    cn_name = json['cn_name'];
    struct_image = json['struct_image'];
    store_total = json['store_total'];
    is_hazardous = json['is_hazardous'];

    List cnn = json['cnNameAlias'];
    if (cnn.length > 0) {
      cnNameAlias = cnn[0];
    } else {
      cnNameAlias = 'cnn[0]';
    }

    formula = json['molStruc']['formula'];
  }
}
// flutter: {"total":10000,
// "compounds":
// [
//   {"id":2392490,
//   "cas":"75803-19-9",
//   "cn_name":"2-苯基丙基甲烷磺酸酯",
//   "cnNameAlias":[],
//   "molStruc":
//    {
//     "smiles":"CC(c1ccccc1)COS(=O)(=O)C",
//     "formula":"C10H14O3S",
//     "inchi":"InChI=1S/C10H14O3S/c1-9(8-13-14(2,11)12)10-6-4-3-5-7-10/h3-7,9H,8H2,1-2H3",
//     "molWeight":214.281,"exactMass":214.066,"numAtoms":28,"numBonds":28,
//     "numResidus":0,"psa":51.75,"logp":2.8471,"mr":55.878,"numRings":1,"sequence":"-"
//     },
//     "struct_image":"http://saasimg.molbase.net/mol_command/e6c90f065da24571b06105e140002b91.png",
//     "store_total":0,"is_hazardous":0
//     }
