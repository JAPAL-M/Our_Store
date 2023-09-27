import 'package:flutter/material.dart';
import 'package:our_store/constant.dart';

class CheckOutViewBody extends StatelessWidget {
  const CheckOutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stepper(
              elevation: 0,
              connectorColor: MaterialStatePropertyAll<Color>(kPrimaryColor),
              type: StepperType.horizontal,
              steps: getStep
          ),
        )
      ],
    );
  }
}

List<Step> getStep= [
  Step(
      title: Text('Your Cart'),
      isActive: true,
      content: Column(
        children: [Text('data')],
      )),
  Step(
      title: Text('Your Cart'),
      isActive: true,
      content: Column(
        children: [Text('data1')],
      )),
  Step(
      title: Text('Your Cart'),
      isActive: false,
      content: Column(
        children: [Text('data2')],
      ))
];