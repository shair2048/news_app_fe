import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app_fe/features/home/view/widgets/news_shimmer_loading.dart';
import 'package:news_app_fe/features/home/viewmodel/latest_news_viewmodel.dart';

// List<String> items = ['Item 1', 'Item 2', 'Item 3'];

class LatestNews extends ConsumerWidget {
  const LatestNews({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final latestNewsAsync = ref.watch(newsViewModelProvider);
    final itemCount = 5;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'LATEST NEWS',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xff191F33),
            fontFamily: 'Nunito',
          ),
        ),
        const SizedBox(height: 16),
        latestNewsAsync.when(
          loading:
              () => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: itemCount,
                itemBuilder:
                    (context, index) => NewsShimmerLoading(
                      firstIndex: index,
                      lastIndex: itemCount - 1,
                    ),
              ),

          data:
              (latestNewsItems) => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: latestNewsItems.length,
                itemBuilder: (context, index) {
                  final latestNews = latestNewsItems[index];
                  return Container(
                    height: 100,
                    margin: EdgeInsets.only(
                      top: index == 0 ? 0 : 9,
                      bottom: index == latestNewsItems.length - 1 ? 0 : 9,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xffE9EAF0),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(0),
                    ),

                    child: InkWell(
                      onTap: () {
                        // Handle tap
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 20,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    latestNews.title,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff191F33),
                                      fontFamily: 'Nunito',
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/eye.svg',
                                        width: 18,
                                        height: 18,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        '${latestNews.readCount.toInt()}',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Nunito',
                                          color: Color(0xff767E94),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Image.network(
                            latestNews.imageUrl,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                            errorBuilder:
                                (_, __, ___) => Container(
                                  height: 100,
                                  width: 100,
                                  color: Colors.grey[300],
                                  child: const Icon(Icons.broken_image),
                                ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
          error: (err, s) => Center(child: Text('Error: $err')),
        ),
      ],
    );
  }
}
