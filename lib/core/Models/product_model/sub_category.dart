import 'package:equatable/equatable.dart';

import 'main.dart';

class SubCategory extends Equatable {
  final int? id;
  final String? name;
  final String? imageUrl;
  final DateTime? createdAt;
  final int? mainId;
  final Main? main;

  const SubCategory({
    this.id,
    this.name,
    this.imageUrl,
    this.createdAt,
    this.mainId,
    this.main,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    id: json['id'] as int?,
    name: json['name'] as String?,
    imageUrl: json['imageUrl'] as String?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    mainId: json['mainId'] as int?,
    main: json['main'] == null
        ? null
        : Main.fromJson(json['main'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'imageUrl': imageUrl,
    'createdAt': createdAt?.toIso8601String(),
    'mainId': mainId,
    'main': main?.toJson(),
  };

  SubCategory copyWith({
    int? id,
    String? name,
    String? imageUrl,
    DateTime? createdAt,
    int? mainId,
    Main? main,
  }) {
    return SubCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
      mainId: mainId ?? this.mainId,
      main: main ?? this.main,
    );
  }

  @override
  List<Object?> get props {
    return [id, name, imageUrl, createdAt, mainId, main];
  }
}
