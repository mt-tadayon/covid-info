import 'package:covid_19/models/countryModel.dart';
import 'package:covid_19/Widgets/card_widget.dart';
import 'package:covid_19/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';

class StatisticsWidget extends StatefulWidget {
  final AsyncSnapshot<List<CountryModel>> snapshot;

  const StatisticsWidget({this.snapshot});

  @override
  _StatisticsWidgetState createState() => _StatisticsWidgetState();
}

class _StatisticsWidgetState extends State<StatisticsWidget> {
  TextEditingController _searchCountryController = TextEditingController();

  String searchCountryName = '';

  @override
  Widget build(BuildContext context) {
    if (widget.snapshot.hasData) {
      CountryModel countryModel = widget.snapshot.data.first;

      return ListView(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
              '${S.of(context).informationFromText} ${DateFormat.yMd().format(DateTime.parse(countryModel.timestamp))} - UTC +1'),
        ),
        CardWidget(
            icon: Icon(FontAwesome5Solid.globe),
            title: S.of(context).globalStatisticTitle,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RowWidget(
                  title: S.of(context).confirmedTitle,
                  amount: countryModel.confirmed,
                ),
                RowWidget(
                  title: S.of(context).recoveredTitle,
                  amount: countryModel.recovered,
                ),
                RowWidget(
                  title: S.of(context).deathsTitle,
                  amount: countryModel.death,
                )
              ],
            )),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 7,
                child: TextField(
                  controller: _searchCountryController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      FontAwesome5Solid.search,
                    ),
                    hintText: S.of(context).countryNameHintText,
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchCountryName = value;
                    });
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  child: Icon(
                    FontAwesome5.times_circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  onTap: () {
                    setState(() {
                      searchCountryName = "";
                      _searchCountryController.clear();
                    });
                  },
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
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
                rows: widget.snapshot.data
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
          ),
        )
      ]);
    } else if (widget.snapshot.hasError) {
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
  }
}

class RowWidget extends StatelessWidget {
  final title;
  final amount;

  const RowWidget({Key key, this.title, this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Text("$title: "), Text(NumberFormat().format(amount))],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }
}
