import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:news_app_fe/core/widgets/custom_app_bar.dart';
import 'package:news_app_fe/features/auth/view/widgets/custom_button.dart';
import 'package:news_app_fe/features/auth/view/widgets/form_text_field.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'WELCOME BACK!',
                  style: TextStyle(
                    color: Color(0xff767E94),
                    fontSize: 12,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Login',
                  style: TextStyle(
                    color: Color(0xff191F33),
                    fontSize: 32,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 32),
                FormTextField(
                  textfieldLabel: 'Email',
                  textfieldHint: 'Email address',
                  textfieldIcon: 'assets/icons/email.svg',
                ),
                SizedBox(height: 18),
                FormTextField(
                  textfieldLabel: 'Password',
                  textfieldHint: 'Password',
                  textfieldIcon: 'assets/icons/lock.svg',
                ),
                SizedBox(height: 32),
                CustomButton(buttonText: 'SIGN IN'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
