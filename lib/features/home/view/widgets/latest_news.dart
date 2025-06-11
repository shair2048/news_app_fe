import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<String> items = ['Item 1', 'Item 2', 'Item 3'];

class LatestNews extends ConsumerWidget {
  const LatestNews({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        const SizedBox(height: 10),
        ...List.generate(
          items.length,
          (index) => Container(
            height: 100,
            margin: EdgeInsets.only(
              top: index == 0 ? 0 : 9,
              bottom: index == items.length - 1 ? 0 : 9,
            ),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(0),
            ),
            child: InkWell(
              onTap: () {
                // Handle item tap
              },
              child: Center(
                child: Text(
                  items[index],
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
