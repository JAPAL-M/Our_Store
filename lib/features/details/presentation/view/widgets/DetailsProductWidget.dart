import 'package:flutter/material.dart';
import '../../../../../core/utils/Styles.dart';
import 'CustomFloatingButton.dart';
import 'CustomMaterialButton.dart';
import 'CustomRaitingProduct.dart';

class DetailsProductWidget extends StatelessWidget {
  const DetailsProductWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'AirPods Max',
              style: Styles.textstyle24
          ),
          const CustomRaitingProduct(),
          SizedBox(
            height: MediaQuery.of(context).size.height / 50,
          ),
          Text(
            'Apple-designed dynamic driver provides high-fidelity audio.Note : If the size of the earbud tips does not match the size of your ear canals or the headset is not worn properly in your ears, you may not obtain the correct sound qualities or call performance. Change the earbud tips to ones that fit more snugly in your ear',
            style: Styles.textstyle14w300,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 50,
          ),
          Row(
            children: [
              Text(
                '\$549',
                style: Styles.textstyle24,
              ),
              const Spacer(),
              CustomFloatingButtons(onPressed: () {  }, icon: Icons.remove,),
              const SizedBox(
                width: 10,
              ),
              Text(
                '1',
                style: Styles.textstyle19,
              ),
              const SizedBox(
                width: 10,
              ),
              CustomFloatingButtons(onPressed: () {  }, icon: Icons.add,)
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 40,),
          const CustomMaterialButton()
        ],
      ),
    );
  }
}