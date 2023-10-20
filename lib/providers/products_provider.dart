import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noon_demo/fake_data.dart';
import 'package:noon_demo/modal/product.dart';
import 'package:noon_demo/providers/brand_filter_provider.dart';
import 'package:noon_demo/providers/internal_storage_provider.dart';
import 'package:noon_demo/providers/mobile_ram_provider.dart';
import 'package:noon_demo/providers/price_filter_provider.dart';

final futureProductsProvider = FutureProvider<List<Product>>((ref) async {
  final brand = ref.watch(brandFilterProvider);
  final priceFilter = ref.watch(priceFilterProvider);
  final ramProvider = ref.watch(mobileRamProvider);
  final storageProvider = ref.watch(internalStorageProvider);

  return Future.delayed(
    const Duration(milliseconds: 2000),
    () {
      var products = FakeData.products;
      if (brand != null) products = products.where((product) => product.brand == brand).toList();
      if (priceFilter.isEnable) products = products.where((product) => product.price >= priceFilter.min && product.price <= priceFilter.max).toList();
      if (ramProvider.isNotEmpty) products = products.where((product) => ramProvider.contains(product.ram)).toList();
      if (storageProvider.isNotEmpty) products = products.where((product) => storageProvider.contains(product.internalStorage)).toList();
      return products;
    },
  );
});
