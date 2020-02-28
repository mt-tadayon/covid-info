import 'package:covid_19/generated/l10n.dart';
import 'package:flutter/material.dart';

class ListOfSymptoms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              S.of(context).genericSymptoms,
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(height: 10),
            Text("- " + S.of(context).symptomDryCaugh),
            Text("- " + S.of(context).symptomFever),
            Text("- " + S.of(context).symptomBreathing),
            Divider(
              height: 20,
            ),
            Text(
              S.of(context).seriousSymptoms,
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(color: Colors.deepOrange),
            ),
            SizedBox(height: 10),
            Text("- " + S.of(context).symptomPneumonia),
            Text("- " + S.of(context).symptomSeriousBreathing),
          ],
        ),
      ),
    );
  }
}
