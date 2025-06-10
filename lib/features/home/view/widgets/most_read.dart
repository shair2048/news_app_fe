import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MostRead extends ConsumerWidget {
  const MostRead({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                "MOST READ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            );
          }

          final realIndex = index - 1;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Card(
              child: Column(
                children: [
                  Image.network(
                    'https://res.cloudinary.com/dkn3kk3un/image/upload/f_auto,q_auto/c_fill,g_auto,h_600,w_800/v1/news_images/y1m0d3bwivmof8vcr9ch?_a=BAMClqZW0',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "title $realIndex",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text("content for news"),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.visibility, size: 16),
                            SizedBox(width: 4),
                            Text('80.4k'),
                            SizedBox(width: 16),
                            Icon(Icons.comment, size: 16),
                            SizedBox(width: 4),
                            Text('94 Comments'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        childCount: 11, // 1 title + 10 bài viết
      ),
    );
  }
}
