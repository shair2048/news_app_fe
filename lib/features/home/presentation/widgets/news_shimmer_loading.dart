import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class NewsShimmerLoading extends ConsumerWidget {
  final int firstIndex;
  final int lastIndex;

  const NewsShimmerLoading({
    super.key,
    required this.firstIndex,
    required this.lastIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 100,
        margin: EdgeInsets.only(
          top: firstIndex == 0 ? 0 : 9,
          bottom: lastIndex == 4 ? 0 : 9,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffE9EAF0), width: 1),
          borderRadius: BorderRadius.circular(0),
        ),

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
                    Container(
                      width: double.infinity,
                      height: 20,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      height: 20,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            Container(width: 100, height: 100, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
