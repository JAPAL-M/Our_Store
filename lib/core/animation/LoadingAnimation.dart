import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/AssetsData.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset(AssetsData.loadingAnimation,height: MediaQuery.of(context).size.height / 3.5));
  }
}