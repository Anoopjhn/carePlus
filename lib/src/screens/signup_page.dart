import 'package:care_plus_app/src/bloc/app_navigator_cubit.dart';
import 'package:care_plus_app/src/bloc/app_navigator_state.dart';
import 'package:care_plus_app/src/bloc/authentication/authentication_cubit.dart';
import 'package:care_plus_app/src/utlis/app_config.dart';
import 'package:care_plus_app/src/utlis/app_font_styles.dart';
import 'package:care_plus_app/src/widgets/logins_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:sms_autofill/sms_autofill.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _mobController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _conPassController = TextEditingController();

  FacebookLogin _facebookLogin = FacebookLogin();
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLogin = false;
  User _user;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return MultiBlocListener(
      listeners: [
        BlocListener<AppNavigatorCubit, AppNavigatorState>(
          listener: (BuildContext context, state) {
            if (state is AppNavigatorOtp) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  state.route, (Route<dynamic> route) => false);
            }

            if (state is AppNavigatorLogin) {
              Navigator.of(context).pushNamed(state.route);
            }
            if(state is AppNavigatorHome){
              Navigator.of(context).pushNamedAndRemoveUntil(
                  state.route, (Route<dynamic> route) => false);
            }
          },
        ),
      ],
      child: Scaffold(
        body: Center(
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
              child: Stack(
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Color(0xff67D177),
                          Color(0xff67D177),
                          Color(0xff67D177),
                          Color(0xff67D177),
                        ])),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/2.png",
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                TextFormField(
                                  decoration: decoration("Mobile Number"),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.phone,
                                  style: AppFontStyle.headingTextStyle(
                                      Colors.white),
                                  validator: (val) => val.isEmpty
                                      ? "Enter a phone"
                                      : val.length == 10
                                          ? null
                                          : "Enter correct phone number",
                                  controller: _mobController,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                TextFormField(
                                  decoration: decoration("New Password"),
                                  textInputAction: TextInputAction.next,
                                  style: AppFontStyle.headingTextStyle(
                                      Colors.white),
                                  controller: _passController,
                                  validator: (val) =>
                                      val.isEmpty ? "Enter a password" : null,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                TextFormField(
                                  style: AppFontStyle.headingTextStyle(
                                      Colors.white),
                                  decoration: decoration("Confirm Password"),
                                  textInputAction: TextInputAction.done,
                                  controller: _conPassController,
                                  validator: (val) =>
                                      _passController.text.isEmpty
                                          ? null
                                          : val != _passController.text
                                              ? "Password doesn't match"
                                              : null,
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      final signcode =
                                          await SmsAutoFill().getAppSignature;
                                      print(signcode);
                                      BlocProvider.of<AppNavigatorCubit>(
                                              context)
                                          .routeToOtp();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16))),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 62.0, vertical: 8.0),
                                    child: Text(
                                      "Sign in",
                                      style: AppFontStyle.regularSmallTextStyle(
                                          AppConfig.primaryColor),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Already have an account? ",
                                      style: AppFontStyle.regularTextStyle(
                                          Colors.white),
                                    ),
                                    GestureDetector(
                                      child: Text(
                                        "Log in",
                                        style: AppFontStyle.headingTextStyle(
                                            Colors.white),
                                      ),
                                      onTap: () {
                                        BlocProvider.of<AppNavigatorCubit>(
                                                context)
                                            .routeToLogin();
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 1.0,
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "OR",
                                      style: AppFontStyle.headingTextStyle(
                                          Colors.white,
                                          textSize: 12.0),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                      height: 1.0,
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                SignInButton(
                                  Buttons.Facebook,
                                  text: "Sign up with Facebook",
                                  onPressed: () async {
                                    BlocProvider.of<AppAuthCubit>(context)
                                        .loginWithFB(context);
                                  },
                                ),
                                SignInButton(
                                  Buttons.Google,
                                  text: "Sign up with Google",
                                  onPressed: () {},
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                          color: Color(0x33E5E5E5),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(360),
                            topLeft: Radius.circular(70),
                          )),
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                          color: Color(0x33E5E5E5),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            topRight: Radius.circular(360),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future _handleLogin()async{
    FacebookLoginResult _result = await _facebookLogin.logIn(['email']);
    switch (_result.status){
      case FacebookLoginStatus.cancelledByUser:
        print("cancelledByUser");
        break;
      case FacebookLoginStatus.error:
        print("error");
        break;
      case FacebookLoginStatus.loggedIn:
        await _logininWithFacebook(_result);
      break;
    }
  }

  Future _logininWithFacebook(FacebookLoginResult _result) async {
    FacebookAccessToken _accessToken = _result.accessToken;
    AuthCredential _credential = FacebookAuthProvider.credential(_accessToken.token);
    var a = await _auth.signInWithCredential(_credential);
    setState(() {
      _isLogin = true;
      _user = a.user;
    });
  }

  Future _signOut() async {
    await  _auth.signOut().then((value){
      setState(() {
        _facebookLogin.logOut();
      });
    });
  }

}
