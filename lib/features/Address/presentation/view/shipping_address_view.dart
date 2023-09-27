import 'package:flutter/material.dart';
import 'package:our_store/constant.dart';
import 'package:our_store/core/widgets/CustomTextFormField.dart';
import 'package:our_store/features/home/presentation/view/widgets/CustomFloatingButton.dart';
import 'package:our_store/features/profile/presentation/viewmodel/profile_cubit.dart';

class ShippingAddressView extends StatelessWidget {
  ShippingAddressView({super.key});

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            scaffoldKey.currentState!.showBottomSheet((context) {
              return Container(
                height: MediaQuery.of(context).size.height / 2,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  children: [
                    CustomTextFormField(
                        labeltext: 'Name',
                        prefixIcon: Icons.person,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        controller: ProfileCubit.get(context).nameController),
                    CustomTextFormField(
                        labeltext: 'City',
                        prefixIcon: Icons.location_city,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        controller: ProfileCubit.get(context).nameController),
                    CustomTextFormField(
                        labeltext: 'Region',
                        prefixIcon: Icons.location_on_outlined,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        controller: ProfileCubit.get(context).nameController),
                    CustomTextFormField(
                        labeltext: 'Details',
                        prefixIcon: Icons.details,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        controller: ProfileCubit.get(context).nameController),
                    CustomTextFormField(
                        labeltext: 'Notes',
                        prefixIcon: Icons.notes,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        controller: ProfileCubit.get(context).nameController),
                  ],
                ),
              );
            });
          },
          backgroundColor: kPrimaryColor,
          child: const Icon(
            Icons.add,
            size: 20,
          ),
        ),
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
