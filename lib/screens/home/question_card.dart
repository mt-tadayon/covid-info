import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    this.question,
    this.answer,
    Key key,
  }) : super(key: key);

  final String question;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: ExpansionTile(
        title: Text(question ?? 'Question'),
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(left: 10.0, bottom: 10.0, right: 10.0),
            child: Text(answer ?? 'Answer'),
          ),
        ],
      ),
    );
  }
}
