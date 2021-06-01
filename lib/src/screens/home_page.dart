import 'package:care_plus_app/src/screens/dashboard_page.dart';
import 'package:care_plus_app/src/screens/profile_page.dart';
import 'package:care_plus_app/src/screens/search_page.dart';
import 'package:care_plus_app/src/screens/studio_page.dart';
import 'package:care_plus_app/src/utlis/app_config.dart';
import 'package:care_plus_app/src/utlis/app_font_styles.dart';
import 'package:flutter/material.dart';

import 'booking_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: null,
      body: DefaultTabController(
        length: 5,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
            ),
            Scaffold(
              bottomNavigationBar: Padding(
                padding: EdgeInsets.only(bottom: 0),
                child: TabBar(tabs: [
                  Tab(icon: Icon(Icons.home), text: "Home", iconMargin: EdgeInsets.only(top: 12),),
                  Tab(icon: Icon(Icons.search),text: "Search", iconMargin: EdgeInsets.only(top: 12),),
                  Tab(icon: Icon(Icons.calendar_today_rounded),text: "Booking", iconMargin: EdgeInsets.only(top: 12),),
                  Tab(icon: Icon(Icons.radio),text: "Studio", iconMargin: EdgeInsets.only(top: 12),),
                  Tab(icon: Icon(Icons.person),text: "Profile", iconMargin: EdgeInsets.only(top: 12),),
                ],
                  labelColor: AppConfig.primaryColor,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(color: AppConfig.primaryColor, width: 4.0),
                    insets: EdgeInsets.only(bottom: 55),
                  ),
                  labelStyle: AppFontStyle.bodyTextStyle2(AppConfig.greyColor, textSize: 12.0),
                  unselectedLabelColor: Colors.grey ,
                ),
              ),
              body: TabBarView(children: [
                DashboardPage(),
                SearchPage(),
                BookingPage(),
                StudioPage(),
                ProfilePage()
              ]),
            )
          ],
        ),
      ),
    );
  }
}
