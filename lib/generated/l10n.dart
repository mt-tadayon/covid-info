// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

class S {
  S(this.localeName);
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return S(localeName);
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  final String localeName;

  String get navigationBarHome {
    return Intl.message(
      'Info',
      name: 'navigationBarHome',
      desc: '',
      args: [],
    );
  }

  String get navigationPrevention {
    return Intl.message(
      'Prevention',
      name: 'navigationPrevention',
      desc: '',
      args: [],
    );
  }

  String get navigationEmergency {
    return Intl.message(
      'Emergency',
      name: 'navigationEmergency',
      desc: '',
      args: [],
    );
  }

  String get appBarTitleHome {
    return Intl.message(
      'General Information',
      name: 'appBarTitleHome',
      desc: '',
      args: [],
    );
  }

  String get appBarTitlePrevention {
    return Intl.message(
      'Prevention',
      name: 'appBarTitlePrevention',
      desc: '',
      args: [],
    );
  }

  String get appBarTitleEmergency {
    return Intl.message(
      'Emergency',
      name: 'appBarTitleEmergency',
      desc: '',
      args: [],
    );
  }

  String get emergencyNumber {
    return Intl.message(
      'Emergency Number: 112',
      name: 'emergencyNumber',
      desc: '',
      args: [],
    );
  }

  String get emergencyNumberHint {
    return Intl.message(
      'This number is only eligible in Europe.',
      name: 'emergencyNumberHint',
      desc: '',
      args: [],
    );
  }

  String get symptomDryCaugh {
    return Intl.message(
      'Dry cough',
      name: 'symptomDryCaugh',
      desc: '',
      args: [],
    );
  }

  String get symptomPneumonia {
    return Intl.message(
      'Pneumonia',
      name: 'symptomPneumonia',
      desc: '',
      args: [],
    );
  }

  String get symptomSeriousBreathing {
    return Intl.message(
      'Serious breathing difficulties',
      name: 'symptomSeriousBreathing',
      desc: '',
      args: [],
    );
  }

  String get symptomFever {
    return Intl.message(
      'Fever',
      name: 'symptomFever',
      desc: '',
      args: [],
    );
  }

  String get symptomBreathing {
    return Intl.message(
      'Difficulty with breathing',
      name: 'symptomBreathing',
      desc: '',
      args: [],
    );
  }

  String get symptomExposedPerson {
    return Intl.message(
      'Have you been exposed to someone of the infected region?',
      name: 'symptomExposedPerson',
      desc: '',
      args: [],
    );
  }

  String get symptomExposedRegion {
    return Intl.message(
      'Have you been in one the infected region?',
      name: 'symptomExposedRegion',
      desc: '',
      args: [],
    );
  }

  String get checkSymptoms {
    return Intl.message(
      'Covid-19',
      name: 'checkSymptoms',
      desc: '',
      args: [],
    );
  }

  String get infectionInformation {
    return Intl.message(
      'If you have a fever, cough and difficulty breathing, seek medical attention and call in advance. Follow the directions of your local health authority.',
      name: 'infectionInformation',
      desc: '',
      args: [],
    );
  }

  String get considerWearingMask {
    return Intl.message(
      'Consider wearing a Mouth-Nose-Defence to secure emergency personnel and people.',
      name: 'considerWearingMask',
      desc: '',
      args: [],
    );
  }

  String get possibleInfection {
    return Intl.message(
      'Possible Infection',
      name: 'possibleInfection',
      desc: '',
      args: [],
    );
  }

  String get emergencyNumberDescription {
    return Intl.message(
      'If you feel very unwell and need immediately help consider calling the emergency number. \n\n Emergency Number: 112 \n\n This number is only eligible in Europe.',
      name: 'emergencyNumberDescription',
      desc: '',
      args: [],
    );
  }

  String get seekingForHelpTitle {
    return Intl.message(
      'Seeking for help',
      name: 'seekingForHelpTitle',
      desc: '',
      args: [],
    );
  }

