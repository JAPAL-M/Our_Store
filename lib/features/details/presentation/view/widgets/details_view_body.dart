import 'package:flutter/material.dart';
import '../../../../home/data/models/HomeModel.dart';
import '../../../../home/presentation/view/widgets/AddToCartWidgets.dart';
import 'CustomSmoothIndicator.dart';
import 'DetailsProductWidget.dart';
import 'PhotoProductsPageView.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.products});

  final Products products;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PhotoProductsPageView(controller: controller, products: products),
        SizedBox(
          height: MediaQuery.of(context).size.height / 90,
        ),
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
