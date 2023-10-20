import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noon_demo/modal/brand.dart';
import 'package:noon_demo/pages/products_page/widgets/brand_button.dart';
import 'package:noon_demo/providers/brand_filter_provider.dart';

class ShopByBrandSection extends ConsumerWidget {
  const ShopByBrandSection({
    super.key,
    required this.brands,
  });

  final List<Brand> brands;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Shop by brand",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: brands
                  .map(
                    (brand) => BrandButton(
                      brand: brand,
                      onTap: () {
                        ref.read(brandFilterProvider.notifier).setSelectedBrnad(brand);
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
