import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:our_store/features/home/data/models/HomeModel.dart';

class CustomAdsWidget extends StatelessWidget {
  const CustomAdsWidget({
    super.key, required this.homeModel,
  });

  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 31.0,bottom: 21),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CarouselSlider(items: homeModel.data!.banners!.map((e) =>
            Image(image: NetworkImage(e.image.toString()),width: double.infinity,fit: BoxFit.fill,)).toList(),
            options: CarouselOptions(
                viewportFraction: 1,
                autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn
            )),
      ),
    );
  }
}