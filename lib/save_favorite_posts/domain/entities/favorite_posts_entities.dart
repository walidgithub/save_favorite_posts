import 'package:equatable/equatable.dart';

class TestEntity extends Equatable {
  final int id;
  final String title;

  const TestEntity({
    required this.id,
    required this.title,
  });

  @override
  List<Object?> get props => [id, title];
}