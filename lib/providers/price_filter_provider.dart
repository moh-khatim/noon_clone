import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final priceFilterProvider = ChangeNotifierProvider<PriceFilter>((ref) {
  return PriceFilter();
});

class PriceFilter extends ChangeNotifier {
  double min = 0;
  double max = 0;
  bool isEnable = false;

  void setPriceRange(double min, double max) {
    this.min = min;
    this.max = max;
    isEnable = true;
    log("setPriceRange");
    notifyListeners();
  }

  void disablePriceFilter() {
    min = 0;
    max = 0;
    isEnable = false;
    notifyListeners();
  }
}
