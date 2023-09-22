import 'package:flutter/material.dart';
import 'package:our_store/features/home/data/models/HomeModel.dart';
import 'HotSalesInfoItem.dart';

class HotSalesListView extends StatelessWidget {
  const HotSalesListView({
    super.key, required this.homeModel,
  });
final HomeModel homeModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3.2,
      child: ListView.separated(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => HotSalesInfoItem(products: homeModel.data!.products![index],),
              separatorBuilder: (context, index) => SizedBox(
                width: MediaQuery.of(context).size.width / 30,
              ),
              itemCount: 5,
      ),
    );
  }
}
