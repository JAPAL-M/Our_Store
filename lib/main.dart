import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:our_store/core/local/cache_helper.dart';
import 'package:our_store/core/utils/Bloc_Observer.dart';
import 'package:our_store/core/utils/api_services.dart';
import 'package:our_store/features/Address/data/repo/address_repo_impl.dart';
import 'package:our_store/features/Address/presentation/viewmodel/Address_Data_Cubit/address_data_cubit.dart';
import 'package:our_store/features/cart/data/repo/cart_repo_impl.dart';
import 'package:our_store/features/cart/presentation/viewmodel/AddAndGetCart_Cubit/cart_cubit.dart';
import 'package:our_store/features/checkout/data/models/ApiKey.dart';
import 'package:our_store/features/checkout/presentation/viewmodel/checkout_cubit.dart';
import 'package:our_store/features/favorite/data/repo/fav_repo_impl.dart';
import 'package:our_store/features/favorite/presentation/viewmodel/favorite_cubit.dart';
import 'package:our_store/features/home/data/repo/home_repo_impl.dart';
import 'package:our_store/features/home/presentation/viewmodel/HomeData_Cubit/hom_data_cubit.dart';
import 'package:our_store/features/home/presentation/viewmodel/Home_Cubit/home_cubit.dart';
import 'package:our_store/features/login/data/repo/login_repo_impl.dart';
import 'package:our_store/features/login/presentation/viewmodel/login_cubit.dart';
import 'package:our_store/features/orders/data/repo/order_repo_impl.dart';
import 'package:our_store/features/orders/presentation/viewmodel/order_cubit.dart';
import 'package:our_store/features/profile/data/repo/profile_repo_impl.dart';
import 'package:our_store/features/profile/presentation/viewmodel/profile_cubit.dart';
import 'package:our_store/features/register/data/repo/register_repo_impl.dart';
import 'package:our_store/features/register/presentation/viewmodel/register_cubit.dart';
import 'package:our_store/features/search/data/repo/search_repo_impl.dart';
import 'package:our_store/features/search/presentation/viewmodel/search_cubit.dart';
import 'package:our_store/features/splash/presentation/view/splash_view.dart';
import 'features/Address/presentation/viewmodel/Address_View_Cubit/address_cubit.dart';
import 'features/cart/presentation/viewmodel/UpdateCart_Cubit/update_cart_cubit.dart';
import 'features/orderDetails/presentation/viewmodel/Order_Details_Cubit/order_details_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = ApiKey.publishableKey;
  Bloc.observer = MyBlocObserver();
  CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (create) =>
                  LoginCubit(LoginRepoImpl(ApiServices(Dio())))),
          BlocProvider(
              create: (create) =>
                  RegisterCubit(RegisterRepoImpl(ApiServices(Dio())))),
          BlocProvider(
              create: (create) => HomDataCubit(HomeRepoImpl(ApiServices(Dio())))
                ..fetchHomeData(context)),
          BlocProvider(create: (create) => HomeCubit()),
          BlocProvider(
              create: (create) =>
                  AddAndGetCartCubit(CartRepoImpl(ApiServices(Dio())))),
          BlocProvider(
              create: (create) =>
                  UpdateCartCubit(CartRepoImpl(ApiServices(Dio())))),
          BlocProvider(
              create: (create) =>
                  FavoriteCubit(FavoriteRepoImpl(ApiServices(Dio())))),
          BlocProvider(
              create: (create) =>
                  SearchCubit(SearchRepoImpl(ApiServices(Dio())))),
          BlocProvider(
              create: (create) =>
                  ProfileCubit(ProfileRepoImpl(ApiServices(Dio())))),
          BlocProvider(create: (create) => AddressCubit()),
          BlocProvider(
              create: (create) =>
                  AddressDataCubit(AddressRepoImpl(ApiServices(Dio())))
                    ..getAddress()),
          BlocProvider(create: (create) => CheckoutCubit()),
          BlocProvider(
              create: (create) =>
                  OrderCubit(OrderRepoImpl(ApiServices(Dio())))),
          BlocProvider(
              create: (create) =>
                  OrderDetailsCubit(OrderRepoImpl(ApiServices(Dio())))),
        ],
        child: GetMaterialApp(
          builder: EasyLoading.init(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          home: const SplashView(),
        ),
      ),
    );
  }
}
