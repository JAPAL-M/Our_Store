import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../home/data/models/HomeModel.dart';

class PhotoProductsPageView extends StatelessWidget {
  const PhotoProductsPageView({
    super.key,
    required this.controller,
    required this.products,
  });

  final PageController controller;
  final Products products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: PageView.builder(
          controller: controller,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: products.images?.length,
          itemBuilder: (context, index) => CachedNetworkImage(
            imageUrl: products.images![index],
          )),
    );
  }
}