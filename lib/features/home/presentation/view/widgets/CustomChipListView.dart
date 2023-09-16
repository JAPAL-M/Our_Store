import 'package:flutter/material.dart';

import 'CustomChipWidget.dart';

class CustomChipListView extends StatelessWidget {
  const CustomChipListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 20,
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: const <CustomChipWidget>[
          CustomChipWidget(labelString: 'All'),
          CustomChipWidget(labelString: 'Computers'),
          CustomChipWidget(labelString: 'Headsets'),
          CustomChipWidget(labelString: 'Speakers'),
          CustomChipWidget(labelString: 'Accessories'),
          CustomChipWidget(labelString: 'Printer'),
          CustomChipWidget(labelString: 'Cameras'),
        ],
      ),
    );
  }
}