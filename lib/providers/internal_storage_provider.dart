import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noon_demo/modal/internal_storage.dart';

final internalStorageProvider = StateNotifierProvider<InternalStorageNotifier, List<InternalStorage>>((ref) {
  return InternalStorageNotifier();
});

class InternalStorageNotifier extends StateNotifier<List<InternalStorage>> {
  InternalStorageNotifier() : super([]);

  void add(InternalStorage value) {
    if (!state.contains(value)) state = [...state, value];
  }

  void remove(InternalStorage value) {
    if (state.contains(value)) state = state.where((element) => element.id != value.id).toList();
  }

  void rest() {
    state = [];
  }
}
