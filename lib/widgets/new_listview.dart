import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_services.dart';
import 'package:news_app/widgets/news_card.dart';

class NewsListview extends StatefulWidget {
  const NewsListview({
    super.key,
  });

  @override
  State<NewsListview> createState() => _NewsListviewState();
}

class _NewsListviewState extends State<NewsListview> {
  List<ArticleModel> articles = [];
  @override
  void initState() {
    super.initState();
    getNews();
  }

  Future<void> getNews() async {
    articles = await NewsServices(dio: Dio()).getTopHeadlinesNews();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return articles.isEmpty
        ? const SliverToBoxAdapter(
            child: Center(
              child: LoadingIndicator(
                indicatorType: Indicator.semiCircleSpin,
              ),
            ),
          )
        : SliverList(
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
