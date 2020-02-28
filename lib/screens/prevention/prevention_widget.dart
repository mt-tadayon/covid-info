import 'package:covid_19/Widgets/card_widget.dart';
import 'package:covid_19/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class PreventionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        CardWidget(
          title: S.of(context).washHandTitle,
          text: S.of(context).washHandText,
          icon: Icon(FontAwesome5Solid.user_shield),
        ),
        CardWidget(
          title: S.of(context).keepDistanceTitle,
          text: S.of(context).keepDistanceText,
          icon: Icon(FontAwesome5Solid.user_friends),
        ),
        CardWidget(
          title: S.of(context).avoidTouchingTitle,
          text: S.of(context).avoidTouchingText,
          icon: Icon(FontAwesome5Solid.ban),
        ),
        CardWidget(
          title: S.of(context).respiratoryHygieneTitle,
          text: S.of(context).respiratoryHygieneText,
          icon: Icon(FontAwesome5Solid.biohazard),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: CardWidget(
            title: S.of(context).stayInformedTitle,
            text: S.of(context).stayInformedText,
            icon: Icon(FontAwesome5Solid.info_circle),
          ),
        ),
      ],
    );
  }
}
