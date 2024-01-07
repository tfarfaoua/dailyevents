import 'package:dailyevents/app/src/views/widgets/app_text_list.dart';
import 'package:dailyevents/shared/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppArticleHeader extends StatelessWidget {
  final NewsModel article;
  const AppArticleHeader({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Stack(
        children: [
          article.image != null
              ? Positioned.fill(
                  child: Image.network(
                    article.image!,
                    fit: BoxFit.cover,
                  ),
                )
              : Positioned.fill(
                  child: Image.asset(
                    'assets/no_image.png',
                    fit: BoxFit.cover,
                  ),
                ),
          Positioned(
            bottom: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black45, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 30, horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.85),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2.5, horizontal: 10.0),
                            child: AppTextList(
                              list: article.category ?? ['Uncategored'],
                            )),
                      ),
                      const Gap(15),
                      Text(
                        article.title!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                      ),
                      const Gap(5),
                      Text(
                        '${article.autor ?? 'Unknow'} • ${article.publish!}'
                            .toUpperCase(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 10),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      stretchModes: const [
        StretchMode.blurBackground,
        StretchMode.zoomBackground,
        StretchMode.fadeTitle,
      ],
    );
  }
}
