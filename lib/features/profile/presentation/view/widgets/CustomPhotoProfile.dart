import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomPhotoProfile extends StatelessWidget {
  const CustomPhotoProfile({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      height: MediaQuery.of(context).size.width / 4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: CachedNetworkImageProvider(image))
      ),
    );
  }
}