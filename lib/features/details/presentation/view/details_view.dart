import 'package:flutter/material.dart';
import 'package:our_store/constant.dart';
import 'package:our_store/core/utils/Styles.dart';
import 'package:our_store/features/details/presentation/view/widgets/details_view_body.dart';
import 'package:our_store/features/home/data/models/HomeModel.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.products});
final Products products;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
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
      body: DetailsViewBody(products: products,),
    );
  }
}
