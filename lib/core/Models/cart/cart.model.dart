import 'item.model.dart';

class Cart {
  int? id;
  int? userId;
  DateTime? createdAt;
  List<Item>? items;
  int? totalPrice;

  Cart({this.id, this.userId, this.createdAt, this.items, this.totalPrice});

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    id: json['id'] as int?,
    userId: json['userId'] as int?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
        .toList(),
    totalPrice: json['totalPrice'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'createdAt': createdAt?.toIso8601String(),
    'items': items?.map((e) => e.toJson()).toList(),
    'totalPrice': totalPrice,
  };
}
