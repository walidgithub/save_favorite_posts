import 'package:equatable/equatable.dart';

class FilterResponse extends Equatable {
  final int id;
  final String title;

  const FilterResponse({
    required this.id,
    required this.title,
  });

  @override
  List<Object?> get props => [id, title];
}