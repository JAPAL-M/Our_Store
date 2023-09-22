import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:our_store/constant.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../home/data/models/HomeModel.dart';
import '../../../../home/presentation/view/widgets/AddToCartWidgets.dart';
import 'CustomSmoothIndicator.dart';
import 'DetailsProductWidget.dart';
import 'PhotoProductsPageView.dart';

class DetailsViewBody extends StatelessWidget {
  DetailsViewBody({super.key, required this.products});

  final Products products;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PhotoProductsPageView(controller: controller, products: products),
        SizedBox(height: MediaQuery.of(context).size.height / 90,),
        CustomSmoothIndicator(controller: controller, products: products),
        SizedBox(
          height: MediaQuery.of(context).size.height / 50,
        ),
        DetailsProductWidget(
          products: products,
        ),
        const Spacer(),
        AddToCartWidgets(products: products)
      ],
    );
  }
}



