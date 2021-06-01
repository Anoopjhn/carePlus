import 'package:care_plus_app/src/screens/agreement_page.dart';
import 'package:care_plus_app/src/screens/home_page.dart';
import 'package:care_plus_app/src/screens/login_page.dart';
import 'package:care_plus_app/src/screens/otp_page.dart';
import 'package:care_plus_app/src/screens/signup_page.dart';
import 'package:care_plus_app/src/screens/tutorial_page.dart';
import 'package:care_plus_app/src/utlis/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/app_navigator_cubit.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final AppNavigatorCubit _appNavigatorCubit = AppNavigatorCubit();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=> _appNavigatorCubit)
      ],
      child: MaterialApp(
        title: 'CarePlus',
        theme: ThemeData(
            backgroundColor: Colors.white,
            primarySwatch: Colors.red,
            visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          Constants.TUTORIAL_PAGE : (context) => TutorialPage(),
          Constants.SIGNUP_PAGE : (context) => SignupPage(),
          Constants.LOGIN_PAGE : (context) => LoginPage(),
          Constants.OTP_PAGE : (context) => OtpPage(),
          Constants.HOME_PAGE : (context) => HomePage(),
          Constants.AGREEMENT_PAGE : (context) => AgreementPage(),
        },
        initialRoute: Constants.TUTORIAL_PAGE,
      ),
    );
  }
}
