class CountryModel {
  String countryName;
  int confirmed;
  int recovered;
  int death;

  CountryModel({this.countryName, this.confirmed, this.recovered, this.death});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
        countryName : json['name'],
        confirmed : json['entries'][0]['cases'],
        recovered : json['entries'][0]['recoveries'],
        death : json['entries'][0]['deaths']
    );
  }
}