import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/AssetsData.dart';

class EmptyProductAnimation extends StatelessWidget {
  const EmptyProductAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset(AssetsData.emptyCart,height: MediaQuery.of(context).size.height / 2));
  }
}