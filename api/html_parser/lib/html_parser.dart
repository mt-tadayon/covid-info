import 'package:html/parser.dart';
import 'package:html_parser/country.dart';
import 'package:http/http.dart' as http;

Future<List<CountryModel>> parseHTML() async {
  List<CountryModel> countries = [];

  var contents = await http.read('https://www.worldometers.info/coronavirus/');
  // var contents = await http.read('http://localhost:8888/');
  var document = parse(contents);

  var main_table = document.getElementById('main_table_countries');
  var nodeList = [];

  main_table.nodes.forEach(
    (node) => node.nodes.forEach(
      (node) {
        nodeList.add(node);
      },
    ),
  );
  nodeList.removeWhere((node) => node.text.trim() == '');
  nodeList.removeAt(0);

  nodeList.forEach((node) {
    String cases = node.children[1].text.trim();
    String deaths = node.children[3].text.trim();
    String recoveries = node.children[6].text.trim();
    String name = node.children[0].text.trim();
    cases = cases.replaceAll(',', '');
    deaths = deaths.replaceAll(',', '');
    recoveries = recoveries.replaceAll(',', '');
    name = cleanName(name);

    var country = CountryModel(
      countryName: name,
      cases: int.tryParse(cases) ?? 0,
      deaths: int.tryParse(deaths) ?? 0,
      recoveries: int.tryParse(recoveries) ?? 0,
    );
    countries.add(country);
  });

  return countries;
}

String cleanName(String name) {
  name = name.replaceAll('\n', ' ');
  var nameList = name.split(' ');
  nameList.removeWhere((string) => string.isEmpty);
  return nameList.join(' ');
}
