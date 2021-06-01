import 'package:care_plus_app/src/bloc/app_navigator_cubit.dart';
import 'package:care_plus_app/src/bloc/app_navigator_state.dart';
import 'package:care_plus_app/src/utlis/app_config.dart';
import 'package:care_plus_app/src/utlis/app_font_styles.dart';
import 'package:care_plus_app/src/utlis/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpPage extends StatefulWidget {
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  TextEditingController _otpController = TextEditingController();
  @override
  void initState() {
    _listenOtp();
    super.initState();
  }

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
    if (state is AppNavigatorAgreement) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          state.route, (Route<dynamic> route) => false);
    }
    },
        )
      ],
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Center(child: Image.asset("assets/images/4.png", height: MediaQuery.of(context).size.height*0.35)),
                  SizedBox(height: 12,),
                  Text("Phone Verification", style: AppFontStyle.regularHeadingTextStyle(AppConfig.blackColor),),
                  Text("We need to register your phone numbe before getting started!", style: AppFontStyle.bodyTextStyle2(AppConfig.blackColor), textAlign: TextAlign.center,),
                  SizedBox(height: 18,),
                  Form(
                    child: Container(
                      child: PinFieldAutoFill(
                        controller: _otpController,
                        decoration: UnderlineDecoration(
                          textStyle: TextStyle(fontSize: 20, color: Colors.black),
                          colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
                        ),
                        codeLength: 4,
                        autoFocus: true,
                        currentCode: "",
                        keyboardType: TextInputType.number,


                      ),
                    ),
                  ),
                  SizedBox(height: 18,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (){
                        if(_otpController.text.isEmpty){
                          Loader.showToast(context, "Enter OTP");
                        }
                        else if(_otpController.text.length!=4){
                          Loader.showToast(context, "Enter Correct OTP");
                        }
                        else if(_otpController.text.length==4){
                          BlocProvider.of<AppNavigatorCubit>(context).routeToAgreement();
                        }
                      },
                      child: Text("Verify OTP", style: AppFontStyle.regularSmallTextStyle(AppConfig.whiteColor),),
                      style: ElevatedButton.styleFrom(primary: AppConfig.primaryColor,shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                      )),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(onPressed: (){}, child: Text("Edit PhoneNumber?", style: AppFontStyle.regularTextStyle(AppConfig.blackColor),)),
                      MaterialButton(onPressed: (){}, child: Text("Resend OTP", style: AppFontStyle.headingTextStyle(AppConfig.primaryColor))),

                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _listenOtp() async {
     await SmsAutoFill().listenForCode;
  }
}
