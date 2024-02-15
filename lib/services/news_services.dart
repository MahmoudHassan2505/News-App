import 'package:dio/dio.dart';

class NewsServices {
  final dio;

  NewsServices({required this.dio});

  void getTopHeadlinesNews() async {
    final response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=eg&apiKey=fa4aca5d23304347a8d898684f8a2143');
  }

  void getCategoryNews({required String category}) async {
    final response = await dio.get(
        'https://newsapi.org/v2/top-headlines/sources?country=egcategory=${category}apiKey=API_KEY');
  }
}
