import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:our_store/constant.dart';
import 'package:our_store/core/utils/AssetsData.dart';
import 'package:our_store/core/utils/Styles.dart';
import 'package:our_store/features/details/presentation/view/widgets/CustomMaterialButton.dart';
import 'package:our_store/features/home/presentation/view/home_view.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(child: LottieBuilder.asset(AssetsData.orderConfirmed)),
          CustomMaterialButton(
              textButton: 'Return To Home Page',
              color: kPrimaryColor,
              styleText: Styles.textstyle14,
              radius: 8,
              onPressed: () => Get.offAll(const HomeView()))
        ],
      ),
    );
  }
}
