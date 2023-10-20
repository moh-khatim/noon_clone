import 'package:equatable/equatable.dart';

class InternalStorage extends Equatable {
  final String id;
  final String title;
  final int value;

  const InternalStorage({required this.id, required this.title, required this.value});

  @override
  List<Object?> get props => [id, title, value];
}
