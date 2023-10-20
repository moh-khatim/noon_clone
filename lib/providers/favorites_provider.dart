import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noon_demo/modal/product.dart';

final favoritesProvider = StateNotifierProvider<FavoritesNovtifier, List<Product>>((ref) {
  return FavoritesNovtifier();
});

class FavoritesNovtifier extends StateNotifier<List<Product>> {
  FavoritesNovtifier() : super([]);

  void toggle(Product product) {
    if (state.contains(product)) {
      state = state.where((element) => element != product).toList();
    } else {
      state = [...state, product];
    }
  }

  bool isFavorite(Product product) {
    return (state.contains(product)) ? true : false;
  }
}
