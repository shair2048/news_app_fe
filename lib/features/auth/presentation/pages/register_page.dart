import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_fe/shared/presentation/widgets/common_app_bar.dart';
import 'package:news_app_fe/features/auth/presentation/riverpod/provider/auth_provider.dart';
import 'package:news_app_fe/features/auth/presentation/riverpod/state/register_form_state.dart';
import 'package:news_app_fe/features/auth/presentation/widgets/auth_footer.dart';
import 'package:news_app_fe/features/auth/presentation/widgets/custom_button.dart';
import 'package:news_app_fe/features/auth/presentation/widgets/form_text_field.dart';

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
      ref.read(registerFormProvider.notifier).reset();
      // emailController.clear();
      // passwordController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(registerFormProvider);
    final registerNotifier = ref.read(registerProvider.notifier);
    final formNotifier = ref.read(registerFormProvider.notifier);

    return Scaffold(
      appBar: const CommonAppBar(),
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
                  textOnChanged: (value) => formNotifier.setFullName(value),
                  textfieldLabel: 'Name',
                  textfieldHint: 'Full name',
                  textfieldIcon: 'assets/icons/user.svg',
                ),
                SizedBox(height: 18),
                FormTextField(
                  // controller: passwordController,
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
                  textfieldHint: 'Create password',
                  textfieldIcon: 'assets/icons/lock.svg',
                  obscureText: true,
                ),
                SizedBox(height: 18),
                FormTextField(
                  // controller: passwordController,
                  textOnChanged:
                      (value) => formNotifier.setConfirmPassword(value),
                  errorMessage: formState.confirmPasswordError,
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
                      formState.isValid
                          ? () {
                            registerNotifier.submit();
                            context.go('/home');
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
