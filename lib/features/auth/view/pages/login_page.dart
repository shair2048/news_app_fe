import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:news_app_fe/core/widgets/custom_app_bar.dart';
import 'package:news_app_fe/features/auth/view/widgets/auth_footer.dart';
import 'package:news_app_fe/features/auth/view/widgets/custom_button.dart';
import 'package:news_app_fe/features/auth/view/widgets/form_text_field.dart';
import 'package:news_app_fe/features/auth/view/widgets/or_divider.dart';
import 'package:news_app_fe/features/auth/viewmodel/login_viewmodel.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(loginProvider.notifier).reset();
      // emailController.clear();
      // passwordController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginProvider);
    final notifier = ref.read(loginProvider.notifier);

    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Colors.white,
      body: Padding(
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
              // controller: emailController,
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
              textfieldHint: 'Password',
              textfieldIcon: 'assets/icons/lock.svg',
              obscureText: true,
            ),
            SizedBox(height: 32),
            CustomButton(
              buttonLabel: 'SIGN IN',
              buttonLabelColor: Colors.white,
              buttonColor: const Color(0xff0864ED),
              onPressed:
                  state.isValid
                      ? () {
                        notifier.submit();
                        context.go('/home');
                      }
                      : null,
            ),
            SizedBox(height: 32),
            const OrDivider(),
            SizedBox(height: 32),
            CustomButton(
              buttonLabel: 'Sign in with Google',
              buttonIcon: 'assets/icons/google_icon.svg',
              buttonColor: Colors.white,
              buttonLabelColor: Color(0xff191F33),
              onPressed: () {
                // Handle Google sign in action
              },
            ),
            SizedBox(height: 20),
            CustomButton(
              buttonLabel: 'Sign in with Facebook',
              buttonIcon: 'assets/icons/facebook_icon.svg',
              buttonColor: Colors.white,
              buttonLabelColor: Color(0xff191F33),
              onPressed: () {
                // Handle Facebook sign in action
              },
            ),
            SizedBox(height: 20),
            AuthFooter(
              textContent: 'Don\'t have an account? ',
              actionText: 'Sign Up',
              onTap: () => context.go('/register'),
            ),
          ],
        ),
      ),
    );
  }
}
