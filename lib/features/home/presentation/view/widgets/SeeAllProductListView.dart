import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:our_store/constant.dart';
import 'package:our_store/core/utils/Styles.dart';
import 'package:our_store/features/home/data/models/HomeModel.dart';

import 'HotSalesInfoItem.dart';

class SeeAllProductListView extends StatelessWidget {
  const SeeAllProductListView({super.key, required this.homeModel});
final HomeModel homeModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: kPrimaryColor,title: Text('All Product',style: Styles.textstyle14,),centerTitle: true,),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: MasonryGridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: homeModel.data!.products!.length,
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            shrinkWrap: true,
            itemBuilder: (context, index) => HotSalesInfoItem(products: homeModel.data!.products![index],)
        ),
      ),
    );
  }
}
