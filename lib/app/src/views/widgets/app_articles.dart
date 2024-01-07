import 'package:dailyevents/app/src/views/pages/article_page.dart';
import 'package:dailyevents/app/src/views/widgets/app_tile_card.dart';
import 'package:dailyevents/shared/models/news_model.dart';
import 'package:flutter/material.dart';

class AppArticles extends StatelessWidget {
  final List<NewsModel> articles;
  const AppArticles({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: articles
            .map((article) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArticlePage(article: article),
                          ),
                        );
                      },
                      child: AppTileCard(article: article)),
                ))
            .toList());
  }
}
