import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_store/features/cart/presentation/view/cart_view.dart';
import 'package:our_store/features/cart/presentation/viewmodel/AddAndGetCart_Cubit/cart_cubit.dart';
import 'package:our_store/features/favorite/presentation/view/fav_view_body.dart';
import 'package:our_store/features/favorite/presentation/viewmodel/favorite_cubit.dart';
import 'package:our_store/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:our_store/features/home/presentation/viewmodel/HomeData_Cubit/hom_data_cubit.dart';
import 'package:our_store/features/home/presentation/viewmodel/Home_Cubit/home_state.dart';
import 'package:our_store/features/orders/presentation/viewmodel/order_cubit.dart';
import 'package:our_store/features/profile/presentation/view/profile_view.dart';
import 'package:our_store/features/profile/presentation/viewmodel/profile_cubit.dart';


class HomeCubit extends Cubit<HomeState>{
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  void changeCurrentIndex(int index,context){
    currentIndex = index;
    if(currentIndex == 0 || currentIndex == 1){
      AddAndGetCartCubit.get(context).getItemFromCart(context);
    }else if(currentIndex == 2){
      FavoriteCubit.get(context).getItemFromFavorite();
    }else if (currentIndex == 3) {
      OrderCubit.get(context).getOrder();
      ProfileCubit.get(context).getProfile();
    }
    emit(HomeBottomNavBarChange());
  }

  List<Widget> pages = const [
    HomeViewBody(),
    CartView(),
    FavoriteViewBody(),
    ProfileView()
  ];


int addCart = 0;
  void changeInCart(int id,context){
    HomDataCubit.get(context).inCart[id] = !HomDataCubit.get(context).inCart[id]!;
    emit(ChangeInCartStates());
  }

  void changeInFav(int id,context){
    HomDataCubit.get(context).inFav[id] = !HomDataCubit.get(context).inFav[id]!;
    emit(ChangeInCartStates());
  }


}