import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_store/core/models/AuthModel.dart';
import 'package:our_store/features/login/data/repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final LoginRepo loginRepo;
  Future<void> sendLoginData({required String email,required String pass}) async{
    emit(LoginLoading());
    var result = await loginRepo.sendLoginData(email: email, pass: pass);
    result.fold((fail){
      emit(LoginFailure(fail.errMessage));
    }, (loginModel){
      emit(LoginSuccess(loginModel));
    });
  }
}
