import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noon_demo/modal/product.dart';
import 'package:uuid/uuid.dart';

final shoppingCartProvider = StateNotifierProvider<ShoppingCartStateNotifier, List<CartItem>>((ref) {
  return ShoppingCartStateNotifier();
});

class CartItem extends Equatable {
  late final String uuid;
  final Product product;
  final ValueNotifier<int> qty;
  final ValueNotifier<double> subTotal;

  CartItem({required this.product, required this.qty, required this.subTotal}) : uuid = const Uuid().v4();

  @override
  List<Object?> get props => [uuid, product, qty, subTotal];
}

class ShoppingCartStateNotifier extends StateNotifier<List<CartItem>> {
  ShoppingCartStateNotifier() : super([]);

  void add(Product product) {
    bool added = false;
    for (var cartItem in state) {
      if (cartItem.product.id == product.id) {
        added = true;
      }
    }
    if (!added) {
      state = [...state, CartItem(product: product, qty: ValueNotifier(1), subTotal: ValueNotifier(product.price))];
    } else {
      for (var cartItem in state) {
        if (cartItem.product == product) {
          cartItem.qty.value = cartItem.qty.value + 1;
          cartItem.subTotal.value = cartItem.qty.value * product.price;
          // that required to update the UI
          state = [...state];
        }
      }
    }
  }

  void decrease(CartItem cartItem) {
    if (cartItem.qty.value > 1) {
      for (var _cartItem in state) {
        if (cartItem.product == _cartItem.product) {
          cartItem.qty.value = cartItem.qty.value - 1;
          cartItem.subTotal.value = cartItem.qty.value * cartItem.product.price;
          // that required to update the UI
          state = [...state];
        }
      }
    } else {
      state = state.where((element) => element.uuid != cartItem.uuid).toList();
    }
  }

  bool isAddedToCart(Product product) {
    bool isAdded = false;
    for (var cartItem in state) {
      if (cartItem.product == product) {
        isAdded = true;
      }
    }
    return isAdded;
  }

  int getTotalItemsQty() {
    int total = 0;
    for (var cartItem in state) {
      total = total + cartItem.qty.value;
    }
    return total;
  }

  double getTotalItemsPrice() {
    double total = 0;
    for (var cartItem in state) {
      total = total + (cartItem.product.price * cartItem.qty.value);
    }
    return total;
  }
}
