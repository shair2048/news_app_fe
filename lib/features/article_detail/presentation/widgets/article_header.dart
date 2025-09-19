import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArticleHeader extends StatelessWidget {
  final String title;
  final String? imageUrl;

  const ArticleHeader({super.key, required this.title, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SvgPicture.asset(
            'assets/icons/newsdetail.svg',
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 16),
        Column(
          children: [
            Row(
              children: [
                SvgPicture.asset('assets/icons/eye.svg', width: 20, height: 20),
                const SizedBox(width: 4),
                Text(
                  '25.9k',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Nunito',
                    color: Color(0xff464D61),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: 'Nunito',
                color: Color(0xff191F33),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
