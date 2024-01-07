import 'package:flutter/material.dart';

class AppTextList extends StatelessWidget {
  const AppTextList({
    super.key,
    this.fontSize = 12,
    this.color = Colors.white,
    this.weight = FontWeight.w500,
    this.overflow,
    this.linesItem,
    required this.list,
  });

  final List<dynamic>? list;
  final double? fontSize;
  final TextOverflow? overflow;
  final int? linesItem;
  final Color color;
  final FontWeight? weight;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        children: list!
            .map(
              (e) => Text(
                e.toUpperCase(),
                style: TextStyle(
                    color: color, fontSize: fontSize, fontWeight: weight),
                overflow: overflow,
                maxLines: linesItem,
              ),
            )
            .toList());
  }
}
