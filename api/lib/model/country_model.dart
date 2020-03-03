import 'package:api/api.dart';
import 'package:api/model/corona_entry.dart';

class CountryModel extends ManagedObject<_CountryModel>
    implements _CountryModel {}

class _CountryModel {
  @primaryKey
  int id;

  @Column(unique: true)
  String name;

  ManagedSet<CoronaEntry> entries;
}
