import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthFooter extends ConsumerWidget {
  final String? actionText;
  const AuthFooter({super.key, this.actionText});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'Don\'t have an account? ',
          style: TextStyle(
            color: Color(0xff767E94),
            fontSize: 11,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
          children: <TextSpan>[
            TextSpan(
              text: actionText ?? '',
              style: TextStyle(
                color: Color(0xff6938EF),
                fontSize: 11,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
