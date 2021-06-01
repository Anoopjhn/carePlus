import 'package:care_plus_app/src/api/api.dart';
import 'package:care_plus_app/src/bloc/models/loggedInUser.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationUninitialized extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  final LoggedInUser user;
  AuthenticationAuthenticated(this.user){
    user.user.getIdToken().then((value) => api.saveToken(value));
  }
  @override
  List<Object> get props => [user];
}

class AuthenticationFailed extends AuthenticationState {
  final String error;
  AuthenticationFailed(this.error);

  @override
  List<Object> get props => [error];

}

class AuthenticationLoading extends AuthenticationState {

  @override
  List<Object> get props => [];

}

class AuthenticationUpdating extends AuthenticationState {

  final LoggedInUser user;


  AuthenticationUpdating(this.user);

  @override
  List<Object> get props => [user];

}

class AuthenticationUpdated extends AuthenticationState {

  final LoggedInUser user;

  AuthenticationUpdated(this.user);

  @override
  List<Object> get props => [user];

}

class AuthenticationCleared extends AuthenticationState {

  @override
  List<Object> get props => [];

}