import 'package:equatable/equatable.dart';

class TestRequest extends Equatable {
  final int id;
  final String title;

  const TestRequest({
    required this.id,
    required this.title,
  });

  @override
  List<Object?> get props => [id, title];
}