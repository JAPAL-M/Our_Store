import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'HotSalesInfoItem.dart';

class FeatureProductGridView extends StatelessWidget {
  const FeatureProductGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount:4,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        shrinkWrap: true,
        itemBuilder: (context,index)=> const HotSalesInfoItem()
    );
  }
}