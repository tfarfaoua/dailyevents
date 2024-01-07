// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:dailyevents/app/src/views/widgets/app_article_block.dart';
import 'package:dailyevents/app/src/views/widgets/app_article_builder.dart';
import 'package:dailyevents/app/src/views/widgets/app_bar_title.dart';
import 'package:dailyevents/app/src/views/widgets/app_carousel_slider_builder.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const AppBarTitle(),
      ),
      body: const CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: AppArticleBlock(
              title: 'headlines',
              widget: AppCarouselSliderBuilder(),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: AppArticleBlock(
                title: 'Recommendation', widget: AppArticlesBuilder()),
          ),
        )
      ]),
    );
  }
}
