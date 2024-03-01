import 'package:equatable/equatable.dart';

class ToggleSeenPostRequest extends Equatable {
  int? id;
  int? seen;

  ToggleSeenPostRequest({
    this.id,
    this.seen,
  });


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["postId"] = id;
    data["seen"] = seen;
    return data;
  }

  @override
  List<Object?> get props => [id, seen];
}