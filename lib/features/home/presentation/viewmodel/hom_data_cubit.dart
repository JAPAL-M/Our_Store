import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:our_store/features/home/data/models/HomeModel.dart';
import 'package:our_store/features/home/data/repo/home_repo.dart';

part 'hom_data_state.dart';

class HomDataCubit extends Cubit<HomDataState> {
  HomDataCubit(this._homeRepo) : super(HomDataInitial());
  final HomeRepo _homeRepo;

  Future<void> fetchHomeData()async{
    emit(HomDataLoading());
    var data = await _homeRepo.fetchHomeData();

    data.fold((fail){
      emit(HomDataFailure(fail.errMessage));
    }, (homeModel){
      emit(HomDataSuccess(homeModel));
    });
  }
}
