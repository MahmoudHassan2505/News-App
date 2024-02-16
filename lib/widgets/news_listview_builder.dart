import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_services.dart';
import 'package:news_app/widgets/new_listview.dart';

class NewsListViewBuilder extends StatefulWidget {
  final String categoty;
  const NewsListViewBuilder({super.key, required this.categoty});

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future =
        NewsServices(dio: Dio()).getCategoryNews(category: widget.categoty);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? NewsListview(articles: snapshot.data!)
              : snapshot.hasError
                  ? const SliverToBoxAdapter(
                      child: Text("There is an error"),
                    )
                  : const SliverToBoxAdapter(
                      child: Center(
                        child: LoadingIndicator(
                            indicatorType: Indicator.semiCircleSpin),
                      ),
                    );
        });
  }
}
