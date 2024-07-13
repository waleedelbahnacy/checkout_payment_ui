class InitPaymentSheetInputMpdel {
  
  final String clientSecret;
  final String customerId;
  final String ephemeralKeySecret;

  InitPaymentSheetInputMpdel(
    {required this.clientSecret, 
    required this.customerId,
     required this.ephemeralKeySecret});
}