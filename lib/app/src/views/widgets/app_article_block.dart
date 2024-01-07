import 'package:flutter/material.dart';

class AppArticleBlock extends StatelessWidget {
  final String? title;
  final Widget? widget;
  const AppArticleBlock({super.key, required this.title, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Text(
            title!.toUpperCase(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        widget!,
      ],
    );
  }
}
