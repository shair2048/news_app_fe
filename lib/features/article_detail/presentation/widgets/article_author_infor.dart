import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class ArticleAuthorInfo extends StatelessWidget {
  final String? authorAvatar;
  final String? authorName;
  final String publishedDate;

  const ArticleAuthorInfo({
    super.key,
    this.authorAvatar,
    this.authorName,
    required this.publishedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
            'https://res.cloudinary.com/dkn3kk3un/image/upload/f_auto,q_auto/c_fill,g_auto,h_600,w_800/v1/news_images/y1m0d3bwivmof8vcr9ch?_a=BAMClqZW0',
          ),
          radius: 20,
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              authorName != null ? authorName! : 'John Doe',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontFamily: 'Nunito',
                color: Color(0xff191F33),
              ),
            ),
            Text(
              publishedDate,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'Nunito',
                color: Color(0xff464D61),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
