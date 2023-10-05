import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../../../constant.dart';
import '../../../../../core/utils/Styles.dart';
import '../../../../../core/widgets/CustomTextButton.dart';
import '../../../../Address/presentation/view/shipping_address_view.dart';
import '../../../../Address/presentation/viewmodel/Address_Data_Cubit/address_data_cubit.dart';
import '../widgets/CheckOutAddressSelected.dart';
import '../widgets/CheckOutCartProductListView.dart';
import '../widgets/ChooseAddressRadioListTile.dart';
import '../widgets/CustomRadioListTile.dart';

List<Step> getSteps(BuildContext context, totalPrice, cartModel) {
  List<Step> getStep = [
    Step(
        title: const Text('Choose Payment'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose Your Payment Please :',
              style: Styles.textstyle14,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            const CustomRadioListTile(
              icon: Icons.money,
              title: 'Cash On Delivrey',
              value: 1,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            const CustomRadioListTile(
              icon: Icons.credit_card_sharp,
              title: 'Pay With Credit Card',
              value: 2,
            ),
          ],
        )),
    Step(
        title: const Text('Choose Address'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose Your Address Please :',
              style: Styles.textstyle14,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
              child: BlocBuilder<AddressDataCubit, AddressDataState>(
                builder: (context, state) {
                  if (state is GetAddressDataSuccess) {
                    if (state.addressModel.data!.data!.isEmpty) {
                      return Align(
                          alignment: Alignment.topRight,
                          child: CustomTextButton(
                              textbutton: 'Add Address',
                              color: kSecondaryColor,
                              onPressed: () {
                                Get.off(ShippingAddressView());
                              }));
                    } else {
                      return ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => ChooseAddressRadioListTile(dataAddress: state.addressModel.data!.data![index],index: index,),
                          separatorBuilder: (context, index) => SizedBox(
                                height: MediaQuery.of(context).size.height / 90,
                              ),
                          itemCount: state.addressModel.data!.data!.length);
                    }
                  } else {
                    return const Text('');
                  }
                },
              ),
            )
          ],
        )),
    Step(
        title: const Text('CheckOut'),
        content: BlocBuilder<AddressDataCubit, AddressDataState>(
          builder: (context, state) {
            if (state is GetAddressDataSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Cart :',
                    style: Styles.textstyle14,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 5,
                        child: CheckOutCartProductListView(cartModel: cartModel,),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 50,
                      ),
                      Text(
                        'Your Address :',
                        style: Styles.textstyle14,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 50,
                      ),
                      CheckOutAddressSelected(addressModel: state.addressModel,),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 50,
                      ),
                      Text(
                        'Total Price : $totalPrice',
                        style: Styles.textstyle14,
                      )
                    ],
                  ),
                ],
              );
            } else {
              return const Text('');
            }
          },
        )),
  ];
  return getStep;
}









