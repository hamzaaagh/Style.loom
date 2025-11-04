import 'package:style/core/Models/product_model/sub_category.dart';



class MainCategory {
	int? id;
	String? name;
	String? imageUrl;
	DateTime? createdAt;
	List<SubCategory>? subCategories;

	MainCategory({
		this.id, 
		this.name, 
		this.imageUrl, 
		this.createdAt, 
		this.subCategories, 
	});

	@override
	String toString() {
		return 'MainCategory(id: $id, name: $name, imageUrl: $imageUrl, createdAt: $createdAt, subCategories: $subCategories)';
	}

	factory MainCategory.fromJson(Map<String, dynamic> json) => MainCategory(
				id: json['id'] as int?,
				name: json['name'] as String?,
				imageUrl: json['imageUrl'] as String?,
				createdAt: json['createdAt'] == null
						? null
						: DateTime.parse(json['createdAt'] as String),
				subCategories: (json['subCategories'] as List<dynamic>?)
						?.map((e) => SubCategory.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'imageUrl': imageUrl,
				'createdAt': createdAt?.toIso8601String(),
				'subCategories': subCategories?.map((e) => e.toJson()).toList(),
			};

	MainCategory copyWith({
		int? id,
		String? name,
		String? imageUrl,
		DateTime? createdAt,
		List<SubCategory>? subCategories,
	}) {
		return MainCategory(
			id: id ?? this.id,
			name: name ?? this.name,
			imageUrl: imageUrl ?? this.imageUrl,
			createdAt: createdAt ?? this.createdAt,
			subCategories: subCategories ?? this.subCategories,
		);
	}
}
