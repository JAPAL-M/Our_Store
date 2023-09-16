import 'package:flutter/material.dart';
import 'package:our_store/core/utils/Styles.dart';
import 'CustomAdsWidget.dart';
import 'CustomChipListView.dart';
import 'FeatureProductGridView.dart';
import 'HotSalesListView.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAdsWidget(),
                const CustomChipListView(),
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
  }
}



