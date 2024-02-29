import 'package:equatable/equatable.dart';

class UpdatePostRequest extends Equatable {
  int? id;
  String? category;
  String? subCategory;
  String? website;
  int? seen;
  String? description;
  String? link;

  UpdatePostRequest({
    this.id,
    this.category,
    this.subCategory,
    this.website,
    this.seen,
    this.description,
    this.link,
  });


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["postId"] = id;
    data["category"] = category;
    data["subCategory"] = subCategory;
    data["website"] = website;
    data["seen"] = seen;
    data["description"] = description;
    data["postLink"] = link;
    return data;
  }

  @override
  List<Object?> get props => [id, category, subCategory, website, seen, description, link];
}