import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_store/constant.dart';
import 'package:our_store/core/models/AuthModel.dart';
import 'package:our_store/core/utils/Styles.dart';
import 'package:our_store/core/widgets/CustomTextFormField.dart';
import 'package:our_store/features/details/presentation/view/widgets/CustomMaterialButton.dart';
import 'package:our_store/features/profile/presentation/view/widgets/CustomPhotoProfile.dart';
import 'package:our_store/features/profile/presentation/viewmodel/profile_cubit.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key, required this.authModel});

  final AuthModel authModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
              if (state is GetProfileSuccess) {
                Navigator.pop(context);
              }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CustomPhotoProfile(
                            image: authModel.data!.image.toString()),
                        const CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 15,
                          child: Icon(Icons.add),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                  ),
                  CustomTextFormField(
                      labeltext: 'Name',
                      prefixIcon: Icons.person,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      controller: ProfileCubit.get(context).nameController),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  CustomTextFormField(
                      labeltext: 'Phone',
                      prefixIcon: Icons.phone_android,
                      obscureText: false,
                      keyboardType: TextInputType.phone,
                      controller: ProfileCubit.get(context).phoneController),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  CustomTextFormField(
                      labeltext: 'Email',
                      prefixIcon: Icons.email_outlined,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      controller: ProfileCubit.get(context).emailController),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  CustomTextFormField(
                      labeltext: 'Password',
                      prefixIcon: Icons.password,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      controller: ProfileCubit.get(context).passController),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                  ),
                  CustomMaterialButton(
                      textButton: 'Edit Profile',
                      color: kPrimaryColor,
                      styleText: Styles.textstyle14,
                      radius: 8,
                      onPressed: () {
                        ProfileCubit.get(context).editProfile();
                      })
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
