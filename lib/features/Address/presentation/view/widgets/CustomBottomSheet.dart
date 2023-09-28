import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import '../../../../../core/widgets/CustomTextFormField.dart';
import '../../viewmodel/Address_Data_Cubit/address_data_cubit.dart';
import '../../viewmodel/Address_View_Cubit/address_cubit.dart';

void CustomBottomSheet(BuildContext context,scaffoldKey) {
  if (AddressCubit.get(context).isOpen == true) {
    AddressDataCubit.get(context).addAddress().then((value) {
      Navigator.pop(context);
    });
  } else {
    scaffoldKey.currentState!
        .showBottomSheet((context) {
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
                controller: AddressDataCubit.get(context)
                    .nameController),
            CustomTextFormField(
                labeltext: 'City',
                prefixIcon: Icons.location_city,
                obscureText: false,
                keyboardType: TextInputType.text,
                controller: AddressDataCubit.get(context)
                    .cityController),
            CustomTextFormField(
                labeltext: 'Region',
                prefixIcon: Icons.location_on_outlined,
                obscureText: false,
                keyboardType: TextInputType.text,
                controller: AddressDataCubit.get(context)
                    .regionController),
            CustomTextFormField(
                labeltext: 'Details',
                prefixIcon: Icons.details,
                obscureText: false,
                keyboardType: TextInputType.text,
                controller: AddressDataCubit.get(context)
                    .detailsController),
            CustomTextFormField(
                labeltext: 'Notes',
                prefixIcon: Icons.notes,
                obscureText: false,
                keyboardType: TextInputType.text,
                controller: AddressDataCubit.get(context)
                    .notesController),
          ],
        ),
      );
    })
        .closed
        .then((value) {
      AddressCubit.get(context)
          .changeBottomSheet(false, Icons.edit);
    });
    AddressCubit.get(context).changeBottomSheet(true, Icons.add);
  }
}