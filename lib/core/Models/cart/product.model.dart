class Product {
  int? id;
  String? name;
  String? description;
  String? imageUrl;
  int? price;
  DateTime? createdAt;
  int? stock;
  int? subCategoryId;

  Product({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.price,
    this.createdAt,
    this.stock,
    this.subCategoryId,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'] as int?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    imageUrl: json['imageUrl'] as String?,
    price: json['price'] as int?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    stock: json['stock'] as int?,
    subCategoryId: json['subCategoryId'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'imageUrl': imageUrl,
    'price': price,
    'createdAt': createdAt?.toIso8601String(),
    'stock': stock,
    'subCategoryId': subCategoryId,
  };
}
