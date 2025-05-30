import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FormTextField extends ConsumerWidget {
  final String textfieldLabel;
  final String textfieldHint;
  final String textfieldIcon;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final Function(String)? textOnChanged;
  final String? errorMessage;

  const FormTextField({
    super.key,
    this.controller,
    this.validator,
    required this.textfieldLabel,
    required this.textfieldHint,
    required this.textfieldIcon,
    this.obscureText = false,
    this.textOnChanged,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textfieldLabel,
          style: TextStyle(
            color: Color(0xff767E94),
            fontSize: 14,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          onChanged: textOnChanged,
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: textfieldHint,
            hintStyle: TextStyle(
              color: Color(0xff767E94),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
            errorText: errorMessage,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 18, right: 12),
              child: SvgPicture.asset(
                textfieldIcon,
                height: 24,
                width: 24,
                colorFilter: ColorFilter.mode(
                  Color(0xff0864ED),
                  BlendMode.srcIn,
                ),
              ),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: BorderSide(color: Color(0xffE9EAF0), width: 0.5),
            ),
          ),
        ),
      ],
    );
  }
}
