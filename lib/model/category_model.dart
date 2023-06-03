class CategoryModel {
  final String idCategory;
  final String strCategory;
  final String strCategoryThumb;
  final String strCategoryDescription;

  CategoryModel({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      idCategory: json['idCategory'],
      strCategory: json['strCategory'],
      strCategoryThumb: json['strCategoryThumb'],
      strCategoryDescription: json['strCategoryDescription'],
    );
  }
}

class Categories {
  final List<CategoryModel> categories;

  Categories({required this.categories});

  factory Categories.fromJson(Map<String, dynamic> json) {
    List<CategoryModel> categoryList = List<CategoryModel>.from(
      json['categories'].map((category) => CategoryModel.fromJson(category)),
    );

    return Categories(categories: categoryList);
  }
}
