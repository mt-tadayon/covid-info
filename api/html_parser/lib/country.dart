class CountryModel {
  CountryModel({this.countryName, this.deaths, this.recoveries, this.cases});
  String countryName;
  int deaths;
  int recoveries;
  int cases;

  Map<String, dynamic> toJson() => {
        'countryName': countryName,
        'cases': cases,
        'deaths': deaths,
        'recoveries': recoveries,
      };
}
