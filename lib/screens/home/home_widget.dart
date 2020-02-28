import 'package:covid_19/generated/l10n.dart';
import 'package:covid_19/screens/home/question_card.dart';
import 'package:flutter/material.dart';

const medicineImageUrl = "assets/undraw/medicine.png";

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "COVID-19 - Coronavirus",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Divider(),
            Image.asset(medicineImageUrl),
          ],
        ),
        QuestionCard(
          question: S.of(context).covid19Question,
          answer: S.of(context).covid19Answer,
        ),
        QuestionCard(
          question: S.of(context).symtomsQuestion,
          answer: S.of(context).symtomsAnswer,
        ),
        QuestionCard(
          question: S.of(context).spreadQuestion,
          answer: S.of(context).spreadAnswer,
        ),
        QuestionCard(
          question: S.of(context).worryQuestion,
          answer: S.of(context).worryAnswer,
        ),
        QuestionCard(
          question: S.of(context).incubationQuestion,
          answer: S.of(context).incubationAnswer,
        ),
        QuestionCard(
          question: S.of(context).notToDoQuestion,
          answer: S.of(context).notToDoAnswer,
        ),
        QuestionCard(
          question: S.of(context).travelQuestion,
          answer: S.of(context).travelAnswer,
        )
      ],
    );
  }
}
