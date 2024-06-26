import 'package:checkout_payment_ui/Features/checkout/presentation/views/payment_details.dart';
import 'package:checkout_payment_ui/Features/checkout/presentation/widgets/cart_info_item.dart';
import 'package:checkout_payment_ui/Features/checkout/presentation/widgets/total_price_widget.dart';

import 'package:checkout_payment_ui/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';


class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Expanded(child: Image.asset('lib/Features/checkout/presentation/assets/images/basket_image.png'),),
          SizedBox(
            height: 25,
          ),
         const OrderInfoItem(
            title: 'Order Subtotal',
            value: r'42.97$',
          ),
          SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            title: 'Discount',
            value: r'0$',
          ),
          SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            title: 'Shipping',
            value: r'8$',
          ),
     const Divider(
        thickness:2,
        height: 34,
        color: Color(0xffc7c7c7),
      ),
      const TotalPrice(title: 'Total', value: r'$50.97'),
      SizedBox(
        height: 16,
        ),
      CustomButton(
        text: 'Complete payment',
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
        return const PaymentDetailsView();
        
      }));
      },
    ),
    const SizedBox(
      height: 12,
    ),
        ],
      ),
    );
  }
}
