import 'package:dailyevents/shared/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppArticleBody extends StatelessWidget {
  final NewsModel article;
  const AppArticleBody({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                article.source!.toUpperCase(),
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.grey),
              ),
              Text(
                article.publish!.toUpperCase(),
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.grey),
              ),
            ],
          ),
          const Gap(25),
          Text(
            article.content ?? 'No Content',
          ),
        ],
      ),
    );
  }
}
