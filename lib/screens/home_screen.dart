import 'package:covid_19/models/countryModel.dart';
import 'package:covid_19/services/fetch_data.dart';
import 'package:covid_19/admob_keys.dart';
import 'package:covid_19/generated/l10n.dart';
import 'package:covid_19/screens/emergency/emergency_widget.dart';
import 'package:covid_19/screens/home/home_widget.dart';
import 'package:covid_19/screens/prevention/prevention_widget.dart';
import 'package:covid_19/screens/statistics/statistics_widget.dart';
import 'package:covid_19/theme.dart';
import 'package:device_info/device_info.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:platform/platform.dart';
import 'package:share/share.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<CountryModel>> futureCountriesResult;

  BannerAd myBanner;
  double bannerHeight = 0;
  int selectedTab = 0;
  Text appBarTitle;
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    myBanner.dispose();
    super.dispose();
  }

  @override
  void initState() {
    futureCountriesResult = fetchCountryData();

    String platformSpecificAdId = getCorrectAdID();

    myBanner = BannerAd(
        adUnitId: platformSpecificAdId,
        size: AdSize.smartBanner,
        listener: (event) async {
          bannerHeight = await getAdSize();
          setState(() {});
        });

    myBanner
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
        anchorOffset: 50.0,
      );

    _controller.addListener(() {
      setState(() {
        selectedTab = _controller.page.toInt();
        setAppBarTitle(selectedTab);
      });
    });
    super.initState();
  }

  String getCorrectAdID() {
    var platformSpecificAdId = BannerAd.testAdUnitId;
    if (kReleaseMode) {
      if (LocalPlatform().isAndroid) {
        platformSpecificAdId = androidAdID;
      }

      if (LocalPlatform().isIOS) {
        platformSpecificAdId = iOSAdID;
      }
    }
    return platformSpecificAdId;
  }

  @override
  Widget build(BuildContext context) {
    appBarTitle = appBarTitle ?? Text(S.of(context).appBarTitleHome);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: EdgeInsets.only(
          bottom: bannerHeight,
        ),
        child: PageView(
          controller: _controller,
          children: <Widget>[
            HomeWidget(),
            FutureBuilder<List<CountryModel>>(
                future: futureCountriesResult,
                builder: (BuildContext context,
                    AsyncSnapshot<List<CountryModel>> snapshot) {
                  return StatisticsWidget(snapshot: snapshot);
                }),
            PreventionWidget(),
            EmergencyWidget(),
          ],
        ),
      ),
      appBar: AppBar(
        title: appBarTitle,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Share.share(
                S.of(context).shareButtonText,
                 subject: S.of(context).shareButtonSubject
              );
            },
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedTab,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: defaultColor.shade500,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (tab) {
          setState(() {
            selectedTab = tab;
            setAppBarTitle(tab);
            switch (selectedTab) {
              case 0:
                _controller.animateToPage(
                  tab,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.linear,
                );
                break;
              case 1:
                _controller.animateToPage(
                  tab,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.linear,
                );
                break;
              case 2:
                _controller.animateToPage(tab,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.linear);
                break;
              case 3:
                _controller.animateToPage(tab,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.linear);
                break;
              default:
                _controller.animateToPage(0,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.linear);
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesome5.hospital),
            title: Text(S.of(context).navigationBarHome),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesome5Solid.chart_line),
            title: Text(S.of(context).navigationStatistic),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesome5Solid.hands),
            title: Text(S.of(context).navigationPrevention),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesome.ambulance),
            title: Text(S.of(context).navigationEmergency),
          )
        ],
      ),
    );
  }

  Future<double> getAdSize() async {
    var deviceHeight = MediaQuery.of(context).size.height;
    var localPlatform = LocalPlatform();
    if (localPlatform.isAndroid) {
      if (deviceHeight <= 400) {
        return 32;
      } else if (deviceHeight > 400 && deviceHeight <= 720) {
        return 50;
      } else {
        return 90;
      }
    } else if (localPlatform.isIOS) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      IosDeviceInfo info = await deviceInfo.iosInfo;
      if (info.name.toLowerCase().contains("ipad")) {
        return 90;
      }

      if (MediaQuery.of(context).orientation == Orientation.portrait) {
        return 60;
      } else if (MediaQuery.of(context).orientation == Orientation.landscape) {
        return 32;
      }
    }
    return 0;
  }

  void setAppBarTitle(int tab) {
    switch (tab) {
      case 0:
        appBarTitle = Text(S.of(context).appBarTitleHome);
        break;
      case 1:
        appBarTitle = Text(S.of(context).appBarTitleStatistic);
        break;
      case 2:
        appBarTitle = Text(S.of(context).appBarTitlePrevention);
        break;
      case 3:
        appBarTitle = Text(S.of(context).appBarTitleEmergency);
        break;
      default:
        appBarTitle = Text(S.of(context).appBarTitleHome);
    }
  }
}
