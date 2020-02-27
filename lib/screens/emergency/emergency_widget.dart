import 'package:covid_19/Widgets/card_widget.dart';
import 'package:covid_19/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class EmergencyWidget extends StatefulWidget {
  @override
  _EmergencyWidgetState createState() => _EmergencyWidgetState();
}

class _EmergencyWidgetState extends State<EmergencyWidget> {
  bool checkDryCaught = false;
  bool checkFever = false;
  bool checkBreathing = false;
  bool checkExposedPerson = false;
  bool checkExposedRegion = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: <Widget>[
          CardWidget(
            title: S.of(context).unwellTitle,
            text: S.of(context).unwellDescription,
            icon: Icon(FontAwesome5Solid.home),
          ),
          CardWidget(
            title: S.of(context).seekingForHelpTitle,
            text: S.of(context).infectionInformation,
            icon: Icon(FontAwesome5Solid.first_aid),
          ),
          CardWidget(
            title: S.of(context).protectingOthersTitle,
            text: S.of(context).considerWearingMask,
            icon: Icon(FontAwesome5Solid.theater_masks),
          ),
          CardWidget(
            title: S.of(context).emergencyNumberTitle,
            text: S.of(context).emergencyNumberDescription,
            icon: Icon(FontAwesome5Solid.phone),
          ),
        ],
      ),
    );
  }
}
