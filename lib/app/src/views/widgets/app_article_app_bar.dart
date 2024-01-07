import 'package:dailyevents/app/src/views/widgets/app_article_header.dart';
import 'package:dailyevents/shared/models/news_model.dart';
import 'package:flutter/material.dart';

class AppArticleAppBar extends StatelessWidget {
  final NewsModel article;
  final double size = 40;
  const AppArticleAppBar({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return SliverAppBar(
      leading: IconButton(
        icon: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.25),
              borderRadius: BorderRadius.circular(20)),
          child: const Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      expandedHeight: MediaQuery.of(context).size.height * 0.4,
      flexibleSpace: AppArticleHeader(article: article),
      pinned: true,
      collapsedHeight: height * 0.125,
      stretch: true,
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: SizedBox(
            height: 30,
            width: double.infinity,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40.0),
                ),
              ),
            ),
          )),
    );
  }
}
