import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:our_store/features/register/presentation/viewmodel/register_cubit.dart';
import '../../../../../constant.dart';
import '../../../../../core/function/CustomToast.dart';
import '../../../../../core/local/cache_helper.dart';
import '../../../../../core/utils/Styles.dart';
import '../../../../../core/widgets/CustomTextButton.dart';
import '../../../../../core/widgets/CustomTextFormField.dart';
import '../../../../details/presentation/view/widgets/CustomMaterialButton.dart';
import '../../../../home/presentation/view/home_view.dart';

class RegisterDetailsView extends StatelessWidget {
  const RegisterDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          EasyLoading.dismiss();
          CacheHelper.saveData(
                  key: 'token', value: state.registerModel.data!.token)
              .then((value) {
            token = state.registerModel.data!.token.toString();
            showToast(
                text: state.registerModel.message.toString(),
                color: kSecondaryColor);
            Get.offAll(const HomeView());
          });
        } else if (state is RegisterFailure) {
          EasyLoading.dismiss();
          return showToast(text: state.errmessage, color: kSecondaryColor);
        } else {
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
                children: [
                  Text(
                    'Register',
                    style: Styles.textstyle50.copyWith(fontSize: 40),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 70,
                  ),
                  Text(
                    'Welcome In Store App,',
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
                      vertical: MediaQuery.of(context).size.height / 20,
                      horizontal: MediaQuery.of(context).size.height / 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                        labeltext: 'Name',
                        prefixIcon: Icons.person,
                        obscureText: false,
                        keyboardType: TextInputType.name,
                        controller: RegisterCubit.get(context).nameController,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 20,
                      ),
                      CustomTextFormField(
                        labeltext: 'Email',
                        prefixIcon: Icons.email,
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress,
                        controller: RegisterCubit.get(context).emailController,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 20,
                      ),
                      CustomTextFormField(
                        labeltext: 'Phone',
                        prefixIcon: Icons.phone_android_sharp,
                        obscureText: false,
                        keyboardType: TextInputType.phone,
                        controller: RegisterCubit.get(context).phoneController,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 20,
                      ),
                      CustomTextFormField(
                        labeltext: 'Password',
                        prefixIcon: Icons.password,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        controller: RegisterCubit.get(context).passController,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 50,),
                      Align(
                          alignment: Alignment.centerRight,
                          child: CustomTextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            textbutton: 'Already have account!',
                            color: kPrimaryColor,
                          )),
                      const Spacer(),
                      CustomMaterialButton(
                        textButton: 'Sign Up',
                        color: kPrimaryColor,
                        styleText: Styles.textstyle19,
                        radius: 10,
                        onPressed: () {
                          RegisterCubit.get(context).sendLoginData(
                              name: RegisterCubit.get(context)
                                  .nameController
                                  .text,
                              pass: RegisterCubit.get(context)
                                  .passController
                                  .text,
                              email: RegisterCubit.get(context)
                                  .emailController
                                  .text,
                              phone: RegisterCubit.get(context)
                                  .phoneController
                                  .text);
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
