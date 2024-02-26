import 'package:equatable/equatable.dart';

class FilterResponse extends Equatable {
  int? id;
  String? title;

  FilterResponse({
    this.id,
    this.title,
  });

  @override
  List<Object?> get props => [id, title];
}