import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app_fe/features/home/viewmodel/most_read_viewmodel.dart';

class MostRead extends ConsumerWidget {
  const MostRead({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mostReadAsync = ref.watch(newsViewModelProvider);

    return mostReadAsync.when(
      data:
          (mostReadItems) => Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
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
              const SizedBox(height: 16),

              // ...List.generate(mostReadItems.length, (index) {
              //   final mostRead = mostReadItems[index];
              //   return Container(
              //     height: 100,
              //     width: double.infinity,
              //     margin: EdgeInsets.only(
              //       top: index == 0 ? 0 : 9,
              //       bottom: index == mostReadItems.length - 1 ? 0 : 9,
              //     ),
              //     decoration: BoxDecoration(
              //       border: Border.all(
              //         color: const Color(0xffE9EAF0),
              //         width: 1,
              //       ),
              //       borderRadius: BorderRadius.circular(0),
              //     ),
              //     child: InkWell(
              //       onTap: () {
              //         // Handle item tap
              //       },
              //       child: Row(
              //         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           // Padding(
              //           //   padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              //           // child: Expanded(
              //           // child: Container(
              //           // width: double.infinity,
              //           // height: 100,
              //           Expanded(
              //             // flex: 1,
              //             child: Column(
              //               // mainAxisAlignment: MainAxisAlignment.center,
              //               // crossAxisAlignment: CrossAxisAlignment.stretch,
              //               children: [
              //                 // Padding(
              //                 //   padding: const EdgeInsets.symmetric(
              //                 //     horizontal: 8.0,
              //                 //   ),
              //                 Expanded(
              //                   // flex: 1,
              //                   child: Text(
              //                     mostRead.title,
              //                     style: const TextStyle(
              //                       fontSize: 14,
              //                       fontWeight: FontWeight.w400,
              //                       color: Color(0xff191F33),
              //                       fontFamily: 'Nunito',
              //                     ),
              //                     overflow: TextOverflow.ellipsis,
              //                     maxLines: 2,
              //                   ),
              //                 ),
              //                 // ),
              //                 // Text(
              //                 //   mostRead.description,
              //                 //   style: const TextStyle(
              //                 //     fontSize: 14,
              //                 //     fontWeight: FontWeight.w400,
              //                 //     color: Color(0xff767E94),
              //                 //     fontFamily: 'Nunito',
              //                 //   ),
              //                 //   overflow: TextOverflow.ellipsis,
              //                 //   maxLines: 2,
              //                 // ),
              //                 // SizedBox(height: 8),
              //                 // Row(
              //                 //   children: [
              //                 //     SvgPicture.asset(
              //                 //       'assets/icons/eye.svg',
              //                 //       width: 18,
              //                 //       height: 18,
              //                 //     ),
              //                 //     const SizedBox(width: 6),
              //                 //     Text(
              //                 //       '${mostRead.readCount.toInt()}',
              //                 //       style: const TextStyle(
              //                 //         fontSize: 14,
              //                 //         fontWeight: FontWeight.w400,
              //                 //         fontFamily: 'Nunito',
              //                 //         color: Color(0xff767E94),
              //                 //       ),
              //                 //     ),
              //                 //   ],
              //                 // ),
              //               ],
              //             ),
              //           ),
              //           // ),
              //           // ),

              //           // ),
              //           SizedBox(width: 20),
              //           Image.network(
              //             mostRead.imageUrl,
              //             height: 100,
              //             width: 100,
              //             fit: BoxFit.cover,
              //           ),
              //         ],
              //       ),
              //     ),
              //   );
              // }),
              const SizedBox(height: 18),
              SizedBox(
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
              ),
            ],
          ),
      // ),
      error: (error, stack) => Center(child: Text('Error: $error')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
