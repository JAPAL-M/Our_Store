import 'package:flutter/material.dart';

import '../../../../../core/models/AuthModel.dart';
import '../../../../../core/utils/Styles.dart';
import 'CustomPhotoProfile.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key, required this.authModel});
  final AuthModel authModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomPhotoProfile(image: authModel.data!.image.toString()),
        SizedBox(width: MediaQuery.of(context).size.width / 10,),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(authModel.data!.name.toString(),maxLines: 1,style: Styles.textstyle24.copyWith(color: Colors.black,fontWeight: FontWeight.w400),),
              Text(authModel.data!.email.toString(),maxLines:1,style: Styles.textstyle12.copyWith(fontWeight: FontWeight.normal),)
            ],
          ),
        )
      ],
    );
  }
}