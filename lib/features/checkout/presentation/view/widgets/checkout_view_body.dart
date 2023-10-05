import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_store/constant.dart';
import 'package:our_store/core/utils/Styles.dart';
import 'package:our_store/features/cart/data/models/CartModel.dart';
import 'package:our_store/features/checkout/data/repo/payment_repo.dart';
import 'package:our_store/features/checkout/presentation/viewmodel/checkout_cubit.dart';
import 'package:our_store/features/details/presentation/view/widgets/CustomMaterialButton.dart';
import '../../../../orders/presentation/viewmodel/order_cubit.dart';
import '../function/get_steps_function.dart';

class CheckOutViewBody extends StatelessWidget {
  const CheckOutViewBody(
      {super.key, required this.cartModel, required this.totalPrice});

  final int totalPrice;
  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    CheckoutCubit.get(context).currentStep = 0;
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        final isLastStep = getSteps(context, totalPrice, cartModel).length - 1;
        return Column(
          children: [
            Expanded(
              child: Stepper(
                  currentStep: CheckoutCubit.get(context).currentStep,
                  elevation: 0,
                  connectorColor:
                      MaterialStatePropertyAll<Color>(kPrimaryColor),
                  type: StepperType.vertical,
                  onStepContinue: () {
                    if (isLastStep == CheckoutCubit.get(context).currentStep) {
                      if (CheckoutCubit.get(context).payment == 1) {
                        OrderCubit.get(context).postOrder(
                            addressId: CheckoutCubit.get(context).address,
                            paymentMethod: CheckoutCubit.get(context).payment);
                      } else {
                        PaymentManagerX.makePayment(totalPrice, 'EGP', context);
                      }
                    } else {
                      CheckoutCubit.get(context).nextCurrentStep();
                    }
                  },
                  onStepCancel: () {
                    if (CheckoutCubit.get(context).currentStep == 0) {
                      Navigator.pop(context);
                    } else {
                      CheckoutCubit.get(context).backCurrentStep();
                    }
                  },
                  controlsBuilder: (context, control) {
                    return Container(
                      margin: const EdgeInsets.only(top: 50),
                      child: Row(
                        children: [
                          Expanded(
                              child: CustomMaterialButton(
                                  textButton: isLastStep ==
                                          CheckoutCubit.get(context).currentStep
                                      ? 'Confirm'
                                      : 'Next',
                                  color: kPrimaryColor,
                                  styleText: Styles.textstyle12,
                                  radius: 8,
                                  onPressed: control.onStepContinue!)),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: CustomMaterialButton(
                                  textButton:
                                      CheckoutCubit.get(context).currentStep ==
                                              0
                                          ? 'Cancel'
                                          : 'Back',
                                  color: kPrimaryColor,
                                  styleText: Styles.textstyle12,
                                  radius: 8,
                                  onPressed: control.onStepCancel!)),
                        ],
                      ),
                    );
                  },
                  steps: getSteps(context, totalPrice, cartModel)),
            )
          ],
        );
      },
    );
  }
}
