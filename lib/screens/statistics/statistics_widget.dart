import 'package:covid_19/Modells/countryModel.dart';
import 'package:covid_19/Widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:covid_19/Service/fetch_data.dart';

class StatisticsWidget extends StatefulWidget {
  @override
  _StatisticsWidgetState createState() => _StatisticsWidgetState();
}

class _StatisticsWidgetState extends State<StatisticsWidget> {
  TextEditingController _searchCountryController = TextEditingController();
  Future<List<CountryModel>> futureCountriesResult;

  String searchCountryName = '';

  @override
  void initState() {
    futureCountriesResult = fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CountryModel>>(
      future: futureCountriesResult,
      builder:
          (BuildContext context, AsyncSnapshot<List<CountryModel>> snapshot) {
        if (snapshot.hasData) {
          return ListView(children: <Widget>[
            CardWidget(
              icon: Icon(FontAwesome5Solid.globe),
              title: 'Globale Statistics',
              text: '''Infections: ${snapshot.data.first.confirmed}
Death: ${snapshot.data.first.death}
Recoverd: ${snapshot.data.first.recovered}
          ''',
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _searchCountryController,
                decoration: InputDecoration(
                  hintText: 'Country name',
                ),
                onChanged: (value) {
                  searchCountryName = value;
                  setState(() {});
                },
              ),
            ),
            Card(
              elevation: 5.0,
              child: SingleChildScrollView(
                child: DataTable(
                  columnSpacing: 10.0,
                  columns: <DataColumn>[
                    DataColumn(label: Text('Country')),
                    DataColumn(label: Text('Confirmed')),
                    DataColumn(label: Text('Recoverd')),
                    DataColumn(label: Text('Deaths')),
                  ],
                  rows: snapshot.data
                      .where((data) {
                        if (data.countryName.contains('Total')) return false;
                        if (searchCountryName.isEmpty)
                          return true;
                        else {
                          return data.countryName
                              .toUpperCase()
                              .contains(searchCountryName.toUpperCase());
                        }
                      })
                      .map((data) => DataRow(cells: [
                            DataCell(Text(data.countryName)),
                            DataCell(Text(data.confirmed.toString())),
                            DataCell(Text(data.recovered.toString())),
                            DataCell(Text(data.death.toString()))
                          ]))
                      .toList(),
                ),
              ),
            )
          ]);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
