import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:our_store/features/home/presentation/viewmodel/hom_data_cubit.dart';

import 'HotSalesInfoItem.dart';

class HotSalesListView extends StatelessWidget {
  const HotSalesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3.2,
      child: BlocBuilder<HomDataCubit, HomDataState>(
        builder: (context, state) {
          if (state is HomDataSuccess) {
            EasyLoading.dismiss();
            return ListView.separated(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => HotSalesInfoItem(
                products: state.homeModel.data!.products![index],
              ),
              separatorBuilder: (context, index) => SizedBox(
                width: MediaQuery.of(context).size.width / 30,
              ),
              itemCount: 5,
            );
          } else if (state is HomDataFailure) {
            EasyLoading.dismiss();
            return Center(
              child: Text(state.errmessage),
            );
          } else {
            EasyLoading.show(status: 'loading...');
            return const Text('');
          }
        },
      ),
    );
  }
}
