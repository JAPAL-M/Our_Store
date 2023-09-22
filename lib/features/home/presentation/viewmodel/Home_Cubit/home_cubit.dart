import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_store/features/cart/presentation/view/cart_view.dart';
import 'package:our_store/features/cart/presentation/viewmodel/cart_cubit.dart';
import 'package:our_store/features/favorite/presentation/view/fav_view.dart';
import 'package:our_store/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:our_store/features/home/presentation/viewmodel/HomeData_Cubit/hom_data_cubit.dart';
import 'package:our_store/features/home/presentation/viewmodel/Home_Cubit/home_state.dart';
import 'package:our_store/features/profile/presentation/view/profile_view.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  void changeCurrentIndex(int index,context){
    currentIndex = index;
    if(currentIndex == 1){
      AddAndGetCartCubit.get(context).getItemFromCart(context);
    }
    emit(HomeBottomNavBarChange());
  }

  List<Widget> pages = const [
    HomeViewBody(),
    CartView(),
    FavoriteView(),
    ProfileView()
  ];



  void changeInCart(int id,context){
    HomDataCubit.get(context).inCart[id] = !HomDataCubit.get(context).inCart[id]!;
    emit(ChangeInCartStates());
  }


}