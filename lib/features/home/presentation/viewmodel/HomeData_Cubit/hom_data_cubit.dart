import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_store/features/cart/presentation/view/cart_view.dart';
import 'package:our_store/features/favorite/presentation/view/fav_view.dart';
import 'package:our_store/features/home/data/models/HomeModel.dart';
import 'package:our_store/features/home/data/repo/home_repo.dart';
import 'package:our_store/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:our_store/features/home/presentation/viewmodel/Home_Cubit/home_cubit.dart';
import 'package:our_store/features/profile/presentation/view/profile_view.dart';

part 'hom_data_state.dart';

class HomDataCubit extends Cubit<HomDataState> {
  HomDataCubit(this._homeRepo) : super(HomDataInitial());
  final HomeRepo _homeRepo;
  static HomDataCubit get(context) => BlocProvider.of(context);
  Map<int, bool> inCart = {};
  Future<void> fetchHomeData(context)async{
    emit(HomDataLoading());
    var data = await _homeRepo.fetchHomeData();

    data.fold((fail){
      emit(HomDataFailure(fail.errMessage));
    }, (homeModel){
      homeModel.data!.products!.forEach((element) async{
        inCart.addAll({
          element.id!.toInt(): element.inCart!
        });
      });
      print(inCart);
      emit(HomDataSuccess(homeModel));
    });
  }
}
