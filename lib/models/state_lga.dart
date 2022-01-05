class StateLGAModel {
  String state;
  String alias;
  List<String> lgas;

  StateLGAModel(
      {required this.state, required this.alias, required this.lgas});

  factory StateLGAModel.fromJson(Map<String, dynamic> json) =>
      StateLGAModel(
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
