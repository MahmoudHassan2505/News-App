import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

class NewsCard extends StatelessWidget {
  final ArticleModel article;
  const NewsCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                article.img == null
                    ? 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg'
                    : article.img!,
                height: 250,
                fit: BoxFit.fill,
              )),
          const SizedBox(
            height: 5,
          ),
          Text(
            article.title,
            style: const TextStyle(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            article.subTitle ?? 'Sadly, There is no Details',
            style: const TextStyle(fontSize: 16, color: Colors.grey),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
