import 'package:flutter/material.dart';
import 'package:noon_demo/modal/brand.dart';

class BrandButton extends StatelessWidget {
  final Brand brand;

  final VoidCallback onTap;
  const BrandButton({
    super.key,
    required this.brand,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Image.network(
          brand.imageUrl,
          width: 80,
          height: 80,
        ),
      ),
    );
  }
}
