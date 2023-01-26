import 'dart:convert';

class Category {
  final String name;
  final int id;

  const Category({
    required this.name,
    required this.id,
  });


  factory Category.fromJson(Map<String, dynamic> jsonData) {
    return Category(
      id: jsonData['id'],
      name: jsonData['name'],
    );
  }

  static Map<String, dynamic> toMap(Category category) => {
    'id': category.id,
    'name': category.name,
  };

  static String encode(List<Category> categories) => jsonEncode(
    categories
      .map<Map<String, dynamic>>((category) => Category.toMap(category))
      .toList(),
  );

  static List<Category> decode(String? categories) {
    if (categories == null){
      return [];
    }

    return (jsonDecode(categories) as List<dynamic>).map<Category>((category) => Category.fromJson(category)).toList();
  }
}