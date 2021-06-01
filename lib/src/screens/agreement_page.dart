import 'package:care_plus_app/src/bloc/app_navigator_cubit.dart';
import 'package:care_plus_app/src/bloc/app_navigator_state.dart';
import 'package:care_plus_app/src/utlis/app_config.dart';
import 'package:care_plus_app/src/utlis/app_font_styles.dart';
import 'package:care_plus_app/src/utlis/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgreementPage extends StatefulWidget {
  @override
  _AgreementPageState createState() => _AgreementPageState();
}

class _AgreementPageState extends State<AgreementPage> {

  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AppNavigatorCubit, AppNavigatorState>(
          listener: (BuildContext context, state) {
            if (state is AppNavigatorAgreement) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  state.route, (Route<dynamic> route) => false);
            }
            if (state is AppNavigatorHome) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  state.route, (Route<dynamic> route) => false);
            }
            if (state is AppNavigatorSignup) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  state.route, (Route<dynamic> route) => false);
            }
          },
        )
      ],
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                text("Terms and Conditions"),
                SizedBox(height: 8,),
                 container("Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non enim praesent elementum facilisis leo, vel fringilla est ullamcorper eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque fermentum dui faucibus in ornare quam viverra orci sagittis eu volutpat odio facilisis mauris sit amet massa vitae tortor condimentum lacinia quis vel eros donec ac odio tempor orci dapibus ultrices in iaculis nunc sed augue lacus, viverra vitae congue eu, consequat ac felis donec et odio pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus faucibusLorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non enim praesent elementum facilisis leo, vel fringilla est ullamcorper eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque fermentum dui faucibus in ornare quam viverra orci sagittis eu volutpat odio facilisis mauris sit amet massa vitae tortor condimentum lacinia quis vel eros donec ac odio tempor orci dapibus ultrices in iaculis nunc sed augue lacus, viverra vitae congue eu, consequat ac felis donec et odio pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus faucibus orci dapibus ultrices in iaculis nunc sed augue lacus, viverra vitae congue eu, consequat ac felis donec et odio pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus faucibus"),
                SizedBox(height: 16.0,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: _isChecked,
                      activeColor: AppConfig.primaryColor,
                      onChanged: (bool value) {
                        setState(() {
                          _isChecked = value;
                        });
                      },
                    ),
                   Text("I agree the terms and conditions"),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    decline("decline", ()=> BlocProvider.of<AppNavigatorCubit>(context).routeToSignup(),),
                    accept("Accept",()=> _isChecked?BlocProvider.of<AppNavigatorCubit>(context).routeToHome():Loader.showToast(context, "Agree the terms and conditions ")
                    )],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Text text(String tittle){
  return Text(tittle, style: AppFontStyle.regularSmallTextStyle(AppConfig.blackColor, textSize: 26.0),);
}
Container container(String tittle){
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.rectangle,
      border: Border.all(color: Colors.black, width: 0.5),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(tittle, style: AppFontStyle.bodyTextStyle(AppConfig.blackColor, textSize: 13.0), textAlign: TextAlign.justify,
      ),
    ),
  );
}
OutlinedButton decline(String tittle, Function function){
  return OutlinedButton(
    onPressed: function,
    child: Text(tittle, style: AppFontStyle.regularTextStyle(AppConfig.primaryColor),),
    style: ElevatedButton.styleFrom(
      side: BorderSide(width: 1.0, color: AppConfig.primaryColor),
    )
  );
}

ElevatedButton accept(String tittle, Function fun){
  return ElevatedButton(
    onPressed: fun,
    child: Text(tittle, style: AppFontStyle.regularTextStyle(AppConfig.whiteColor),),
    style: ElevatedButton.styleFrom(
      primary: AppConfig.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0), // <-- Radius
      ),
    ),
  );
}
