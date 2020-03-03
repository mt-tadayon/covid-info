import 'package:api/api.dart';
import 'package:api/model/corona_entry.dart';
import 'package:api/model/country_model.dart';

class CoronaController extends ResourceController {
  CoronaController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getEntries() async {
    final entries = Query<CoronaEntry>(context);
    final coronaEntries = await entries.fetch();
    return Response.ok(coronaEntries);
  }

  @Operation.get('id')
  Future<Response> getCountryById(@Bind.path('id') int id) async {
    final countryQuery = Query<CoronaEntry>(context)
      ..where((h) => h.id).equalTo(id);

    final coronaEntry = await countryQuery.fetchOne();

    if (coronaEntry == null) {
      return Response.ok("Ok");
    }
    return Response.ok(coronaEntry);
  }

  @Operation.post()
  Future<Response> createNewEntry() async {
    final Map<String, dynamic> body = await request.body.decode();

    final countryQuery = Query<CountryModel>(context)
      ..where((h) => h.name).equalTo(body["countryName"] as String);

    final country = await countryQuery.fetchOne();

    if (country == null) {
      return Response.badRequest(body: "This country does not exist.");
    }

    final query = Query<CoronaEntry>(context)
      ..values.country.id = country.id
      ..values.timestamp = DateTime.now()
      ..values.deaths = body["deaths"] as int
      ..values.recoveries = body["recoveries"] as int
      ..values.cases = body["cases"] as int;

    final insertedEntry = await query.insert();

    return Response.ok(insertedEntry);
  }
}
