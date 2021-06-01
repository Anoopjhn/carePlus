import 'package:care_plus_app/src/utlis/app_font_styles.dart';
import 'package:flutter/material.dart';

InputDecoration decoration(String label){
  return InputDecoration(
    labelText: label,
    labelStyle: AppFontStyle.regularTextStyle4(Colors.white),
    focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 1)
    ),
    enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 1)
    ),
  );
}