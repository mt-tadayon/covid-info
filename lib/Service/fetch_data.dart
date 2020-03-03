import 'dart:convert';
import 'package:covid_19/Modells/countryModel.dart';
import 'package:http/http.dart' as http;

Future<List<CountryModel>> fetchCountryData() async {
  var url = 'https://covid-api.herokuapp.com/api/country/latest';

  final response = await http.get(url);

  if (response.statusCode == 200) {
    //If the server return a 200 OK response, then parse the JSON
    List<dynamic> jsonBody = jsonDecode(response.body);
    List<CountryModel> countries = jsonBody
        .map((countryJson) => CountryModel.fromJson(countryJson))
        .toList();
    countries.sort((a, b) => b.confirmed.compareTo(a.confirmed));
    return countries;
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('Failed to load data');
  }
}
