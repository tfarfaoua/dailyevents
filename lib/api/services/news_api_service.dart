import 'package:dailyevents/shared/models/news_model.dart';
import 'package:dio/dio.dart';

class NewsApiService {
  final Dio dio;

  NewsApiService({required this.dio});

  Future<List<NewsModel>?> headlines() async {
    var path =
        'https://newsdata.io/api/1/news?apikey=pub_354238c3d4e8e95c0a920cd1a9107827d1a09&q=top&country=ma';
    var response = await dio.get(path);

    Map<String, dynamic> resToJson = response.data;
    List<dynamic> results = resToJson['results'];
    List<NewsModel> articles = [];

    for (var result in results) {
      NewsModel object = NewsModel(
        title: result["title"],
        description: result["description"],
        content: result["content"],
        category: result["category"],
        autor: result["creator"],
        source: result["source_id"],
        image: result["image_url"],
        publish: result["pubDate"],
      );
      articles.add(object);
    }

    return articles;
  }

  Future<List<NewsModel>?> recommendation() async {
    var path =
        'https://newsdata.io/api/1/news?apikey=pub_354238c3d4e8e95c0a920cd1a9107827d1a09&country=ma';
    var response = await dio.get(path);

    Map<String, dynamic> resToJson = response.data;
    List<dynamic> results = resToJson['results'];
    List<NewsModel> articles = [];

    for (var result in results) {
      NewsModel object = NewsModel(
        title: result["title"],
        description: result["description"],
        content: result["content"],
        category: result["category"],
        autor: result["creator"],
        source: result["source_id"],
        image: result["image_url"],
        publish: result["pubDate"],
      );
      articles.add(object);
    }

    return articles;
  }
}
