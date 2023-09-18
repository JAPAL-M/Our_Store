part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  @override
  List<Object> get props => [];
  const RegisterState();
}

class RegisterInitial extends RegisterState {}
class RegisterLoading extends RegisterState {}
class RegisterSuccess extends RegisterState {
  final AuthModel registerModel;
  const RegisterSuccess(this.registerModel);
}
class RegisterFailure extends RegisterState {
  final String errmessage;
  const RegisterFailure(this.errmessage);
}
