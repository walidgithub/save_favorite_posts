import 'package:equatable/equatable.dart';

class TestResponse extends Equatable {
  int id;
  String title;

  TestResponse({
    required this.id,
    required this.title,
  });

  @override
  List<Object?> get props => [id, title];
}