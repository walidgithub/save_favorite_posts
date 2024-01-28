

import '../../domain/entities/favorite_posts_entities.dart';
import '../../domain/reposnses/test_response.dart';
import '../../domain/requests/test_request.dart';

class TestEntityModel extends TestEntity {
  const TestEntityModel({
    required super.id,
    required super.title,
  });

  factory TestEntityModel.fromJson(Map<String, dynamic> json) {
    return TestEntityModel(
      id: (json['id'] as num).toInt(),
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }
}

class TestResponseModel extends TestResponse {
  TestResponseModel({
    required super.id,
    required super.title,
  });

  factory TestResponseModel.fromJson(Map<String, dynamic> json) {
    return TestResponseModel(id: json['id'], title: json['title']);
  }
}

class TestRequestModel extends TestRequest {
  const TestRequestModel({
    required super.id,
    required super.title,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }
}