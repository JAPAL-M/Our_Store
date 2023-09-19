import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_store/core/utils/Styles.dart';
import 'package:our_store/features/home/presentation/viewmodel/hom_data_cubit.dart';
import 'CustomAdsWidget.dart';
import 'CustomChipListView.dart';
import 'FeatureProductGridView.dart';
import 'HotSalesListView.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomDataCubit, HomDataState>(
  builder: (context, state) {
    if(state is HomDataSuccess){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAdsWidget(homeModel: state.homeModel,),
                  CustomChipListView(),
                  SizedBox(height: MediaQuery.of(context).size.height / 150,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hot Sales',
                        style:
                        Styles.textstyle14,
                      ),
                      TextButton(onPressed: () {}, child: const Text('See all'))
                    ],
                  ),
                  const HotSalesListView(),
                  SizedBox(height: MediaQuery.of(context).size.height / 150,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Featured Products',
                        style:
                        Styles.textstyle14,
                      ),
                      TextButton(onPressed: () {}, child: const Text('See all'))
                    ],
                  ),

                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: FeatureProductGridView(),
            )
          ],
        ),
      );
    }else{
      return const Text('');
    }
  },
);
  }
}



