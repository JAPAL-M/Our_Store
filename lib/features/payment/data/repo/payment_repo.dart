import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:our_store/core/animation/LoadingAnimation.dart';
import 'package:our_store/features/checkout/presentation/viewmodel/checkout_cubit.dart';
import 'package:our_store/features/orders/presentation/viewmodel/order_cubit.dart';

import '../../../cart/presentation/viewmodel/AddAndGetCart_Cubit/cart_cubit.dart';
import '../../../home/presentation/view/home_view.dart';
import '../../../home/presentation/viewmodel/HomeData_Cubit/hom_data_cubit.dart';
import '../models/ApiKey.dart';

abstract class PaymentManagerX{

  static Future<void>makePayment(int amount,String currency,context)async{
    try {
      String clientSecret=await _getClientSecret((amount*100).toString(), currency);
      await _initializePaymentSheet(clientSecret);
      await Stripe.instance.presentPaymentSheet();
      await OrderCubit.get(context).postOrder(addressId: CheckoutCubit.get(context).address, paymentMethod: CheckoutCubit.get(context).payment);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  static Future<void>_initializePaymentSheet(String clientSecret)async{
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: "Basel",
      ),
    );
  }

  static Future<String> _getClientSecret(String amount,String currency)async{
    Dio dio=Dio();
    var response= await dio.post(
      'https://api.stripe.com/v1/payment_intents',
      options: Options(
        headers: {
          'Authorization': 'Bearer ${ApiKey.secretKey}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      ),
      data: {
        'amount': amount,
        'currency': currency,
      },
    );
    return response.data["client_secret"];
  }

}