import 'package:dailyevents/app/src/views/pages/article_page.dart';
import 'package:dailyevents/app/src/views/widgets/app_text_list.dart';
import 'package:dailyevents/shared/models/news_model.dart';
import 'package:flutter/material.dart';

class AppImageSlider extends StatelessWidget {
  final NewsModel article;
  const AppImageSlider({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticlePage(article: article),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.indigoAccent,
          borderRadius: BorderRadius.circular(15),
        ),
        //margin: const EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            fit: StackFit.expand,
            children: [
              article.image != null
                  ? Image.network(
                      article.image!,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/no_image.png',
                      fit: BoxFit.cover,
                    ),
              Positioned(
                top: 10,
                left: 10,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 10),
                    child:
                        AppTextList(list: article.category ?? ['Uncategored']),
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: AppTextList(
                          list: article.autor ?? ['Unknow'],
                          fontSize: 10,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            bottom: 10.0, right: 10, left: 10, top: 5),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.black,
                                Colors.transparent,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter),
                        ),
                        child: Text(
                          article.title!.toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
