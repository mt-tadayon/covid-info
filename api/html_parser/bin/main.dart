import 'package:html_parser/html_parser.dart' as html_parser;
import 'package:html_parser/repository.dart';

Future<void> main(List<String> arguments) async {
  var production = false;
  if (arguments.isNotEmpty) {
    production = arguments.first == '--prod';
  }
  var countries = await html_parser.parseHTML();
  await addCountriesToDatabase(countries, production);
}
