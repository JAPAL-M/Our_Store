import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:our_store/constant.dart';
import 'package:our_store/core/utils/AssetsData.dart';
import 'package:our_store/features/home/presentation/view/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.local_mall_outlined, size: 25),
          )
        ],
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: SvgPicture.asset(
          AssetsData.storeBrandWhite,
          width: MediaQuery.of(context).size.width / 2.5,
          // height: MediaQuery.of(context).size.width / 15,
          color: kWhiteColor,
        ),
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width / 1.5,
      ),
      body: const HomeViewBody(),
    );
  }
}
