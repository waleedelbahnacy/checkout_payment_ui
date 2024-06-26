import 'package:checkout_payment_ui/Features/checkout/presentation/widgets/payment_method_item.dart';
import 'package:flutter/material.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key});

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
final List<String> paymentMethodsItem = const [
  'lib/Features/checkout/presentation/assets/images/card.svg',
  'lib/Features/checkout/presentation/assets/images/paypal.svg',
];
int activeIndex =0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        itemCount: paymentMethodsItem.length,
        scrollDirection: Axis.horizontal,
        itemBuilder:(context,index)
      {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GestureDetector(
            onTap: () {
              activeIndex = index;
              setState(() {
                
              });
            },
            child: PaymentMethodItem(
              isActive: activeIndex == index,
              image: paymentMethodsItem[index],
            ),
          ),
        );
      }
        
      ),
    );
  }
}