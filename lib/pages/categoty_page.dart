import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_listview_builder.dart';

class CategoryPage extends StatelessWidget {
  final String category;
  const CategoryPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        NewsListViewBuilder(categoty: category),
      ],
    );
  }
}