  String get emergencyNumberTitle {
    return Intl.message(
      'Emergency Number',
      name: 'emergencyNumberTitle',
      desc: '',
      args: [],
    );
  }

  String get washHandTitle {
    return Intl.message(
      'Hände regelmäßig waschen',
      name: 'washHandTitle',
      desc: '',
      args: [],
    );
  }

  String get washHandText {
    return Intl.message(
      'Waschen Sie Ihre Hände regelmäßig und gründlich mit Wasser und Seife für 20 Sekunden.',
      name: 'washHandText',
      desc: '',
      args: [],
    );
  }

  String get keepDistanceTitle {
    return Intl.message(
      'Halten Sie 1-2 Meter Abstand',
      name: 'keepDistanceTitle',
      desc: '',
      args: [],
    );
  }

  String get keepDistanceText {
    return Intl.message(
      'Halten Sie einen Abstand von mindestens ein bis zwei Meter zwischen sich und Personen ein, die husten oder niesen.',
      name: 'keepDistanceText',
      desc: '',
      args: [],
    );
  }

  String get avoidTouchingTitle {
    return Intl.message(
      'Berühren Sie nicht Augen, Nase und Mund',
      name: 'avoidTouchingTitle',
      desc: '',
      args: [],
    );
  }

  String get avoidTouchingText {
    return Intl.message(
      'Hände berühren viele Oberflächen und können Viren aufnehmen. Einmal kontaminiert, können Hände das Virus auf Ihre Augen, Nase oder Mund übertragen. Von dort kann das Virus in Ihren Körper eindringen und Sie krank machen.',
      name: 'avoidTouchingText',
      desc: '',
      args: [],
    );
  }

  String get respiratoryHygieneTitle {
    return Intl.message(
      'Husten und Niesen in Elenbogen',
      name: 'respiratoryHygieneTitle',
      desc: '',
      args: [],
    );
  }

  String get respiratoryHygieneText {
    return Intl.message(
      'Stellen Sie sicher, dass Sie beim Husten oder Niesen Ihr Mund und Nase mit gebeugtem Ellbogen oder Taschentuch bedecken. Entsorgen Sie das gebrauchte Taschentuch danach sofort.',
      name: 'respiratoryHygieneText',
      desc: '',
      args: [],
    );
  }

  String get stayInformedTitle {
    return Intl.message(
      'Informieren Sie sich und befolgen Sie die Ratschläge des Robert Koch Institutes',
      name: 'stayInformedTitle',
      desc: '',
      args: [],
    );
  }

  String get stayInformedText {
    return Intl.message(
      'Bleiben Sie über die neuesten Entwicklungen zu COVID-19 auf dem Laufenden. Befolgen Sie die Anweisungen Ihrer Gesundheitsbehörde, damit Sie sich und andere vor COVID-19 schützen können.',
      name: 'stayInformedText',
      desc: '',
      args: [],
    );
  }

  String get unwellTitle {
    return Intl.message(
      'If you feel unwell',
      name: 'unwellTitle',
      desc: '',
      args: [],
    );
  }

  String get unwellDescription {
    return Intl.message(
      'Stay at home.',
      name: 'unwellDescription',
      desc: '',
      args: [],
    );
  }

  String get protectingOthersTitle {
    return Intl.message(
      'Protect others from getting sick.',
      name: 'protectingOthersTitle',
      desc: '',
      args: [],
    );
  }

  String get genericSymptoms {
    return Intl.message(
      'Generic symptoms',
      name: 'genericSymptoms',
      desc: '',
      args: [],
    );
  }

  String get seriousSymptoms {
    return Intl.message(
      'Serious symptoms',
      name: 'seriousSymptoms',
      desc: '',
      args: [],
    );
  }

  String get covid19Question {
    return Intl.message(
      'What is COVID-19?',
      name: 'covid19Question',
      desc: '',
      args: [],
    );
  }

