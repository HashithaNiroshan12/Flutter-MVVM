import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/view_model/cart_viewmodel.dart';

class CartTotalPrice extends StatelessWidget {
  final CartViewModel cartviewmodel = Get.find();
  CartTotalPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 75),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              '\$${cartviewmodel.total}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
