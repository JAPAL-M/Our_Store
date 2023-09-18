import 'package:flutter/material.dart';
import 'package:our_store/constant.dart';
import 'LoginDetailsView.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      child: const LoginDetailsView(),
    );
  }
}






