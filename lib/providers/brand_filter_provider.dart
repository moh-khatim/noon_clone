import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noon_demo/modal/brand.dart';

final brandFilterProvider = StateNotifierProvider<BrandFilterStateNotifier, Brand?>((ref) {
  return BrandFilterStateNotifier();
});

class BrandFilterStateNotifier extends StateNotifier<Brand?> {
  BrandFilterStateNotifier() : super(null);

  void setSelectedBrnad(Brand? brand) {
    state = brand;
  }
}
