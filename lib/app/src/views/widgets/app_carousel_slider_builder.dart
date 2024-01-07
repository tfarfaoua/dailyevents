// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:dailyevents/api/services/news_api_service.dart';
import 'package:dailyevents/app/src/views/widgets/app_carousel_slider.dart';
import 'package:dailyevents/shared/models/news_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AppCarouselSliderBuilder extends StatefulWidget {
  const AppCarouselSliderBuilder({super.key});

  @override
  State<AppCarouselSliderBuilder> createState() =>
      _AppCarouselSliderBuilderState();
}

class _AppCarouselSliderBuilderState extends State<AppCarouselSliderBuilder> {
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsApiService(dio: Dio()).headlines();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsModel>?>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return AppCarouselSlider(articles: snapshot.data!);
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
