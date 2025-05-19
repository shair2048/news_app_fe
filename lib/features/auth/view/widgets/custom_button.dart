import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends ConsumerWidget {
  final String? buttonLabel;
  final String? buttonLabelColor;
  final String? buttonIcon;
  final String? buttonColor;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    this.buttonLabel,
    this.buttonLabelColor,
    this.buttonIcon,
    this.buttonColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon:
            buttonIcon != null
                ? SvgPicture.asset(buttonIcon!, width: 20, height: 20)
                : null,

        style: ElevatedButton.styleFrom(
          backgroundColor:
              buttonColor != null
                  ? Color(int.parse(buttonColor!))
                  : const Color(0xffffffff),
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            side: const BorderSide(color: Color(0xffE9EAF0), width: 1),
          ),
          elevation: 0,
        ),

        label: Text(
          buttonLabel ?? '',
          style: TextStyle(
            color:
                buttonLabelColor != null
                    ? Color(int.parse(buttonLabelColor!))
                    : const Color(0xff000000),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
