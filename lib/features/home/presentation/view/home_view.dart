import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:our_store/constant.dart';
import 'package:our_store/core/utils/AssetsData.dart';
import 'package:our_store/features/home/presentation/viewmodel/HomeData_Cubit/hom_data_cubit.dart';
import 'package:our_store/features/home/presentation/viewmodel/Home_Cubit/home_cubit.dart';
import 'package:our_store/features/search/presentation/view/search_view.dart';

import '../viewmodel/Home_Cubit/home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.to(const SearchView());
            },
            icon: const Icon(Icons.search, size: 25),
          )
        ],
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: SvgPicture.asset(
          AssetsData.storeBrandWhite,
          width: MediaQuery.of(context).size.width / 3,
          // height: MediaQuery.of(context).size.width / 15,
          color: kWhiteColor,
        ),
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width / 1.5,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kSecondaryColor,
          unselectedItemColor: kPrimaryColor,
          currentIndex: HomeCubit.get(context).currentIndex,
          onTap: (index) => HomeCubit.get(context).changeCurrentIndex(index,context),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
              label: 'Home',
              activeIcon: Icon(Icons.home_filled)
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
              label: 'Cart',
              activeIcon: Icon(Icons.shopping_cart)
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: 'Favorite',
                activeIcon: Icon(Icons.favorite)
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined),
                label: 'Account',
                activeIcon: Icon(Icons.person_2)
            ),
          ]
      ),
      body: HomeCubit.get(context).pages[HomeCubit.get(context).currentIndex],
    );
  },
);
  }
}
