import 'package:equatable/equatable.dart';

class UpdateCategoryNameRequest extends Equatable {
  String? category;

  UpdateCategoryNameRequest({
    this.category,
  });


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["category"] = category;
    return data;
  }

  @override
  List<Object?> get props => [category];
}