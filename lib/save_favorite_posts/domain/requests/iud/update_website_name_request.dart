import 'package:equatable/equatable.dart';

class UpdateWebsiteNameRequest extends Equatable {
  String? website;

  UpdateWebsiteNameRequest({
    this.website,
  });


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["website"] = website;
    return data;
  }

  @override
  List<Object?> get props => [website];
}