import 'package:equatable/equatable.dart';

class UpdateSubCategoryNameRequest extends Equatable {
  String? subCategory;

  UpdateSubCategoryNameRequest({
    this.subCategory,
  });


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["subCategory"] = subCategory;
    return data;
  }

  @override
  List<Object?> get props => [subCategory];
}