class ArticleModel {
  final String? img;
  final String title;
  final String? subTitle;

  ArticleModel({
    required this.img,
    required this.subTitle,
    required this.title,
  });

  static jsonToObject(Map<String, dynamic> json) {
    return ArticleModel(
        img: json['urlToImage'],
        subTitle: json['description'],
        title: json['title']);
  }
}
