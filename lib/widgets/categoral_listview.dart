import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/category_card.dart';

class CategoralListView extends StatelessWidget {
  final List<CategoryModel> categoryList = [
    const CategoryModel(categoty: 'sport', image: 'assets/sports.avif'),
    const CategoryModel(
        categoty: 'entertainment', image: 'assets/entertaiment.avif'),
    const CategoryModel(categoty: 'general', image: 'assets/general.avif'),
    const CategoryModel(categoty: 'health', image: 'assets/health.avif'),
    const CategoryModel(categoty: 'science', image: 'assets/science.avif'),
    const CategoryModel(categoty: 'business', image: 'assets/business.jpeg'),
    const CategoryModel(categoty: 'technology', image: 'assets/technology.jpeg')
  ];

  CategoralListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return CategoryCard(
            categoryModel: categoryList[index],
          );
        },
      ),
    );
  }
}
