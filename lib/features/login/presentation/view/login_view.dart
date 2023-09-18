import 'package:flutter/material.dart';
import 'package:our_store/features/login/presentation/view/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: LoginViewBody(),
      ),
    );
  }
}
