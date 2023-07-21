import 'package:flutter/material.dart';

import 'package:shopping_cart/widgets/cart_price.dart';
import 'package:shopping_cart/widgets/cart_product.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: Column(
        children: [CartProducts(), CartTotalPrice()],
      ),
    );
  }
}
