import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthFooter extends ConsumerWidget {
  final String? actionText;
  final VoidCallback? onTap;

  const AuthFooter({
    super.key,
    this.actionText,
    this.onTap,
  });

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
          children: [
            const TextSpan(text: ''),
            WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: GestureDetector(
                onTap: onTap,
                child: Text(
                  actionText ?? '',
                  style: const TextStyle(
                    color: Color(0xff6938EF),
                    fontSize: 11,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
