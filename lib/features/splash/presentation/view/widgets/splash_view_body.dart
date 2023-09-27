import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:our_store/core/local/cache_helper.dart';
import 'package:our_store/core/utils/AssetsData.dart';
import 'package:our_store/features/home/presentation/view/home_view.dart';
import 'package:our_store/features/login/presentation/view/login_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    Future.delayed(
        const Duration(seconds: 1),
        () => Get.offAll(
            CacheHelper.getData(key: 'token') == null
                ? const LoginView()
                : const HomeView(),
            transition: Transition.cupertino));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(AssetsData.logo),
    );
  }
}
