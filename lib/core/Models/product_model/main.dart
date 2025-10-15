import 'package:equatable/equatable.dart';

class Main extends Equatable {
  final int? id;
  final String? name;
  final String? imageUrl;
  final DateTime? createdAt;

  const Main({this.id, this.name, this.imageUrl, this.createdAt});

  factory Main.fromJson(Map<String, dynamic> json) => Main(
    id: json['id'] as int?,
    name: json['name'] as String?,
    imageUrl: json['imageUrl'] as String?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'imageUrl': imageUrl,
    'createdAt': createdAt?.toIso8601String(),
  };

  Main copyWith({
    int? id,
    String? name,
    String? imageUrl,
    DateTime? createdAt,
  }) {
    return Main(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [id, name, imageUrl, createdAt];
}
