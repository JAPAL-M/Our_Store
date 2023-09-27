import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_store/features/home/presentation/viewmodel/Home_Cubit/home_state.dart';

import '../../../../../constant.dart';
import '../../../../favorite/presentation/viewmodel/favorite_cubit.dart';
import '../../../../home/data/models/HomeModel.dart';
import '../../../../home/presentation/viewmodel/HomeData_Cubit/hom_data_cubit.dart';
import '../../../../home/presentation/viewmodel/Home_Cubit/home_cubit.dart';

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
    return BlocBuilder<HomeCubit, HomeState>(
  builder: (context, state) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          PageView.builder(
              controller: controller,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: HomDataCubit.get(context).imagesProduct[products.id]!.length,
              itemBuilder: (context, index) => CachedNetworkImage(
                imageUrl: HomDataCubit.get(context).imagesProduct[products.id]![index],
              )),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
                onTap: () async {
                  HomeCubit.get(context)
                      .changeInFav(products.id!.toInt(), context);
                  await FavoriteCubit.get(context)
                      .addOrRemoveItemToFavorite(
                      id: products.id!.toInt());
                },
                child: Icon(
                  HomDataCubit.get(context).inFav[products.id] ==
                      true
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: kSecondaryColor,
                )),
          )
        ],
      ),
    );
  },
);
  }
}