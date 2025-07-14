import 'package:flutter/material.dart';

class NewsContentSection extends StatelessWidget {
  final String content;

  const NewsContentSection({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 14,
        color: Colors.black87,
        height: 1.6,
      ),
    );
  }
}