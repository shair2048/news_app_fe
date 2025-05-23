import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_fe/core/widgets/custom_app_bar.dart';
import 'package:news_app_fe/features/auth/view/widgets/auth_footer.dart';
import 'package:news_app_fe/features/auth/view/widgets/custom_button.dart';
import 'package:news_app_fe/features/auth/view/widgets/form_text_field.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void onRegisterTap() {
    if (_formKey.currentState!.validate()) {
      print('Full Name: ${fullNameController.text}');
      print('Email: ${emailController.text}');
      print('Password: ${passwordController.text}');
      print('Confirm Password: ${confirmPasswordController.text}');
    }
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email không được để trống';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Email không hợp lệ';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mật khẩu không được để trống';
    }
    if (value.contains(' ')) {
      return 'Mật khẩu không được chứa khoảng trắng';
    }
    if (value.length < 8 || value.length > 64) {
      return 'Mật khẩu phải từ 8 đến 64 ký tự';
    }

    final regex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%^&*(),.?":{}|<>]).{8,64}$',
    );
    if (!regex.hasMatch(value)) {
      return 'Mật khẩu phải có chữ hoa, chữ thường, số và ký tự đặc biệt';
    }

    return null;
  }

  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Xác nhận mật khẩu không được để trống';
    }
    if (value != passwordController.text) {
      return 'Mật khẩu xác nhận không khớp';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'HELLO!',
                style: TextStyle(
                  color: Color(0xff767E94),
                  fontSize: 12,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Create account',
                style: TextStyle(
                  color: Color(0xff191F33),
                  fontSize: 32,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 32),
              FormTextField(
                controller: fullNameController,
                textfieldLabel: 'Full name',
                textfieldHint: 'Your full name',
                textfieldIcon: 'assets/icons/user.svg',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Họ tên không được để trống';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 18),
              FormTextField(
                controller: emailController,
                textfieldLabel: 'Email',
                textfieldHint: 'Email address',
                textfieldIcon: 'assets/icons/email.svg',
                validator: emailValidator,
              ),
              const SizedBox(height: 18),
              FormTextField(
                controller: passwordController,
                textfieldLabel: 'Password',
                textfieldHint: 'Create password',
                textfieldIcon: 'assets/icons/lock.svg',
                obscureText: true,
                validator: passwordValidator,
              ),
              const SizedBox(height: 18),
              FormTextField(
                controller: confirmPasswordController,
                textfieldLabel: 'Confirm Password',
                textfieldHint: 'Confirm your password',
                textfieldIcon: 'assets/icons/lock.svg',
                obscureText: true,
                validator: confirmPasswordValidator,
              ),
              const SizedBox(height: 32),
              CustomButton(
                buttonLabel: 'CREATE ACCOUNT',
                buttonLabelColor: Colors.white,
                buttonColor: const Color(0xff0864ED),
                onPressed: onRegisterTap, // <-- Quan trọng!
              ),
              const SizedBox(height: 32),
              AuthFooter(actionText: 'Sign in', onTap: () => context.go('/')),
            ],
          ),
        ),
      ),
    );
  }
}
