import 'dart:math';

import 'package:checkout_payment_ui/Features/checkout/presentation/views/thank_you_view.dart';
import 'package:checkout_payment_ui/Features/checkout/presentation/widgets/custom_credit_card.dart';
import 'package:checkout_payment_ui/Features/checkout/presentation/widgets/payment_methods_list_view.dart';
import 'package:checkout_payment_ui/core/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      const SliverToBoxAdapter(
        child: PaymentMethodsListView(),
      ),
      SliverToBoxAdapter(
        child: CustomCreditCard(
          formKey: formKey,
          autovalidateMode: autovalidateMode,
        ),
      ),
      SliverFillRemaining(
        hasScrollBody: false,
        child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 12, left: 16, right: 16),
              child: CustomButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    log('payment' as num);
                  } else {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ThankYouView();
                    }));
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                text: 'payment',
              ),
            )),
      ),
    ]);
  }
}
