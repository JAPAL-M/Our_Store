import 'package:flutter/material.dart';
import 'package:our_store/features/register/presentation/view/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: RegisterViewBody(),
      ),
    );
  }
}
