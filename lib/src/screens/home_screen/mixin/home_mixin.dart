part of '../home_screen.dart';

mixin HomeMixin on State<HomeScreen> {


 late  CategoryLang selectedCategory = categoryLang.first;


  List<CategoryLang> categoryLang = [
    CategoryLang(uz: "Hammasi", en: "All", ru: "Все"),
    CategoryLang(uz: "Uzuk", en: "Ring", ru: "Кольцо"),
    CategoryLang(uz: "Marjon", en: "Necklace", ru: "Ожерелье"),
    CategoryLang(uz: "Bilaguzuk", en: "Bracelet", ru: "Браслет"),
  ];
  List<CategoryLang> selectedCategoryLang = [
    CategoryLang(uz: "Hammasi", en: "All", ru: "Все"),
  ];

}

class CategoryLang {
  String uz;
  String en;
  String ru;

  CategoryLang({
    required this.uz,
    required this.en,
    required this.ru,
  });

  String currentLocale(String locale) {
    return switch(locale) {
      "uz" => uz,
      "ru" => ru,
      "en" => en,
      _ => "",
    };
  }


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryLang &&
          runtimeType == other.runtimeType &&
          uz == other.uz &&
          en == other.en &&
          ru == other.ru;

  @override
  int get hashCode => uz.hashCode ^ en.hashCode ^ ru.hashCode;

  String get forDB => en;
}