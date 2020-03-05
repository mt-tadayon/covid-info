import 'package:flutter/material.dart';

import '../theme.dart';

class CardWidget extends StatelessWidget {
  CardWidget({
    @required this.title,
    this.text,
    this.icon,
    this.child,
    Key key,
  }) : super(key: key);

  final String title;
  final String text;
  final Icon icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
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
              subtitle: text == null ? child : Text(text),
            ),
          ),
        ),
      ),
    );
  }
}
