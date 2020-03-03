import 'package:api/api.dart';
import 'package:api/model/country_model.dart';

class CountryController extends ResourceController {
  CountryController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllCountries() async {
    final query = Query<CountryModel>(context);
    final countries = await query.fetch();
    return Response.ok(countries);
  }

  @Operation.get("id")
  Future<Response> getEntriesByCountryId(@Bind.path("id") int id) async {
    final query = Query<CountryModel>(context)
      ..where((h) => h.id).equalTo(id)
      ..join(set: (a) => a.entries);
    final country = await query.fetchOne();
    return Response.ok(country);
  }

  Future<Response> getAllCountryEntries() async {
    final query = Query<CountryModel>(context)..join(set: (a) => a.entries);
    final countries = await query.fetch();
    return Response.ok(countries);
  }

  @Operation.post()
  Future<Response> createNewCountry() async {
    final Map<String, dynamic> body = await request.body.decode();
    final firstQuery = Query<CountryModel>(context)
      ..where((country) => country.name).equalTo(body["name"] as String);

    final country = await firstQuery.fetchOne();

    if (country != null) {
      return Response.conflict();
    }

    final query = Query<CountryModel>(context)
      ..values.name = body["name"] as String;

    final insertedCountry = await query.insert();

    return Response.ok(insertedCountry);
  }

  Future<Response> getLatestCountryEntries() async {
    final query = Query<CountryModel>(context)
      ..where((country) => country.entries).isNotNull();

    query
        .join(set: (country) => country.entries)
        .sortBy((e) => e.timestamp, QuerySortOrder.descending);

    final countries = await query.fetch();

    countries.forEach(
      (country) {
        print(country.entries.length);

        if (country.entries.isNotEmpty)
          country.entries.removeRange(1, country.entries.length);
      },
    );

    return Response.ok(countries);
  }
}
