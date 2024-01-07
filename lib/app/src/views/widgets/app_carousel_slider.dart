import 'package:carousel_slider/carousel_slider.dart';
import 'package:dailyevents/app/src/views/widgets/app_image_slider.dart';
import 'package:dailyevents/shared/models/news_model.dart';
import 'package:flutter/material.dart';

class AppCarouselSlider extends StatefulWidget {
  const AppCarouselSlider({
    super.key,
    required this.articles,
  });

  final List<NewsModel> articles;

  @override
  State<AppCarouselSlider> createState() => _AppCarouselSliderState();
}

class _AppCarouselSliderState extends State<AppCarouselSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.articles.length,
          carouselController: _controller,
          itemBuilder: (context, index, id) =>
              AppImageSlider(article: widget.articles[index]),
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.articles.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: _current == entry.key ? 24.0 : 8.0,
                height: 8.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    borderRadius: _current == entry.key
                        ? BorderRadius.circular(8.0)
                        : null,
                    shape: _current == entry.key
                        ? BoxShape.rectangle
                        : BoxShape.circle,
                    color: _current == entry.key
                        ? Theme.of(context).primaryColor
                        : Colors.grey.withOpacity(0.2)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
