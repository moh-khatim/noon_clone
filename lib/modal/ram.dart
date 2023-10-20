import 'package:equatable/equatable.dart';

class RAM extends Equatable {
  final String id;
  final String title;
  final int value;

  const RAM({required this.id, required this.title, required this.value});

  @override
  List<Object?> get props => [id, title, value];
}
