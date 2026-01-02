import 'product.model.dart';

class Item {
  int? id;
  int? cartId;
  int? productId;
  int? quantity;
  Product? product;

  Item({this.id, this.cartId, this.productId, this.quantity, this.product});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json['id'] as int?,
    cartId: json['cartId'] as int?,
    productId: json['productId'] as int?,
    quantity: json['quantity'] as int?,
    product: json['product'] == null
        ? null
        : Product.fromJson(json['product'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'cartId': cartId,
    'productId': productId,
    'quantity': quantity,
    'product': product?.toJson(),
  };
}
