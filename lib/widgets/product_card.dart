import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:noon_demo/modal/product.dart';
import 'package:noon_demo/providers/favorites_provider.dart';
import 'package:noon_demo/providers/shopping_cart_provider.dart';
import 'package:noon_demo/router/app_router.dart';

class ProductCard extends ConsumerWidget {
  const ProductCard({
    super.key,
    required this.product,
    this.isFavoritePage = false,
  });
  final bool isFavoritePage;
  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          AppRouterNames.product,
          extra: product,
          pathParameters: {"productId": product.id},
        );
      },
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: SizedBox(
                width: double.infinity,
                child: Stack(
                  children: [
                    Image.network(
                      product.images.first,
                      fit: BoxFit.cover,
                    ),
                    if (!isFavoritePage)
                      Builder(builder: (context) {
                        ref.watch(favoritesProvider);
                        final isFavorite = ref.watch(favoritesProvider.notifier).isFavorite(product);
                        return Positioned(
                          top: 4,
                          right: 4,
                          child: IconButton(
                            icon: isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.black45,
                            onTap: () {
                              ref.read(favoritesProvider.notifier).toggle(product);
                            },
                          ),
                        );
                      }),
                    Builder(builder: (context) {
                      ref.watch(shoppingCartProvider);
                      final isAddedToCart = ref.watch(shoppingCartProvider.notifier).isAddedToCart(product);

                      return Positioned(
                        bottom: 4,
                        right: 4,
                        child: IconButton(
                          icon: Icons.add_shopping_cart,
                          color: isAddedToCart ? Theme.of(context).primaryColor : Colors.black45,
                          onTap: () {
                            ref.read(shoppingCartProvider.notifier).add(product);
                          },
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...product.images
                    .map(
                      (image) => Container(
                        width: 5,
                        height: 5,
                        margin: const EdgeInsets.only(left: 4),
                        decoration: BoxDecoration(
                          border: Border.all(width: .6),
                          color: product.images[0] == image ? Colors.black : Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      product.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        const Text("AED"),
                        Text(
                          product.price.toStringAsFixed(2),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              product.rating.toStringAsFixed(1),
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const Icon(
                              Icons.star,
                              size: 12,
                              color: Colors.white,
                            ),
                          ],
                        ),
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
  }
}

class IconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color color;
  const IconButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              spreadRadius: .2,
              blurRadius: 100,
            ),
          ],
        ),
        child: Icon(
          icon,
          color: color,
          size: 20,
        ),
      ),
    );
  }
}
