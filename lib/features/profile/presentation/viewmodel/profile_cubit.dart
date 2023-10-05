import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_store/core/models/AuthModel.dart';
import 'package:our_store/features/profile/data/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepo) : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);
  final ProfileRepo _profileRepo;

  Future<void> getProfile() async {
    var data = await _profileRepo.getProfile();

    data.fold((fail) {
      emit(GetProfileFailure(fail.errMessage));
    }, (authModel) {
      emailController.text = authModel.data!.email.toString();
      phoneController.text = authModel.data!.phone.toString();
      nameController.text = authModel.data!.name.toString();
      emit(GetProfileSuccess(authModel));
    });
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Future<void> editProfile() async {
    emit(EditProfileLoading());
    var data = await _profileRepo.editProfile(
        name: nameController.text,
        phone: phoneController.text,
        email: emailController.text,
        pass: passController.text);

    data.fold((fail) {
      emit(EditProfileFailure(fail.errMessage));
    }, (authModel) {
      getProfile();
      emit(EditProfileSuccess(authModel));
    });
  }
}
