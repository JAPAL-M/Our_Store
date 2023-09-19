import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:our_store/features/details/presentation/view/details_view.dart';
import 'package:our_store/features/home/data/models/HomeModel.dart';

import '../../../../../core/utils/AssetsData.dart';
import '../../../../../core/utils/Styles.dart';
import 'CustomFloatingButton.dart';

class HotSalesInfoItem extends StatelessWidget {
  const HotSalesInfoItem({
    super.key, required this.products,
  });
final Products products;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(DetailsView(products: products,),transition: Transition.cupertino);
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2.5,
        child: Card(
          color: Colors.white,
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.network(products.image.toString(),height: MediaQuery.of(context).size.height / 6,)),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 100,
                ),
                Text(
                  products.name.toString(),
                  style: Styles.textstyle12,
                  maxLines: 1,
                ),
                Text(
                  'Subtitle',
                  style: Styles.textstyle10,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${products.price} EGP',
                      style: Styles.textstyle12,
                    ),
                    const CustomFloatingButton()
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}