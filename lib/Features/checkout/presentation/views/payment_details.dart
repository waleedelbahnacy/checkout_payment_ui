import 'package:checkout_payment_ui/Features/checkout/presentation/widgets/payment_details_view_body.dart';
import 'package:checkout_payment_ui/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: SvgPicture.asset(
            'lib/Features/checkout/presentation/assets/images/arrow.svg',
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Payment Details ',
          textAlign: TextAlign.center,
          style: Styles.style25,
        ),
      ),
      body: const PaymentDetailsViewBody(),
    );
  }
}
