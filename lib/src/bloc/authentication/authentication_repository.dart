import 'package:care_plus_app/src/bloc/models/loggedInUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class AuthenticationRepository{

  Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  Future<LoggedInUser> getActiveUser() async{
    await initializeFirebase();
    LoggedInUser loggedInUser;
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      User user =  auth.currentUser;
      if(user!=null){
        user.updateProfile(
          displayName: user.displayName,
        );
        loggedInUser =  await signUpRemote(user);
        loggedInUser.user = user;
      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {

      } else if (e.code == 'invalid-credential') {

      }
    } catch (e) {

    }
    return loggedInUser;
  }


  Future<LoggedInUser> signInWithFacebook({BuildContext context}) async {

    User user;
    LoggedInUser loggedInUser;
    FacebookLogin _facebookLogin = FacebookLogin();
    try {
      final FacebookLoginResult result = await _facebookLogin.logIn(['email']);
      final FacebookAccessToken accessToken =  result.accessToken;
      final FacebookAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(accessToken.token);
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      user = userCredential.user;
      if(user!=null){
        user.updateProfile(
          displayName: user.displayName,
        );
        loggedInUser  =  await signUpRemote(user);
        loggedInUser.user = user;
      }
    } on FirebaseAuthException catch (e) {
      throw(e.code);
      if (e.code == 'account-exists-with-different-credential') {

      } else if (e.code == 'invalid-credential') {
        print("Error Code ${e.code}");
      }
    } catch (ex) {
      throw(ex);
    }
    return loggedInUser;
  }

  Future<LoggedInUser> signUpRemote(User user){}

}