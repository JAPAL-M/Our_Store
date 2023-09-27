part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  @override
  List<Object> get props => [];
  const ProfileState();
}

class ProfileInitial extends ProfileState {}
class GetProfileLoading extends ProfileState {}
class GetProfileSuccess extends ProfileState {
  final AuthModel authModel;
  const GetProfileSuccess(this.authModel);
}
class GetProfileFailure extends ProfileState {
  final String errmessage;
  const GetProfileFailure(this.errmessage);
}


class EditProfileLoading extends ProfileState {}
class EditProfileSuccess extends ProfileState {
  final AuthModel authModel;
  const EditProfileSuccess(this.authModel);
}
class EditProfileFailure extends ProfileState {
  final String errmessage;
  const EditProfileFailure(this.errmessage);
}