import 'package:care_plus_app/src/bloc/app_navigator_cubit.dart';
import 'package:care_plus_app/src/bloc/app_navigator_state.dart';
import 'package:care_plus_app/src/utlis/app_config.dart';
import 'package:care_plus_app/src/utlis/app_font_styles.dart';
import 'package:care_plus_app/src/widgets/logins_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _mobController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AppNavigatorCubit, AppNavigatorState>(
          listener: (BuildContext context, state) {
            if (state is AppNavigatorHome) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  state.route, (Route<dynamic> route) => false);
            }

            if (state is AppNavigatorSignup) {
              Navigator.of(context).pushNamed(
                  state.route);
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
                            ]
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/2.png",),
                                SizedBox(height: 12,),
                                TextFormField(
                                  decoration: decoration("Mobile Number"),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.phone,
                                  style: AppFontStyle.headingTextStyle(Colors.white),
                                  validator: (val)=>val.isEmpty?"Enter a phone":val.length==10?null:"Enter correct phone number",
                                  controller: _mobController,
                                ),
                                SizedBox(height: 12,),
                                TextFormField(
                                  decoration: decoration("Password"),
                                  textInputAction: TextInputAction.next,
                                  style: AppFontStyle.headingTextStyle(Colors.white),
                                  controller: _passController,
                                  validator: (val)=>val.isEmpty?"Enter a password":null,
                                ),
                                SizedBox(height: 18,),
                                ElevatedButton(onPressed: () async {
                                  if(_formKey.currentState.validate()){
                                    BlocProvider.of<AppNavigatorCubit>(context).routeToHome();
                                  }
                                },
                                  style: ElevatedButton.styleFrom(primary: Colors.white,shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)
                                  )),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                                    child: Text("Log in", style: AppFontStyle.regularSmallTextStyle(AppConfig.primaryColor),),

                                  ),
                                ),
                                SizedBox(height: 36,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Don't have an account yet? ", style: AppFontStyle.regularTextStyle(Colors.white),),
                                    GestureDetector(
                                      child: Text("Sign in", style: AppFontStyle.headingTextStyle(Colors.white),),
                                      onTap:(){
                                        BlocProvider.of<AppNavigatorCubit>(context).routeToSignup();
                                      },
                                    ),

                                  ],
                                ),
                                SizedBox(height: 16,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 1.0,
                                      width: MediaQuery.of(context).size.width*0.25,
                                      color: Colors.white
                                      ,),
                                    SizedBox(width: 8,),
                                    Text("OR", style: AppFontStyle.headingTextStyle(Colors.white, textSize: 12.0),),
                                    SizedBox(width: 8,),
                                    Container(
                                      height: 1.0,
                                      width: MediaQuery.of(context).size.width*0.25,
                                      color: Colors.white
                                      ,)
                                  ],
                                ),
                                SizedBox(height: 8,),
                                SignInButton(
                                  Buttons.Facebook,
                                  text: "Sign up with Facebook",
                                  onPressed: () {},
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
                      width: MediaQuery.of(context).size.width*0.6,
                      height: MediaQuery.of(context).size.height*0.4,
                      decoration: BoxDecoration(
                          color: Color(0x33E5E5E5),
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(360), topLeft: Radius.circular(70), )
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.4,
                      height: MediaQuery.of(context).size.height*0.2,
                      decoration: BoxDecoration(
                          color: Color(0x33E5E5E5),
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(360), )
                      ),
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
}
