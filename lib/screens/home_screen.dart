import 'package:covid_19/admob_keys.dart';
import 'package:covid_19/generated/l10n.dart';
import 'package:covid_19/screens/emergency/emergency_widget.dart';
import 'package:covid_19/screens/home/home_widget.dart';
import 'package:covid_19/screens/prevention/prevention_widget.dart';
import 'package:covid_19/screens/statistics/statistics_widget.dart';
import 'package:device_info/device_info.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:platform/platform.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  BannerAd myBanner;
  double bannerHeight = 0;
  int selectedTab = 0;
  Text appBarTitle;

  @override
  Widget build(BuildContext context) {
    appBarTitle = appBarTitle ?? Text(S.of(context).appBarTitleHome);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 10.0,
          left: 20,
          right: 20,
          bottom: bannerHeight,
        ),
        child: PageView(
          controller: _controller,
          children: <Widget>[
            HomeWidget(),
            PreventionWidget(),
            EmergencyWidget(),
            StatisticsWidget(),
          ],
        ),
      ),
      appBar: AppBar(
        title: appBarTitle,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedTab,
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
                _controller.animateToPage(tab,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeInOut);
                break;
              case 2:
                _controller.animateToPage(tab,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeInOut);
                break;
              default:
                _controller.animateToPage(0,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeInOut);
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesome5.hospital),
            title: Text(S.of(context).navigationBarHome),
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
        appBarTitle = Text(S.of(context).appBarTitlePrevention);
        break;
      case 2:
        appBarTitle = Text(S.of(context).appBarTitleEmergency);
        break;
      default:
        appBarTitle = Text(S.of(context).appBarTitleHome);
    }
  }
}
