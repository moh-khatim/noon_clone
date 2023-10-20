import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:noon_demo/providers/shopping_cart_provider.dart';
import 'package:noon_demo/router/app_router.dart';

class ShoppingCartPage extends ConsumerWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(shoppingCartProvider);

    log("Shopping cart update");
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: cartItems.isEmpty
          ? const Center(
              child: Text("No item added to shopping cart yet."),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
                mainAxisExtent: 220,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartItems[index];
                return InkWell(
                  onTap: () => context.pushNamed(AppRouterNames.product, extra: cartItem.product, pathParameters: {"productId": cartItem.product.id}),
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Image.network(cartItem.product.images.first),
                        ),
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cartItem.product.brand.name,
                                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  cartItem.product.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "AED ${cartItem.product.price.toStringAsFixed(2)}",
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10),
                                const Text.rich(
                                  TextSpan(
                                    text: "Free delivery ",
                                    children: [
                                      TextSpan(
                                        text: "Fri, oct 22",
                                        style: TextStyle(color: Colors.green),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Text.rich(
                                  TextSpan(
                                    text: "Sold by ",
                                    children: [
                                      TextSpan(
                                        text: "Mohammed Abdalla",
                                        style: TextStyle(fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Container(
                                  decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(40)),
                                  padding: const EdgeInsets.all(4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          ref.read(shoppingCartProvider.notifier).decrease(cartItem);
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                            size: 14,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 6,
                                          vertical: 2,
                                        ),
                                        child: Text(cartItem.qty.value.toString()),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          ref.read(shoppingCartProvider.notifier).add(cartItem.product);
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: (cartItems.isEmpty)
          ? null
          : Container(
              color: Colors.grey[50],
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Builder(
                        builder: (context) {
                          final count = ref.watch(shoppingCartProvider.notifier).getTotalItemsQty();
                          if (count == 1) {
                            return Text("$count item");
                          } else {
                            return Text("$count items");
                          }
                        },
                      ),
                      Builder(
                        builder: (context) {
                          final total = ref.watch(shoppingCartProvider.notifier).getTotalItemsPrice();
                          return Text("AED $total");
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("CHECKOUT"),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
