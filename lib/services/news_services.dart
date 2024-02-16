import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsServices {
  final dio;

  NewsServices({required this.dio});

  Future<List<ArticleModel>> getTopHeadlinesNews() async {
    try {
      final Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=fa4aca5d23304347a8d898684f8a2143');

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> newsList = jsonData['articles'];
      List<ArticleModel> articles = [];
      for (var article in newsList) {
        articles.add(ArticleModel.jsonToObject(article));
      }
      return articles;
    } catch (e) {
      return [];
    }
  }

  Future<List<ArticleModel>> getCategoryNews({required String category}) async {
    final Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines/sources?apiKey=fa4aca5d23304347a8d898684f8a2143&category=$category');

    Map<String, dynamic> jsonData = response.data;

    List<dynamic> newsList = jsonData['articles'];
    List<ArticleModel> articles = [];
    for (var article in newsList) {
      articles.add(ArticleModel.jsonToObject(article));
    }
    return articles;
  }
}
