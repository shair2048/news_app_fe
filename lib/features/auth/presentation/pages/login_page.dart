import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:news_app_fe/shared/presentation/widgets/common_app_bar.dart';
import 'package:news_app_fe/features/auth/presentation/riverpod/provider/auth_provider.dart';
import 'package:news_app_fe/features/auth/presentation/riverpod/state/login_form_state.dart';
import 'package:news_app_fe/features/auth/presentation/widgets/auth_footer.dart';
// import 'package:news_app_fe/features/auth/presentation/widgets/auth_footer.dart';
import 'package:news_app_fe/features/auth/presentation/widgets/custom_button.dart';
import 'package:news_app_fe/features/auth/presentation/widgets/form_text_field.dart';
import 'package:news_app_fe/features/auth/presentation/widgets/or_divider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(loginProvider.notifier).reset();
      ref.read(loginFormProvider.notifier).reset();
      // emailController.clear();
      // passwordController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    // final loginState = ref.watch(loginProvider);
    final formState = ref.watch(loginFormProvider);
    final loginNotifier = ref.read(loginProvider.notifier);
    final formNotifier = ref.read(loginFormProvider.notifier);

    return Scaffold(
      appBar: CommonAppBar(),
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
              textOnChanged: (value) => formNotifier.setEmail(value),
              errorMessage: formState.emailError,
              textfieldLabel: 'Email',
              textfieldHint: 'Email address',
              textfieldIcon: 'assets/icons/email.svg',
            ),
            SizedBox(height: 18),
            FormTextField(
              // controller: passwordController,
              textOnChanged: (value) => formNotifier.setPassword(value),
              errorMessage: formState.passwordError,
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
                  formState.isValid
                      ? () {
                        loginNotifier.submit();
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
