import 'package:flutter/material.dart';
import 'package:our_store/core/utils/AssetsData.dart';
import 'DetailsProductWidget.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          AssetsData.iphone,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height / 2.5,
          width: double.infinity,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 30,
        ),
       const DetailsProductWidget()
      ],
    );
  }
}
