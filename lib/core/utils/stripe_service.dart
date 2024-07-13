import 'package:checkout_payment_ui/Features/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:checkout_payment_ui/Features/checkout/data/models/init_Payment_Sheet_Input_Model.dart';
import 'package:checkout_payment_ui/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_payment_ui/Features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:checkout_payment_ui/Features/checkout/presentation/widgets/payment_item_info.dart';
import 'package:checkout_payment_ui/core/utils/api_keys.dart';
import 'package:checkout_payment_ui/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      contentType:Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretkey,
    );
   var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
   return paymentIntentModel;
 }
 
 Future<PaymentIntentModel> createCustomer(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      contentType:Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretkey,
    );
   var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
   return paymentIntentModel;
 }
 Future initPaymentSheet({
  required InitPaymentSheetInputMpdel initPaymentSheetInputMpdel })async
 {
await Stripe.instance.initPaymentSheet(
  paymentSheetParameters:  SetupPaymentSheetParameters(
paymentIntentClientSecret: initPaymentSheetInputMpdel.clientSecret,
customerEphemeralKeySecret:initPaymentSheetInputMpdel.ephemeralKeySecret ,
customerId: initPaymentSheetInputMpdel.customerId,
merchantDisplayName: 'waleed',
),
);
 }
 Future displayPaymentSheet()async
 {
 await Stripe.instance.presentPaymentSheet();
 }
 
 Future makePayment({required PaymentIntentInputModel paymentIntentInputModel })async
 {
  var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
 var ephemeralKeyModel = await createEphemeralKey(customerId:paymentIntentInputModel.customerId);
  var initPaymentSheetInputMpdel =InitPaymentSheetInputMpdel(clientSecret: paymentIntentModel.clientSecret!, customerId: paymentIntentInputModel.customerId, ephemeralKeySecret: ephemeralKeyModel.secret!);
  await initPaymentSheet(
    initPaymentSheetInputMpdel: initPaymentSheetInputMpdel);
  await displayPaymentSheet();
 }

   Future<EphemeralKeyModel> createEphemeralKey(
     {required String customerId})async {
    var response = await apiService.post(
      body:{
        'customer' : customerId,
      },
      contentType:Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      token: ApiKeys.secretkey,
      headers: {
         'Authorization' : "Bearer ${ApiKeys.secretkey}",
         'Stripe-Version' : '2023-08-16',
      }
    );
   var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);
   return ephemeralKeyModel;
 }
}