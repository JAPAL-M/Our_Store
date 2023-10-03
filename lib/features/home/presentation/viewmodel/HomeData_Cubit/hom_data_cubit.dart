import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_store/features/cart/presentation/viewmodel/AddAndGetCart_Cubit/cart_cubit.dart';
import 'package:our_store/features/home/data/models/HomeModel.dart';
import 'package:our_store/features/home/data/repo/home_repo.dart';

part 'hom_data_state.dart';

class HomDataCubit extends Cubit<HomDataState> {
  HomDataCubit(this._homeRepo) : super(HomDataInitial());
  final HomeRepo _homeRepo;
  static HomDataCubit get(context) => BlocProvider.of(context);

  Map<int, bool> inCart = {};
  Map<int, bool> inFav = {};
  Map<int, List<String>> imagesProduct = {};

  Future<void> fetchHomeData(context)async{
    emit(HomDataLoading());
    var data = await _homeRepo.fetchHomeData();

    data.fold((fail){
      emit(HomDataFailure(fail.errMessage));
    }, (homeModel){
      homeModel.data!.products!.forEach((element) async{
        imagesProduct.addAll({
          element.id!.toInt(): element.images!
        });
        inCart.addAll({
          element.id!.toInt(): element.inCart!
        });
        inFav.addAll({
          element.id!.toInt(): element.inFavorites!
        });
      });
      emit(HomDataSuccess(homeModel));
    });
  }
}
