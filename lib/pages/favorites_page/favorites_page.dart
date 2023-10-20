import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noon_demo/providers/favorites_provider.dart';

import '../../widgets/product_card.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(favoritesProvider);
    return Scaffold(
      body: products.isEmpty
          ? const Center(
              child: Text("No product added to favorites yet."),
            )
          : GridView.builder(
              primary: false,
              padding: const EdgeInsets.all(8),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                mainAxisExtent: 320,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  isFavoritePage: true,
                  product: products[index],
                );
              },
            ),
    );
  }
}
