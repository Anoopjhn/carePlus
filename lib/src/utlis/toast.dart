import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Loader{
  static showToast(BuildContext context,String message){
    Fluttertoast.showToast(
      msg: "$message",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,

    );
  }

  static toast(BuildContext context, String msg){
    return null;
  }

}