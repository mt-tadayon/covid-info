import 'package:covid_19/generated/l10n.dart';
import 'package:covid_19/screens/emergency/emergency_widget.dart';
import 'package:covid_19/screens/home/home_screen_widget.dart';
import 'package:covid_19/screens/prevention_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

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
    super.dispose();
  }

  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        selectedTab = _controller.page.toInt();
      });
    });
    super.initState();
  }

  int selectedTab = 0;
  Text appBarTitle;

  @override
  Widget build(BuildContext context) {
    appBarTitle = appBarTitle ?? Text(S.of(context).appBarTitleHome);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
        child: PageView(
          controller: _controller,
          children: <Widget>[
            HomeScreenWidget(),
            PreventionWidget(),
            EmergencyWidget(),
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
            switch (selectedTab) {
              case 0:
                _controller.animateToPage(
                  tab,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.linear,
                );
                appBarTitle = Text(S.of(context).appBarTitleHome);
                break;
              case 1:
                _controller.animateToPage(tab,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeInOut);
                appBarTitle = Text(S.of(context).appBarTitlePrevention);
                break;
              case 2:
                _controller.animateToPage(tab,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeInOut);
                appBarTitle = Text(S.of(context).appBarTitleEmergency);
                break;
              default:
                appBarTitle = Text(S.of(context).appBarTitleHome);
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
}
