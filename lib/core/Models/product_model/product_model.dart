import 'package:equatable/equatable.dart';

import 'sub_category.dart';

class ProductModel extends Equatable {
	final int? id;
	final String? name;
	final String? description;
	final dynamic imageUrl;
	final int? price;
	final DateTime? createdAt;
	final int? stock;
	final int? subCategoryId;
	final SubCategory? subCategory;
	final List<dynamic>? reviews;

	const ProductModel({
		this.id, 
		this.name, 
		this.description, 
		this.imageUrl, 
		this.price, 
		this.createdAt, 
		this.stock, 
		this.subCategoryId, 
		this.subCategory, 
		this.reviews, 
	});

	factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
				id: json['id'] as int?,
				name: json['name'] as String?,
				description: json['description'] as String?,
				imageUrl: json['imageUrl'] as dynamic,
				price: json['price'] as int?,
				createdAt: json['createdAt'] == null
						? null
						: DateTime.parse(json['createdAt'] as String),
				stock: json['stock'] as int?,
				subCategoryId: json['subCategoryId'] as int?,
				subCategory: json['subCategory'] == null
						? null
						: SubCategory.fromJson(json['subCategory'] as Map<String, dynamic>),
				reviews: json['reviews'] as List<dynamic>?,
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
				'subCategory': subCategory?.toJson(),
				'reviews': reviews,
			};

	ProductModel copyWith({
		int? id,
		String? name,
		String? description,
		dynamic imageUrl,
		int? price,
		DateTime? createdAt,
		int? stock,
		int? subCategoryId,
		SubCategory? subCategory,
		List<dynamic>? reviews,
	}) {
		return ProductModel(
			id: id ?? this.id,
			name: name ?? this.name,
			description: description ?? this.description,
			imageUrl: imageUrl ?? this.imageUrl,
			price: price ?? this.price,
			createdAt: createdAt ?? this.createdAt,
			stock: stock ?? this.stock,
			subCategoryId: subCategoryId ?? this.subCategoryId,
			subCategory: subCategory ?? this.subCategory,
			reviews: reviews ?? this.reviews,
		);
	}

	@override
	List<Object?> get props {
		return [
				id,
				name,
				description,
				imageUrl,
				price,
				createdAt,
				stock,
				subCategoryId,
				subCategory,
				reviews,
		];
	}
}
