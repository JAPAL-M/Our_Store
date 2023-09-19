import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:our_store/features/home/presentation/viewmodel/hom_data_cubit.dart';

import 'HotSalesInfoItem.dart';

class FeatureProductGridView extends StatelessWidget {
  const FeatureProductGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomDataCubit, HomDataState>(
      builder: (context, state) {
        if (state is HomDataSuccess) {
          EasyLoading.dismiss();
          return MasonryGridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              shrinkWrap: true,
              itemBuilder: (context, index) => HotSalesInfoItem(products: state.homeModel.data!.products![index],)
          );
        }else if (state is HomDataFailure) {
          EasyLoading.dismiss();
          return Center(child: Text(state.errmessage),);
        }else{
          EasyLoading.show(status: 'loading...');
          return const Text('');
        }
      },
    );
  }
}