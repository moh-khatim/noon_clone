import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:noon_demo/fake_data.dart';
import 'package:noon_demo/pages/products_page/widgets/custom_button.dart';
import 'package:noon_demo/pages/products_page/widgets/selected_filter_button.dart';
import 'package:noon_demo/providers/brand_filter_provider.dart';
import 'package:noon_demo/providers/internal_storage_provider.dart';
import 'package:noon_demo/providers/mobile_ram_provider.dart';
import 'package:noon_demo/providers/price_filter_provider.dart';

class FilterSection extends HookConsumerWidget {
  const FilterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedBrnad = ref.watch(brandFilterProvider);
    final priceFilter = ref.watch(priceFilterProvider);
    final ramProvider = ref.watch(mobileRamProvider);
    final storageProvider = ref.watch(internalStorageProvider);

    final minController = useTextEditingController(text: "20");
    final maxController = useTextEditingController(text: "1000");

    List<ValueNotifier<bool>> checkedRams = [];
    for (var _ in FakeData.availableRamSizes) {
      checkedRams.add(useState(false));
    }

    List<ValueNotifier<bool>> checkedStorage = [];
    for (var _ in FakeData.availableInternalStorage) {
      checkedStorage.add(useState(false));
    }

    return Container(
      width: double.infinity,
      color: Colors.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            if (selectedBrnad != null)
              SelectedFilterButton(
                text: selectedBrnad.name,
                onTap: () {
                  ref.read(brandFilterProvider.notifier).setSelectedBrnad(null);
                },
              ),
            if (priceFilter.isEnable)
              SelectedFilterButton(
                text: "${priceFilter.min} - ${priceFilter.max} AED",
                onTap: () {
                  ref.read(priceFilterProvider.notifier).disablePriceFilter();
                },
              ),
            if (ramProvider.isNotEmpty)
              ...ramProvider
                  .map(
                    (e) => SelectedFilterButton(
                      text: "${e.title} RAM",
                      onTap: () {
                        ref.read(mobileRamProvider.notifier).remove(e);
                      },
                    ),
                  )
                  .toList(),
            if (storageProvider.isNotEmpty)
              ...storageProvider
                  .map(
                    (e) => SelectedFilterButton(
                      text: "${e.title} Storage",
                      onTap: () {
                        ref.read(internalStorageProvider.notifier).remove(e);
                      },
                    ),
                  )
                  .toList(),
            CustomButton(
              text: "Price",
              iconData: Icons.attach_money_rounded,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Price",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: minController,
                                    decoration: const InputDecoration(
                                      label: Text('Min'),
                                    ),
                                    keyboardType: TextInputType.number,
                                    autofocus: true,
                                  ),
                                ),
                                const SizedBox(width: 22),
                                Expanded(
                                  child: TextFormField(
                                    controller: maxController,
                                    decoration: const InputDecoration(
                                      label: Text('Max'),
                                    ),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  ref.read(priceFilterProvider).setPriceRange(double.parse(minController.text), double.parse(maxController.text));
                                  Navigator.pop(context);
                                },
                                child: const Text("APPLY"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            CustomButton(
              text: "Mobile Ram",
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return RamModalBottomSheet(ref: ref, checked: checkedRams);
                  },
                );
              },
            ),
            CustomButton(
              text: "Internal Storage",
              iconData: Icons.attach_money_rounded,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return InternalStorageModalBottomSheet(ref: ref, checked: checkedStorage);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RamModalBottomSheet extends StatefulWidget {
  const RamModalBottomSheet({
    super.key,
    required this.ref,
    required this.checked,
  });

  final WidgetRef ref;
  final List<ValueNotifier<bool>> checked;

  @override
  State<RamModalBottomSheet> createState() => _RamModalBottomSheetState();
}

class _RamModalBottomSheetState extends State<RamModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mobile Ram Size",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              itemCount: FakeData.availableRamSizes.length,
              itemBuilder: (context, index) {
                final ram = FakeData.availableRamSizes[index];
                return CheckboxListTile.adaptive(
                  title: Text(ram.title),
                  value: widget.checked[index].value,
                  onChanged: (value) {
                    setState(() {
                      widget.checked[index].value = value!;
                    });
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  widget.ref.read(mobileRamProvider.notifier).rest();
                  for (var element in widget.checked) {
                    if (element.value) {
                      widget.ref.read(mobileRamProvider.notifier).add(FakeData.availableRamSizes[widget.checked.indexOf(element)]);
                    }
                    log(widget.checked.indexOf(element).toString());
                  }
                  Navigator.pop(context);
                },
                child: const Text("APPLY"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InternalStorageModalBottomSheet extends StatefulWidget {
  const InternalStorageModalBottomSheet({
    super.key,
    required this.ref,
    required this.checked,
  });

  final WidgetRef ref;
  final List<ValueNotifier<bool>> checked;

  @override
  State<InternalStorageModalBottomSheet> createState() => _InternalStorageModalBottomSheetState();
}

class _InternalStorageModalBottomSheetState extends State<InternalStorageModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Internal Storage Size",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              itemCount: FakeData.availableInternalStorage.length,
              itemBuilder: (context, index) {
                final storage = FakeData.availableInternalStorage[index];
                return CheckboxListTile.adaptive(
                  title: Text(storage.title),
                  value: widget.checked[index].value,
                  onChanged: (value) {
                    setState(() {
                      widget.checked[index].value = value!;
                    });
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  widget.ref.read(internalStorageProvider.notifier).rest();
                  for (var element in widget.checked) {
                    if (element.value) {
                      widget.ref.read(internalStorageProvider.notifier).add(FakeData.availableInternalStorage[widget.checked.indexOf(element)]);
                      log(widget.checked.indexOf(element).toString());
                    }
                  }
                  Navigator.pop(context);
                },
                child: const Text("APPLY"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
