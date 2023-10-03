import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:our_store/features/orderDetails/data/models/OrderDetailsModel.dart';
import '../../../../../core/utils/Styles.dart';

class ProductOrderDetailsListItem extends StatelessWidget {
  const ProductOrderDetailsListItem({super.key, required this.products});
  final ProductsOrder products;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:
      MediaQuery.of(context).size.width / 2.5,
      child: Card(
        color: Colors.white,
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Center(
                  child: CachedNetworkImage(
                    imageUrl: products.image
                        .toString(),
                    height: MediaQuery.of(context)
                        .size
                        .height /
                        6,
                  )),
              SizedBox(
                height: MediaQuery.of(context)
                    .size
                    .height /
                    100,
              ),
              Text(
                products.name
                    .toString(),
                style: Styles.textstyle12,
                maxLines: 1,
              ),
              Text(
                'Subtitle',
                style: Styles.textstyle10,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: MediaQuery.of(context)
                    .size
                    .height /
                    60,
              ),
              Row(
                mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,
                children: [
                  Text(
                    '${products.price} EGP',
                    style: Styles.textstyle12,
                  ),
                  Text(
                    '${products.quantity}',
                    style: Styles.textstyle12,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}