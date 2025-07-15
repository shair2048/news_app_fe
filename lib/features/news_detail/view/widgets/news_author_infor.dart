import 'package:flutter/material.dart';

class NewsAuthorInfo extends StatelessWidget {
  final String authorImage;
  final String authorName;
  final String publishedDate;

  const NewsAuthorInfo({
    super.key,
    required this.authorImage,
    required this.authorName,
    required this.publishedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(authorImage), // Sử dụng AssetImage để load ảnh từ assets
          radius: 20,
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              authorName,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontFamily: 'Nunito',
              ),
            ),
            Text(
              publishedDate,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontFamily: 'Nunito',
              ),
            ),
          ],
        )
      ],
    );
  }
}