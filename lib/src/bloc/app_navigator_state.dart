import 'package:care_plus_app/src/utlis/constants.dart';
import 'package:equatable/equatable.dart';

abstract class AppNavigatorState extends Equatable {
  const AppNavigatorState();
}

class AppNavigatorInitial extends AppNavigatorState {
  @override
  List<Object> get props => [];
}

class AppNavigatorLogin extends AppNavigatorState {
  final String route = Constants.LOGIN_PAGE;

  @override
  List<Object> get props => [route];
}

class AppNavigatorSignup extends AppNavigatorState {
  final String route = Constants.SIGNUP_PAGE;

  @override
  List<Object> get props => [route];
}

class AppNavigatorOtp extends AppNavigatorState {
  final String route = Constants.OTP_PAGE;

  @override
  List<Object> get props => [route];
}
class AppNavigatorHome extends AppNavigatorState {
  final String route = Constants.HOME_PAGE;

  @override
  List<Object> get props => [route];
}

class AppNavigatorAgreement extends AppNavigatorState {
  final String route = Constants.AGREEMENT_PAGE;

  @override
  List<Object> get props => [route];
}

