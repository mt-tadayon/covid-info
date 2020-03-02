import 'package:covid_19/Modells/countryModel.dart';
import 'package:covid_19/Widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

List<CountryModel> countriesResult = [];

class StatisticsWidget extends StatefulWidget {
  @override
  _StatisticsWidgetState createState() => _StatisticsWidgetState();
}

class _StatisticsWidgetState extends State<StatisticsWidget> {
  TextEditingController _searchCountryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        CardWidget(
          icon: Icon(FontAwesome5Solid.globe),
          title: 'Globale Statistics',
          text: '''Infections: 30000
Death: 2000
Recoverd: 15874
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
              print(value);
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
              rows: countriesResult
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
      ],
    );
  }
}
