import 'package:covid_19/screens/home/list_of_symptoms_widget.dart';
import 'package:covid_19/screens/home/question_card.dart';
import 'package:flutter/material.dart';

const medicineImageUrl = "assets/undraw/medicine.png";

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          elevation: 5.0,
          child: Column(
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
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: ListOfSymptomsWidget(),
        ),
        QuestionCard()
      ],
    );
  }
}
