import 'package:care_plus_app/src/bloc/app_navigator_cubit.dart';
import 'package:care_plus_app/src/bloc/app_navigator_state.dart';
import 'package:care_plus_app/src/utlis/app_config.dart';
import 'package:care_plus_app/src/utlis/app_font_styles.dart';
import 'package:care_plus_app/src/utlis/tutorial_contents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TutorialPage extends StatefulWidget {
  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {

  int currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MultiBlocListener(
      listeners: [
        BlocListener<AppNavigatorCubit, AppNavigatorState>(
          listener: (BuildContext context, state) {
            if (state is AppNavigatorSignup) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  state.route, (Route<dynamic> route) => false);
            }
          },
        ),
      ],
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_,pos){
                  return Column(
                    children: [
                      SizedBox(height: size.height*0.2,),
                      Image.asset(contents[pos].image, width: double.infinity, height: size.height*0.35 ,fit: BoxFit.fill,),
                      Text(contents[pos].tittle, style: AppFontStyle.regularHeadingTextStyle(Colors.black),),
                      SizedBox(height: 6,),
                      Text(contents[pos].discription, style: AppFontStyle.bodyTextStyle2(Colors.black), textAlign: TextAlign.center,),
                    ],
                  );
                },

              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  contents.length,
                      (index) => buildDot(index, context),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(40),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    if (currentIndex == contents.length - 1) {
                      BlocProvider.of<AppNavigatorCubit>(context)
                          .routeToSignup();
                    }
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.bounceIn,
                    );
                  },
                  child: Text(currentIndex == contents.length -1 ?"Continue": "Next", style: AppFontStyle.regularSmallTextStyle(Colors.white),),
                  style: ElevatedButton.styleFrom(primary: AppConfig.primaryColor,shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppConfig.primaryColor,
      ),
    );
  }
}
