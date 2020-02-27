import 'package:flutter/material.dart';

import '../theme.dart';

class CardWidget extends StatelessWidget {
  CardWidget({
    @required this.title,
    @required this.text,
    this.icon,
    Key key,
  }) : super(key: key);

  final String title;
  final String text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTileTheme(
          iconColor: defaultColor.shade500,
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.title,
              ),
            ),
            leading: icon,
            subtitle: Text(text),
          ),
        ),
      ),
    );
  }
}
