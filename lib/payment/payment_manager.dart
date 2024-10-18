import 'package:dio/dio.dart';
import 'package:etqan/payment/stripe_keys.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

abstract class PaymentManager {
  static Future<void> makePayment(double amount, String currency) async {
    try {
      String clientSecret = await _getClientSecret((amount * 100).toInt().toString(), currency);
      await _initializePaymentSheet(clientSecret);
      await Stripe.instance.presentPaymentSheet();
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  static Future<void> _initializePaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: "Hassan",
      ),
    );
  }

  static Future<String> _getClientSecret(String amount, String currency) async {
    Dio dio = Dio();
    try {
      var response = await dio.post(
        'https://api.stripe.com/v1/payment_intents',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${ApiKeys.secretKey}',
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
        data: {
          'amount': amount,
          'currency': currency,
          'payment_method_types[]': 'card',
        },
      );
      return response.data["client_secret"];
    } on DioException catch (e) {
      throw e;
    }
  }
}
