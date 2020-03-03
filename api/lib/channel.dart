import 'package:api/controller/corona_controller.dart';
import 'package:api/controller/country_controller.dart';
import 'api.dart';

class ApiConfiguration extends Configuration {
  ApiConfiguration(String fileName) : super.fromFile(File(fileName));

  DatabaseConfiguration database;
}

class ApiChannel extends ApplicationChannel {
  ManagedContext context;

  @override
  Future prepare() async {
    final config = ApiConfiguration(options.configurationFilePath);
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
      config.database.username,
      config.database.password,
      config.database.host,
      config.database.port,
      config.database.databaseName,
    );

    context = ManagedContext(dataModel, persistentStore);
  }

  @override
  Controller get entryPoint {
    final router = Router();

    // Prefer to use `link` instead of `linkFunction`.
    // See: https://aqueduct.io/docs/http/request_controller/
    router.route("/api/corona/[:id]").link(
          () => CoronaController(context),
        );

    router.route("/api/country/entries").linkFunction(
          (req) async =>
              await CountryController(context).getAllCountryEntries(),
        );
    router.route("/api/country/latest").linkFunction(
          (req) async =>
              await CountryController(context).getLatestCountryEntries(),
        );

    router.route("/api/country/[:id]").link(
          () => CountryController(context),
        );

    return router;
  }
}
