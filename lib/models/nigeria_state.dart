class NigerianStateModel {
  String state;
  String alias;
  List<String> lgas;

  NigerianStateModel(
      {required this.state, required this.alias, required this.lgas});

  factory NigerianStateModel.fromJson(Map<String, dynamic> json) =>
      NigerianStateModel(
          state: json['state'],
          alias: json['alias'],
          lgas: json['lgas'].cast<String>());

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['state'] = state;
    data['alias'] = alias;
    data['lgas'] = lgas;
    return data;
  }
}
