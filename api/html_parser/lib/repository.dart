import 'dart:convert';

import 'package:html_parser/country.dart';
import 'package:http/http.dart' as http;

void addCountriesToDatabase(List<CountryModel> countries, bool production) {
  var baseUrl =
      production ? 'https://covid-api.herokuapp.com' : 'http://localhost:8888';
  print(baseUrl);
  countries.forEach((country) async {
    try {
      var responseCountry = await http.post(
        Uri.encodeFull('$baseUrl/api/country'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'name': country.countryName}),
      );
      print(responseCountry.statusCode);

      var responseEntry = await http.post(
        Uri.encodeFull('$baseUrl/api/corona'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(country.toJson()),
      );
      print(responseEntry.statusCode);
    } catch (e) {
      print(e);
    }
  });

  print('Added new countries and all entries successful');
}
