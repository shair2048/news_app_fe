import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app_fe/features/home/viewmodel/most_read_viewmodel.dart';
import 'package:shimmer/shimmer.dart';

class MostRead extends ConsumerWidget {
  const MostRead({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mostReadAsync = ref.watch(newsViewModelProvider);

    return mostReadAsync.when(
      data:
          (mostReadItems) => ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: mostReadItems.length,
            itemBuilder: (context, index) {
              if (index == 0) {
                // Show the title only once
                return const Text(
                  'MOST READ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff191F33),
                    fontFamily: 'Nunito',
                  ),
                );
              } else if (index == mostReadItems.length - 1) {
                return SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Handle button
                    },
                    label: const Text(
                      'LOAD MORE',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter',
                        color: Color(0xff0864ED),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffE6F0FD),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      elevation: 0,
                    ),
                  ),
                );
              }

              final mostRead = mostReadItems[index - 1];
              return Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  height: 100,
                  margin: EdgeInsets.only(
                    top: index == 0 ? 0 : 9,
                    bottom: index == mostReadItems.length - 1 ? 0 : 9,
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
                                  mostRead.title,
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
                                      '${mostRead.readCount.toInt()}',
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
                          mostRead.imageUrl,
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
                ),
              );
            },
          ),
      error: (err, s) => Center(child: Text('Error: $err')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
