import 'package:equatable/equatable.dart';

class SubCategoryResponse extends Equatable {
  final int id;
  final String title;

  const SubCategoryResponse({
    required this.id,
    required this.title,
  });

  @override
  List<Object?> get props => [id, title];
}


List<SubCategoryResponse> subCategoryResponse = [
  SubCategoryResponse(id: 1, title: 'All'),
  SubCategoryResponse(id: 2, title: 'Designs'),
  SubCategoryResponse(id: 3, title: 'Git'),
  SubCategoryResponse(id: 4, title: 'Problems'),
];