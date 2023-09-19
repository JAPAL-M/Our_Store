part of 'hom_data_cubit.dart';

abstract class HomDataState extends Equatable {
  @override
  List<Object> get props => [];
  const HomDataState();
}

class HomDataInitial extends HomDataState {}
class HomDataLoading extends HomDataState {}
class HomDataSuccess extends HomDataState {
  final HomeModel homeModel;
  const HomDataSuccess(this.homeModel);
}
class HomDataFailure extends HomDataState {
  final String errmessage;
  const HomDataFailure(this.errmessage);
}
