import 'package:care_plus_app/src/bloc/app_navigator_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNavigatorCubit extends Cubit<AppNavigatorState> {
  AppNavigatorCubit() : super(AppNavigatorInitial());

  routeToLogin() {
    emit(AppNavigatorLogin());
    emit(AppNavigatorInitial());
  }

  routeToSignup() {
    emit(AppNavigatorSignup());
    emit(AppNavigatorInitial());
  }

  routeToOtp() {
    emit(AppNavigatorOtp());
    emit(AppNavigatorInitial());
  }

  routeToHome() {
    emit(AppNavigatorHome());
    emit(AppNavigatorInitial());
  }

  routeToAgreement() {
    emit(AppNavigatorAgreement());
    emit(AppNavigatorInitial());
  }

}