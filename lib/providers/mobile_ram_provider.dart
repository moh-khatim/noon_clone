import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noon_demo/modal/ram.dart';

final mobileRamProvider = StateNotifierProvider<RamNotifier, List<RAM>>((ref) {
  return RamNotifier();
});

class RamNotifier extends StateNotifier<List<RAM>> {
  RamNotifier() : super([]);

  void add(RAM value) {
    if (!state.contains(value)) state = [...state, value];
  }

  void remove(RAM value) {
    if (state.contains(value)) state = state.where((element) => element.id != value.id).toList();
  }

  void rest() {
    state = [];
  }
}
