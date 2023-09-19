import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:our_store/core/local/cache_helper.dart';
import 'package:our_store/features/home/presentation/view/home_view.dart';
import 'package:our_store/features/login/presentation/viewmodel/login_cubit.dart';
import 'package:our_store/features/register/presentation/view/register_view.dart';

import '../../../../../constant.dart';
import '../../../../../core/function/CustomToast.dart';
import '../../../../../core/utils/Styles.dart';
import '../../../../../core/widgets/CustomTextButton.dart';
import '../../../../../core/widgets/CustomTextFormField.dart';
import '../../../../details/presentation/view/widgets/CustomMaterialButton.dart';

class LoginDetailsView extends StatelessWidget {
  const LoginDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          EasyLoading.dismiss();
          CacheHelper.saveData(
                  key: 'token', value: state.loginModel.data!.token)
              .then((value) {
            token = state.loginModel.data!.token.toString();
            showToast(
                text: state.loginModel.message.toString(),
                color: kSecondaryColor);
            Get.to(const HomeView());
          });
        } else if (state is LoginFailure) {
          EasyLoading.dismiss();
          return showToast(text: state.errmessage, color: kSecondaryColor);
        }else{
          EasyLoading.show(status: 'loading...');
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: Styles.textstyle50,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 70,
                  ),
                  Text(
                    'Welcome Back,',
                    style: Styles.textstyle12.copyWith(
                        color: kWhiteColor, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 40,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                    color: Colors.white),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height / 6,
                      horizontal: MediaQuery.of(context).size.height / 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                        labeltext: 'Email',
                        prefixIcon: Icons.email_outlined,
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress,
                        controller: LoginCubit.get(context).emailController,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 20,
                      ),
                      CustomTextFormField(
                        labeltext: 'Password',
                        prefixIcon: Icons.password,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        controller: LoginCubit.get(context).passController,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 50,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextButton(
                            onPressed: () {},
                            textbutton: 'Forget Password?',
                            color: kPrimaryColor,
                          ),
                          CustomTextButton(
                            onPressed: () {
                              Get.to(
                                const RegisterView(),
                              );
                            },
                            textbutton: 'Register Now!',
                            color: kPrimaryColor,
                          ),
                        ],
                      ),
                      const Spacer(),
                      CustomMaterialButton(
                        textButton: 'Login',
                        color: kPrimaryColor,
                        styleText: Styles.textstyle19,
                        radius: 10,
                        onPressed: () async {
                          await LoginCubit.get(context).sendLoginData(
                              email:
                              LoginCubit.get(context).emailController.text,
                              pass:
                              LoginCubit.get(context).passController.text);
                        },
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
