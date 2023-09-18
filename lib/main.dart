import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:our_store/core/local/cache_helper.dart';
import 'package:our_store/core/utils/api_services.dart';
import 'package:our_store/features/home/presentation/view/home_view.dart';
import 'package:our_store/features/login/data/repo/login_repo_impl.dart';
import 'package:our_store/features/login/presentation/viewmodel/login_cubit.dart';
import 'package:our_store/features/register/data/repo/register_repo_impl.dart';
import 'package:our_store/features/register/presentation/viewmodel/register_cubit.dart';
import 'package:our_store/features/splash/presentation/view/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
          BlocProvider(create: (create) => LoginCubit(LoginRepoImpl(ApiServices(Dio())))),
          BlocProvider(create: (create) => RegisterCubit(RegisterRepoImpl(ApiServices(Dio()))))
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          home: const SplashView(),
        ),
      ),
    );
  }
}
