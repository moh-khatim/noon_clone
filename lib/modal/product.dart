// "id": "1",
// "name": "iPhone 15",
// "price": 50000.5,
// "brand": {
//     "id": "1",
//     "name": "Apple",
//     "imageUrl": ""
// },
// "rating": 4.5,
// "color": "White",
// "modal_year": 2023,
// "internal_storage": 128,
// "ram": 8
import 'package:equatable/equatable.dart';
import 'package:noon_demo/modal/brand.dart';
import 'package:noon_demo/modal/internal_storage.dart';
import 'package:noon_demo/modal/ram.dart';

class Product extends Equatable {
  final String id;
  final String title;
  final double price;
  final Brand brand;
  final double rating;
  final String? color;
  final int? modalYear;
  final InternalStorage? internalStorage;
  final RAM? ram;
  final List<String> images;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.brand,
    required this.rating,
    required this.color,
    this.modalYear,
    this.internalStorage,
    this.ram,
    required this.images,
  });

  @override
  List<Object?> get props => [id, title, price, rating, color, modalYear, internalStorage, ram, images];
}
