import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrDivider extends ConsumerWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            // height: 10,
            thickness: 1,
            indent: 0,
            endIndent: 16,
            color: Color(0xffE9EAF0),
          ),
        ),
        const Text(
          'OR',
          style: TextStyle(
            color: Color(0xff939AAD),
            fontSize: 12,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w600,
          ),
        ),
        const Expanded(
          child: Divider(
            // height: 10,
            thickness: 1,
            indent: 16,
            endIndent: 0,
            color: Color(0xffE9EAF0),
          ),
        ),
      ],
    );
  }
}
