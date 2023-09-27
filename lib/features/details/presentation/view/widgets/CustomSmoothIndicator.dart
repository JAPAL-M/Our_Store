import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../constant.dart';
import '../../../../home/data/models/HomeModel.dart';
import '../../../../home/presentation/viewmodel/HomeData_Cubit/hom_data_cubit.dart';

class CustomSmoothIndicator extends StatelessWidget {
  const CustomSmoothIndicator({
    super.key,
    required this.controller,
    required this.products,
  });

  final PageController controller;
  final Products products;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SmoothPageIndicator(
            effect: WormEffect(activeDotColor: kSecondaryColor,dotWidth: 10,dotHeight: 10),
            controller: controller, count: HomDataCubit.get(context).imagesProduct[products.id]!.length));
  }
}
