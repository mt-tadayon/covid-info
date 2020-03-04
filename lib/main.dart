import 'package:covid_19/generated/l10n.dart';
import 'package:covid_19/screens/home_screen.dart';
import 'package:covid_19/admob_keys.dart';
import 'package:covid_19/theme.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:platform/platform.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  var id;
  if (LocalPlatform().isAndroid) id = appIdAndroid;
  if (LocalPlatform().isIOS) id = appIdiOS;
  if (!LocalPlatform().isAndroid && !LocalPlatform().isIOS) throw Error();

  FirebaseAdMob.instance.initialize(appId: id);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Covid Info',
      theme: defaultTheme,
      home: HomeScreen(),
    );
  }
}
