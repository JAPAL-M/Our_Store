import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../core/utils/Styles.dart';

class CustomRaitingProduct extends StatelessWidget {
  const CustomRaitingProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar(
          initialRating: 3.5,
          minRating: 1,
          maxRating: 5,
          allowHalfRating: true,
          itemSize: MediaQuery.of(context).size.width / 20,
          ratingWidget: RatingWidget(
              full: const Icon(
                Icons.star,
                color: Colors.amberAccent,
              ),
              half: const Icon(Icons.star_half_outlined,
                  color: Colors.amberAccent),
              empty: const Icon(Icons.star_border,
                  color: Colors.amberAccent)),
          onRatingUpdate: (value) => null,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          '| 123 reviews',
          style: Styles.textstyle10.copyWith(color: Colors.black,fontWeight: FontWeight.w300),
        )
      ],
    );
  }
}