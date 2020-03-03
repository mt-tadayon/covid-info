import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration2 extends Migration { 
  @override
  Future upgrade() async {
   		database.alterColumn("_CountryModel", "name", (c) {c.isUnique = true;});
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {}
}
    