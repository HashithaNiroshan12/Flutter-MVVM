import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/model/product.dart';
import 'package:shopping_cart/view_model/cart_viewmodel.dart';

class CatalogProducts extends StatelessWidget {
  const CatalogProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: ListView.builder(
            itemCount: Product.products.length,
            itemBuilder: (BuildContext context, int index) {
              return CatalogProductCard(index: index);
            }));
  }
}

class CatalogProductCard extends StatelessWidget {
  final cartViewModel = Get.put(CartViewModel());
  final int index;
  CatalogProductCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(Product.products[index].imageUrl),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(Product.products[index].name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          Expanded(child: Text('${Product.products[index].price}')),
          IconButton(
              onPressed: () {
                cartViewModel.addProduct(Product.products[index]);
              },
              icon: Icon(Icons.add_circle))
        ],
      ),
    );
  }
}
