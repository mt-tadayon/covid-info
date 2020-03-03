import 'package:api/api.dart';
import 'package:api/model/country_model.dart';

class CoronaEntry extends ManagedObject<_CoronaEntry> implements _CoronaEntry {}

class _CoronaEntry {
  @primaryKey
  int id;

  @Column()
  DateTime timestamp;

  @Relate(#entries)
  CountryModel country;

  @Column()
  int cases;

  @Column()
  int deaths;

  @Column()
  int recoveries;
}
