import 'package:equatable/equatable.dart';

class CategoryResponse extends Equatable {
  final int id;
  final String title;

  const CategoryResponse({
    required this.id,
    required this.title,
  });

  @override
  List<Object?> get props => [id, title];
}


List<CategoryResponse> categoryResponse = [
  CategoryResponse(id: 1, title: 'All'),
  CategoryResponse(id: 2, title: 'Flutter'),
  CategoryResponse(id: 3, title: 'FrontEnd'),
  CategoryResponse(id: 4, title: 'General'),
];