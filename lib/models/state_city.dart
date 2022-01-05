class StateCityModel {
  String state;
  String alias;
  List<String> cities;

  StateCityModel(
      {required this.state, required this.alias, required this.cities});

  factory StateCityModel.fromJson(Map<String, dynamic> json) =>
      StateCityModel(
          state: json['state'],
          alias: json['alias'],
          cities: json['cities'].cast<String>());

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['state'] = state;
    data['alias'] = alias;
    data['cities'] = cities;
    return data;
  }
}