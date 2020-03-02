import 'package:covid_19/Widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class StatisticsWidget extends StatelessWidget {
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
              rows: <DataRow>[
                DataRow(cells: [
                  DataCell(Text('Germany')),
                  DataCell(Text('150')),
                  DataCell(Text('58')),
                  DataCell(Text('0')),
                ]),DataRow(cells: [
                  DataCell(Text('Iran')),
                  DataCell(Text('150')),
                  DataCell(Text('58')),
                  DataCell(Text('0')),
                ]), DataRow(cells: [
                  DataCell(Text('France')),
                  DataCell(Text('150')),
                  DataCell(Text('58')),
                  DataCell(Text('0')),
                ]),DataRow(cells: [
                  DataCell(Text('Italy')),
                  DataCell(Text('150')),
                  DataCell(Text('58')),
                  DataCell(Text('0')),
                ]),DataRow(cells: [
                  DataCell(Text('New Zealand')),
                  DataCell(Text('150')),
                  DataCell(Text('58')),
                  DataCell(Text('0')),
                ]),
              ],
            ),
          ),
        )
      ],
    );
  }
}
