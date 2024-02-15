import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_card.dart';

class NewsListview extends StatelessWidget {
  const NewsListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: 10, (context, index) {
        return NewsCard();
      }),
    );
  }
}
