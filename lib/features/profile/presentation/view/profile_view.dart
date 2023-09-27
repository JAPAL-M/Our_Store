import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:our_store/core/local/cache_helper.dart';
import 'package:our_store/features/login/presentation/view/login_view.dart';
import 'package:our_store/features/profile/presentation/view/widgets/CustomSelectionProfile.dart';
import 'package:our_store/features/profile/presentation/view/widgets/ProfileDetails.dart';
import 'package:our_store/features/profile/presentation/view/widgets/edit_profile_view.dart';
import 'package:our_store/features/Address/presentation/view/shipping_address_view.dart';
import 'package:our_store/features/profile/presentation/viewmodel/profile_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
  builder: (context, state) {
    if (state is GetProfileSuccess) {
      EasyLoading.dismiss();
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ProfileDetails(authModel: state.authModel),
            const Spacer(),
            Column(
              children: [
                CustomSelectionProfile(icon: Icons.edit_outlined, text: 'Edit Profile',onTap: (){
                  Get.to(EditProfileView(authModel: state.authModel,));
                },),
                CustomSelectionProfile(icon: Icons.location_on_outlined, text: 'Shipping Address', onTap: () {
                  Get.to(ShippingAddressView());
                },),
                CustomSelectionProfile(icon: Icons.history, text: 'Order History', onTap: () {  },),
                CustomSelectionProfile(icon: Icons.credit_card_sharp, text: 'Cards', onTap: () {  },),
                CustomSelectionProfile(icon: Icons.settings, text: 'Settings', onTap: () {  },),
                CustomSelectionProfile(icon: Icons.logout_outlined, text: 'Log Out', onTap: () async{
                 await CacheHelper.removeData(key: 'token').then((value){
                   Get.offAll(const LoginView());
                 });
                },),
              ],
            )
          ],
        ),
      );
    }else if(state is GetProfileFailure){
      EasyLoading.dismiss();
      return Center(child: Text(state.errmessage),);
    }else{
      EasyLoading.show(status: 'loading profile...');
      return const Text('');
    }
  },
);
  }
}








