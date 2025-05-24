import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_fe/core/widgets/custom_app_bar.dart';
import 'package:news_app_fe/features/auth/view/widgets/auth_footer.dart';
import 'package:news_app_fe/features/auth/view/widgets/custom_button.dart';
import 'package:news_app_fe/features/auth/view/widgets/form_text_field.dart';
import 'package:news_app_fe/features/auth/viewmodel/register_viewmodel.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(registerProvider.notifier).reset();
      // emailController.clear();
      // passwordController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(registerProvider);
    final notifier = ref.read(registerProvider.notifier);

    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 44),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'HELLO!',
                  style: TextStyle(
                    color: Color(0xff767E94),
                    fontSize: 12,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Create account',
                  style: TextStyle(
                    color: Color(0xff191F33),
                    fontSize: 32,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 32),
                FormTextField(
                  // controller: emailController,
                  textOnChanged: (value) => notifier.setFullName(value),
                  textfieldLabel: 'Name',
                  textfieldHint: 'Full name',
                  textfieldIcon: 'assets/icons/user.svg',
                ),
                SizedBox(height: 18),
                FormTextField(
                  // controller: passwordController,
                  textOnChanged: (value) => notifier.setEmail(value),
                  errorMessage: state.emailError,
                  textfieldLabel: 'Email',
                  textfieldHint: 'Email address',
                  textfieldIcon: 'assets/icons/email.svg',
                ),
                SizedBox(height: 18),
                FormTextField(
                  // controller: passwordController,
                  textOnChanged: (value) => notifier.setPassword(value),
                  errorMessage: state.passwordError,
                  textfieldLabel: 'Password',
                  textfieldHint: 'Create password',
                  textfieldIcon: 'assets/icons/lock.svg',
                  obscureText: true,
                ),
                SizedBox(height: 18),
                FormTextField(
                  // controller: passwordController,
                  textOnChanged: (value) => notifier.setConfirmPassword(value),
                  errorMessage: state.confirmPasswordError,
                  textfieldLabel: 'Confirm Password',
                  textfieldHint: 'Confirm password',
                  textfieldIcon: 'assets/icons/lock.svg',
                  obscureText: true,
                ),
                SizedBox(height: 32),
                CustomButton(
                  buttonLabel: 'CREATE ACCOUNT',
                  buttonLabelColor: Colors.white,
                  buttonColor: const Color(0xff0864ED),
                  onPressed:
                      state.isValid
                          ? () {
                            notifier.submit();
                          }
                          : null,
                ),
              ],
            ),

            AuthFooter(
              textContent: 'Already have an account? ',
              actionText: 'Sign In',
              onTap: () => context.go('/login'),
            ),
          ],
        ),
      ),
    );
  }
}
