import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:our_store/features/favorite/presentation/viewmodel/favorite_cubit.dart';
import 'package:our_store/features/home/data/models/HomeModel.dart';

import '../../../home/presentation/view/widgets/HotSalesInfoItem.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if(state is GetFavoriteSuccess){
          EasyLoading.dismiss();
          return MasonryGridView.builder(
            padding: const EdgeInsets.all(20),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.favoriteModel.data!.data!.length,
              gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  HotSalesInfoItem(products: state.favoriteModel.data!.data![index].product!,)
          );
        }else if(state is GetFavoriteFailure){
          EasyLoading.dismiss();
          return Center(child: Text(state.errmessage),);
        }else{
          EasyLoading.show(status: 'loading favorite...');
          return const Text('');
        }
      },
    );
  }
}
