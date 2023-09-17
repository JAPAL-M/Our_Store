import 'package:flutter/material.dart';
import 'package:our_store/constant.dart';
import 'package:our_store/core/utils/Styles.dart';
import 'package:our_store/features/details/presentation/view/widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('Product Details'),
        titleTextStyle: Styles.textstyle14,
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios_new,size: 20,)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.local_mall_outlined, size: 25),
          )
        ],
      ),
      body: const DetailsViewBody(),
    );
  }
}
