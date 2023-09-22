import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:our_store/features/home/data/models/HomeModel.dart';
import 'HotSalesInfoItem.dart';

class FeatureProductGridView extends StatelessWidget {
  const FeatureProductGridView({
    super.key, required this.homeModel,
  });
final HomeModel homeModel;
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              shrinkWrap: true,
              itemBuilder: (context, index) => HotSalesInfoItem(products: homeModel.data!.products![index],)
          );
  }
}