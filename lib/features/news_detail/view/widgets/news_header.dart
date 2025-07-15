import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewsHeader extends StatelessWidget {
  final String title;
  final String imageUrl;

  const NewsHeader({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SvgPicture.asset('assets/icons/newsdetail.svg',
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const Icon(Icons.visibility, size: 16, color: Colors.blue),
            const SizedBox(width: 4),
            const Text('25.9k'),
            const SizedBox(width: 16),
            const Icon(Icons.comment, size: 16, color: Colors.blue),
            const SizedBox(width: 4),
            const Text('657 Comments'),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
