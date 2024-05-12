import 'dart:convert';

import '../../domain/entities/post.dart';

class PostModel extends PostEntity {
  const PostModel({
    required super.id,
    required super.title,
    required super.content,
  });

  PostModel copyWith({
    String? id,
    String? title,
    String? content,
  }) {
    return PostModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'content': content,
    };
  }

  Map<String, dynamic> toMapWithoutId() {
    return <String, dynamic>{
      'title': title,
      'content': content,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
    );
  }

  String toJson() => json.encode(toMap());
  String toJsonWithoutId() => json.encode(toMapWithoutId());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);

  PostModel.fromEntity({required PostEntity postEntity})
      : this(id: postEntity.id, title: postEntity.title, content: postEntity.content);

  @override
  String toString() => 'PostModel(id: $id, title: $title, content: $content)';

  @override
  bool operator ==(covariant PostModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title && other.content == content;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ content.hashCode;
}
