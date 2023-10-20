import 'package:flutter/material.dart';

class SelectedFilterButton extends StatelessWidget {
  final String text;

  final VoidCallback onTap;
  const SelectedFilterButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: Theme.of(context).primaryColor,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(text),
            InkWell(
              onTap: onTap,
              child: const Icon(
                Icons.close,
                size: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
