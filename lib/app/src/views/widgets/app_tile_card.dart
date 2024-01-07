import 'package:dailyevents/app/src/views/widgets/app_text_list.dart';
import 'package:dailyevents/shared/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppTileCard extends StatelessWidget {
  final NewsModel article;
  const AppTileCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1, color: Colors.black12)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: article.image != null
                ? Image.network(
                    article.image!,
                    height: 90,
                    width: 120,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/no_image.png',
                    height: 90,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
          ),
          const Gap(10),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AppTextList(
                    color: Theme.of(context).primaryColor,
                    list: article.category ?? ['Uncategored']),
                const Gap(5),
                Text(
                  article.title!,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                AppTextList(
                    color: Colors.grey,
                    weight: FontWeight.w400,
                    linesItem: 2,
                    overflow: TextOverflow.ellipsis,
                    list: article.autor ?? ['Unkown']),
              ],
            ),
          )
        ],
      ),
    );
  }
}
