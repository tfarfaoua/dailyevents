import 'package:dailyevents/app/src/views/widgets/app_article_app_bar.dart';
import 'package:dailyevents/app/src/views/widgets/app_article_body.dart';
import 'package:dailyevents/shared/models/news_model.dart';
import 'package:flutter/material.dart';

class ArticlePage extends StatefulWidget {
  final NewsModel article;
  const ArticlePage({super.key, required this.article});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppArticleAppBar(article: widget.article),
          SliverToBoxAdapter(
            child: AppArticleBody(article: widget.article),
          )
        ],
      ),
    );
  }
}
