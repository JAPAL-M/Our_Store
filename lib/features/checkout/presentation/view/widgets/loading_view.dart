import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:our_store/core/animation/LoadingAnimation.dart';
import 'package:our_store/features/cart/presentation/viewmodel/AddAndGetCart_Cubit/cart_cubit.dart';
import 'package:our_store/features/checkout/presentation/view/widgets/successed_view.dart';
import 'package:our_store/features/home/presentation/view/home_view.dart';
import 'package:our_store/features/home/presentation/viewmodel/HomeData_Cubit/hom_data_cubit.dart';
import 'package:our_store/features/home/presentation/viewmodel/Home_Cubit/home_cubit.dart';

import '../../viewmodel/checkout_cubit.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    AddAndGetCartCubit.get(context).getItemFromCart(context);
    return BlocListener<AddAndGetCartCubit, AddAndGetCartState>(
      listener: (context, state) {
        if (state is CartGetSuccess) {
          HomeCubit.get(context).currentIndex = 0;
          HomDataCubit.get(context).inCart.updateAll((key, value) => false);
          Get.offAll(const SuccessView());
        }
      },
      child: const LoadingAnimation(),
    );
  }
}
