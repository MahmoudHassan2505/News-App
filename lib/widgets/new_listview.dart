import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/news_card.dart';

class NewsListview extends StatelessWidget {
  final List<ArticleModel> articles;
  const NewsListview({
    super.key,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index) {
          return NewsCard(
            article: articles[index],
          );
        },
      ),
    );
  }
}
