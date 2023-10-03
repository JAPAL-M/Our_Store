import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_store/features/register/data/repo/register_repo.dart';

import '../../../../core/models/AuthModel.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final RegisterRepo registerRepo;
  Future<void> sendLoginData({required String name,required String pass,required String email,required String phone}) async{
    emit(RegisterLoading());
    var result = await registerRepo.sendRegisterData(email: email, pass: pass, name: name, phone: phone);
    result.fold((fail){
      emit(RegisterFailure(fail.errMessage));
    }, (loginModel){
      emit(RegisterSuccess(loginModel));
    });
  }
}