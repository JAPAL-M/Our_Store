import 'package:flutter/material.dart';
import '../../../../home/data/models/HomeModel.dart';
import '../../../../home/presentation/view/widgets/AddToCartWidgets.dart';
import 'DetailsProductWidget.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key,required this.products});
  final Products products;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          products.image.toString(),
          height: MediaQuery.of(context).size.height / 3,
          width: double.infinity,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 30,
        ), 
        DetailsProductWidget(products: products,),
        const Spacer(),
        AddToCartWidgets(products: products)
      ],
    );
  }
}