  String get covid19Answer {
    return Intl.message(
      'COVID-19 is an infectious disease caused by the most recently discovered coronavirus. This new virus and infection were unknown before the outbreak began in Wuhan, China, in December 2019.',
      name: 'covid19Answer',
      desc: '',
      args: [],
    );
  }

  String get symtomsQuestion {
    return Intl.message(
      'What are the symptoms of COVID-19?',
      name: 'symtomsQuestion',
      desc: '',
      args: [],
    );
  }

  String get symtomsAnswer {
    return Intl.message(
      'Common Symptoms are dry cough, fever and difficulty to breath. In rare circumstances, it could lead to Pneumonia and severe breathing difficulties.',
      name: 'symtomsAnswer',
      desc: '',
      args: [],
    );
  }

  String get spreadQuestion {
    return Intl.message(
      'How does COVID-19 spread?',
      name: 'spreadQuestion',
      desc: '',
      args: [],
    );
  }

  String get spreadAnswer {
    return Intl.message(
      'The virus spread from other persons who are disposed of by the virus. The disease getting transferred by small droplets from the nose or mouth. This can happen if a person with COVID-19 coughs or exhales. This droplet goes on Surfaces and objects and from there with your hands to your eyes, nose and mouth.\n\n Additionally, the GHO recommends a distance of one meter to infected persons, because you can inhale the virus.',
      name: 'spreadAnswer',
      desc: '',
      args: [],
    );
  }

  String get worryQuestion {
    return Intl.message(
      'Should I worry about COVID-19?',
      name: 'worryQuestion',
      desc: '',
      args: [],
    );
  }

  String get worryAnswer {
    return Intl.message(
      'The risk of getting infected are at the moment low, if you have not travelled from one of the areas where it currently spreads or had contact with people who are affected and went to this region.\n\nHowever, it is understandable that you may feel stressed or anxious during the current situation. It makes sense to search for more information about the topic. Please be mindful that on the internet there is a lot of misinformation at the moment about the COVID-19 virus, try to stay calm and focus on the proven sources.\n\nGood sources for information are your current health provider, the local health authorities and the GHO (Global Health Organisation).\nhttps://www.who.int/\n\nEven if the disease is mild for most people, it can make some people seriously ill. For more information on how to protect yourself, read on at Prevention Tab or go to the following link.\n\nhttps://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public\n',
      name: 'worryAnswer',
      desc: '',
      args: [],
    );
  }

  String get incubationQuestion {
    return Intl.message(
      'How long is the incubation period of COVID-19?',
      name: 'incubationQuestion',
      desc: '',
      args: [],
    );
  }

  String get incubationAnswer {
    return Intl.message(
      'At the moment the general consents are that the incubation time is up to 14 days. This number is from the GHO und explains that the median is around five days. As soon as there are new informatio, we will update this.',
      name: 'incubationAnswer',
      desc: '',
      args: [],
    );
  }

  String get notToDoQuestion {
    return Intl.message(
      'What should I not do?',
      name: 'notToDoQuestion',
      desc: '',
      args: [],
    );
  }

  String get notToDoAnswer {
    return Intl.message(
      'Smoking, wearing multiple masks, taking traditional herbal remedies and taking self-medication such as antibiotics ARE NOT effective against COVID-2019 and can be harmful.\n\nIn any case, if you have fever, cough and difficulty breathing seek medical care early to reduce the risk of developing a more severe infection and be sure to share your recent travel history with your health care provider.',
      name: 'notToDoAnswer',
      desc: '',
      args: [],
    );
  }

  String get travelQuestion {
    return Intl.message(
      'Is the travel into a region save?',
      name: 'travelQuestion',
      desc: '',
      args: [],
    );
  }

  String get travelAnswer {
    return Intl.message(
      'Health recommendation for traveling can be found at your local Healthcare provider.',
      name: 'travelAnswer',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale('de', ''), Locale('en', ''),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}