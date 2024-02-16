import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:news_app/services/news_services.dart';
import 'package:news_app/widgets/new_listview.dart';

class NewsListViewBuilder extends StatelessWidget {
  const NewsListViewBuilder({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: NewsServices(dio: Dio()).getTopHeadlinesNews(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? NewsListview(articles: snapshot.data!)
              : snapshot.hasError
                  ? const SliverToBoxAdapter(
                      child: Text("There is an error"),
                    )
                  : const SliverToBoxAdapter(
                      child: LoadingIndicator(
                          indicatorType: Indicator.semiCircleSpin),
                    );
        });
  }
}
