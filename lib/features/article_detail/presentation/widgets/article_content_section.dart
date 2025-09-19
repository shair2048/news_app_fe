import 'package:flutter/material.dart';

class ArticleContentSection extends StatelessWidget {
  final String content;

  const ArticleContentSection({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: 'Nunito',
        color: Color(0xff636A80),
      ),
      textAlign: TextAlign.justify,
    );
  }
}
