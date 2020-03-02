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
      ],
    );
  }
}
