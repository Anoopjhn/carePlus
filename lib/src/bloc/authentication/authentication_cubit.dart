import 'package:care_plus_app/src/bloc/authentication/authentication_repository.dart';
import 'package:care_plus_app/src/bloc/models/loggedInUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'authentication_state.dart';

class AppAuthCubit extends Cubit<AuthenticationState>{
  AppAuthCubit() : super(AuthenticationUninitialized()){
    authentication = AuthenticationRepository();
  }
  AuthenticationRepository authentication;
  LoggedInUser _loggedInUser;
  String _token;

  String getToken()=>_token;

  LoggedInUser get loggedInUser => _loggedInUser;

  setUser(LoggedInUser value) {
    _loggedInUser = value;
  }

  Future<LoggedInUser> checkSessionLogin() async {
    emit(AuthenticationLoading());
    LoggedInUser loggedInUser = await authentication.getActiveUser();
    if(loggedInUser!=null){
      _token = await loggedInUser.user.getIdToken();
      setUser(loggedInUser);
      emit(AuthenticationAuthenticated(loggedInUser));
    }else{
      emit(AuthenticationUninitialized());
    }
    return loggedInUser;
  }


  loginWithFB(BuildContext buildContext) async{
    emit(AuthenticationLoading());
    try{
      LoggedInUser loggedInUser = await authentication.signInWithFacebook(context: buildContext);
      User user;
      if(loggedInUser!=null){
        user = loggedInUser.user;
        _token = await user.getIdToken();
        setUser(loggedInUser);
        emit(AuthenticationAuthenticated(loggedInUser));
      }else{
        emit(AuthenticationFailed("Login Failed, Please try again"));
      }
    }catch(ex){
      emit(AuthenticationFailed(ex.toString()));
    }

  }
}