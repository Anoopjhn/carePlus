import 'package:care_plus_app/src/utlis/app_config.dart';
import 'package:care_plus_app/src/utlis/app_font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_greetings/flutter_greetings.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}



class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(children: [
            RichText(
              text: TextSpan(
                  children: [
                    TextSpan(text:YonoGreetings.showGreetings()+", \n",style: AppFontStyle.regularTextStyle(AppConfig.primaryColor)),
                    TextSpan(text:' \t \t  \t ' + "Anoop John",style: AppFontStyle.regularHeadingTextStyle(AppConfig.blackColor)),
                  ]
              ),
            ),
          ],)
        ],
      ),
    );
  }
}
