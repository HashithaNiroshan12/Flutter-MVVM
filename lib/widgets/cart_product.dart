import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/model/product.dart';
import 'package:shopping_cart/view_model/cart_viewmodel.dart';

class CartProducts extends StatelessWidget {
  final CartViewModel cartviewmodel = Get.find();
  CartProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 500,
        child: ListView.builder(
            itemCount: cartviewmodel.products.length,
            itemBuilder: (BuildContext context, int index) {
              return CartProductCard(
                cartviewmodel: cartviewmodel,
                product: cartviewmodel.products.keys.toList()[index],
                quantity: cartviewmodel.products.values.toList()[index],
                index: index,
              );
            }),
      ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  final CartViewModel cartviewmodel;
  final Product product;
  final int quantity;
  final int index;
  const CartProductCard(
      {super.key,
      required this.cartviewmodel,
      required this.product,
      required this.quantity,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              product.imageUrl,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(product.name),
          ),
          IconButton(
            onPressed: () {
              cartviewmodel.removeProduct(product);
            },
            icon: Icon(Icons.remove_circle),
          ),
          Text('$quantity'),
          IconButton(
            onPressed: () {
              cartviewmodel.addProduct(product);
            },
            icon: Icon(Icons.add_circle),
          ),
        ],
      ),
    );
  }
}
