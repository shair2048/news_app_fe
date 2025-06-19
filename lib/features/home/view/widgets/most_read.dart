import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_fe/features/home/viewmodel/most_read_viewmodel.dart';

class MostRead extends ConsumerWidget {
  const MostRead({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mostReadItems = ref.watch(mostReadProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'MOST READ',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xff191F33),
            fontFamily: 'Nunito',
          ),
        ),
        const SizedBox(height: 10),
        ...List.generate(mostReadItems.length, (index) {
          final mostRead = mostReadItems[index];
          return Container(
            height: 100,
            margin: EdgeInsets.only(
              top: index == 0 ? 0 : 9,
              bottom: index == mostReadItems.length - 1 ? 0 : 9,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffE9EAF0), width: 1),
              borderRadius: BorderRadius.circular(0),
            ),
            child: InkWell(
              onTap: () {
                // Handle item tap
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Expanded(
                        Text(
                          mostRead.title,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff191F33),
                            fontFamily: 'Nunito',
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        // ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.remove_red_eye,
                              size: 16,
                              color: Color(0xffA2A5B9),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${mostRead.readCount.toInt()}',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffA2A5B9),
                                fontFamily: 'Nunito',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 20),
                  Image.network(
                    mostRead.imageUrl,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}
