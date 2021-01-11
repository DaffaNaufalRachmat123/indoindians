class Category {
  final int id;
  final int parent_id;
  final String name;
  final bool is_active;
  final int position;
  final int level;
  final int product_count;
  final List<SubCategory> children_data;
  Category({
    this.id,
    this.parent_id,
    this.name,
    this.is_active,
    this.position,
    this.level,
    this.product_count,
    this.children_data
  });
  factory Category.fromJson(Map<String , dynamic> json){
    return Category(
      id : json['id'] as int,
      parent_id : json['parent_id'] as int,
      name : json['name'] as String,
      is_active : json['is_active'] as bool,
      position : json['position'] as int,
      level : json['level'] as int,
      product_count : json['product_count'] as int,
      children_data: json['children_data'] as List<SubCategory>
    );
  }
}

class SubCategory {
  final int id;
  final int parent_id;
  final String name;
  final bool is_active;
  final int position;
  final int level;
  final int product_count;
  final List<SubCategory> children_data;
  SubCategory({
    this.id,
    this.parent_id,
    this.name,
    this.is_active,
    this.position,
    this.level,
    this.product_count,
    this.children_data
  });
  factory SubCategory.fromJson(Map<String , dynamic> json){
    return SubCategory(
        id : json['id'] as int,
        parent_id : json['parent_id'] as int,
        name : json['name'] as String,
        is_active : json['is_active'] as bool,
        position : json['position'] as int,
        level : json['level'] as int,
        product_count : json['product_count'] as int,
        children_data: json['children_data'] as List<SubCategory>
    );
  }
}