import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_store/features/cart/presentation/viewmodel/AddAndGetCart_Cubit/cart_cubit.dart';
import 'package:our_store/features/home/presentation/viewmodel/HomeData_Cubit/hom_data_cubit.dart';
import 'package:our_store/features/home/presentation/viewmodel/Home_Cubit/home_cubit.dart';
import 'package:our_store/features/home/presentation/viewmodel/Home_Cubit/home_state.dart';
import '../../../../../constant.dart';
import '../../../../../core/utils/Styles.dart';
import '../../../../cart/presentation/viewmodel/UpdateCart_Cubit/update_cart_cubit.dart';
import '../../../../details/presentation/view/widgets/CustomMaterialButton.dart';
import '../../../data/models/HomeModel.dart';

class AddToCartWidgets extends StatelessWidget {
  const AddToCartWidgets({
    super.key,
    required this.products,
  });

  final Products products;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateCartCubit, UpdateCartState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${products.price} EGP',
                style: Styles.textstyle20.copyWith(color: kSecondaryColor),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return CustomMaterialButton(
                    textButton: HomDataCubit.get(context)
                                .inCart[products.id!.toInt()] == false
                        ? 'Add item to bag'
                        : 'Remove item from bag',
                    color: kSecondaryColor,
                    styleText: Styles.textstyle20
                        .copyWith(fontWeight: FontWeight.w400),
                    radius: 8,
                    onPressed: () async {
                      HomeCubit.get(context)
                          .changeInCart(products.id!.toInt(), context);
                      await AddAndGetCartCubit.get(context).addItemToCart(
                          id: products.id!.toInt(),
                          context: context,);
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
