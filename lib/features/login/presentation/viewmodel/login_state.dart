part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
  const LoginState();
}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {
  final AuthModel loginModel;
  const LoginSuccess(this.loginModel);
}
class LoginFailure extends LoginState {
  final String errmessage;
  const LoginFailure(this.errmessage);
}
