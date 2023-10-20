import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noon_demo/fake_data.dart';

import 'package:noon_demo/pages/products_page/widgets/product_section.dart';
import 'package:noon_demo/pages/products_page/widgets/search_section.dart';
import 'package:noon_demo/pages/products_page/widgets/filter_section.dart';
import 'package:noon_demo/pages/products_page/widgets/shop_by_brand_section.dart';

import 'package:noon_demo/providers/brand_filter_provider.dart';
import 'package:noon_demo/providers/products_provider.dart';

class ProductsPage extends ConsumerWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(futureProductsProvider);
    final selectedBrand = ref.watch(brandFilterProvider);
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            const SearchSection(),
            const SizedBox(height: 12),
            const FilterSection(),
            if (selectedBrand == null) const ShopByBrandSection(brands: FakeData.brands),
            asyncValue.map(
              data: (asyncData) {
                if (asyncData.value.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text("No Product found."),
                    ),
                  );
                } else {
                  return ProductSection(products: asyncData.value);
                }
              },
              error: (error) => Center(
                child: Text(error.toString()),
              ),
              loading: (_) => const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
