import 'package:covid_19/Modells/countryModel.dart';
import 'package:covid_19/Widgets/card_widget.dart';
import 'package:covid_19/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:covid_19/Service/fetch_data.dart';
import 'package:intl/intl.dart';

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '${S.of(context).informationFromText} ${DateFormat.yMd().format(DateTime.now())} - UTC +1'),
            ),
            CardWidget(
              icon: Icon(FontAwesome5Solid.globe),
              title: S.of(context).globalStatisticTitle,
              text:
                  '''${S.of(context).confirmedTitle}: ${snapshot.data.first.confirmed}
${S.of(context).deathsTitle}: ${snapshot.data.first.death}
${S.of(context).recoveredTitle}: ${snapshot.data.first.recovered}
          ''',
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _searchCountryController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    FontAwesome5Solid.search,
                  ),
                  hintText: S.of(context).countryNameHintText,
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
                    DataColumn(label: Text(S.of(context).countryTitle)),
                    DataColumn(label: Text(S.of(context).confirmedTitle)),
                    DataColumn(label: Text(S.of(context).recoveredTitle)),
                    DataColumn(label: Text(S.of(context).deathsTitle)),
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
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                FontAwesome5Solid.exclamation,
                color: Colors.grey,
                size: 40.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(S.of(context).errorMessage),
            ],
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
