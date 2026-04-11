import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/core/extensions/localization_extension.dart';
import 'package:ecommerce/core/widgets/centered_circular_progress_indicator.dart';
import 'package:ecommerce/core/widgets/show_snack_bar_message.dart';
import 'package:ecommerce/features/auth/data/models/sign_up_model.dart';
import 'package:ecommerce/features/auth/ui/controllers/sign_up_controller.dart';
import 'package:ecommerce/features/auth/ui/screens/verify_otp_screen.dart';
import 'package:ecommerce/features/auth/ui/widgets/app_logo.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _deliveryAddressTEController =
  TextEditingController();

  final SignUpController signUpController = Get.find<SignUpController>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 32),
              const AppLogo(),
              const SizedBox(height: 24),

              Text(
                context.localization.registerYourAccount,
                style: textTheme.titleLarge,
              ),

              const SizedBox(height: 32),

              // ================= EMAIL =================
              TextFormField(
                controller: _emailTEController,
                decoration: InputDecoration(
                  hintText: context.localization.email,
                ),
                validator: (value) =>
                value!.trim().isEmpty ? "Enter email" : null,
              ),

              const SizedBox(height: 10),

              // ================= FIRST NAME =================
              TextFormField(
                controller: _firstNameTEController,
                decoration: InputDecoration(
                  hintText: context.localization.firstname,
                ),
                validator: (value) =>
                value!.trim().isEmpty ? "Enter first name" : null,
              ),

              const SizedBox(height: 10),

              // ================= LAST NAME =================
              TextFormField(
                controller: _lastNameTEController,
                decoration: InputDecoration(
                  hintText: context.localization.lastname,
                ),
                validator: (value) =>
                value!.trim().isEmpty ? "Enter last name" : null,
              ),

              const SizedBox(height: 10),

              // ================= PHONE =================
              TextFormField(
                controller: _phoneTEController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: context.localization.phone,
                ),
                validator: (value) =>
                value!.trim().length < 11 ? "Invalid phone" : null,
              ),

              const SizedBox(height: 10),

              // ================= PASSWORD =================
              TextFormField(
                controller: _passwordTEController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: context.localization.password,
                ),
                validator: (value) =>
                value!.length < 6 ? "Min 6 characters" : null,
              ),

              const SizedBox(height: 10),

              // ================= ADDRESS =================
              TextFormField(
                controller: _deliveryAddressTEController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: context.localization.deliveryaddress,
                  contentPadding: const EdgeInsets.all(16),
                ),
                validator: (value) =>
                value!.trim().isEmpty ? "Enter address" : null,
              ),

              const SizedBox(height: 20),

              // ================= SIGN UP BUTTON =================
              GetBuilder<SignUpController>(
                builder: (controller) {
                  return Visibility(
                    visible: controller.signUpInProgress == false,
                    replacement:
                    const CenteredCircularProgressIndicator(),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.themeColor,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: _onTapSignUpButton,
                        child: const Text("Sign Up"),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 24),

              // ================= SIGN IN =================
              RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: const TextStyle(color: Colors.grey),
                  children: [
                    TextSpan(
                      text: "Sign In",
                      style: const TextStyle(
                        color: AppColors.themeColor,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.back(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= SIGN UP FUNCTION =================
  Future<void> _onTapSignUpButton() async {
    if (!_formKey.currentState!.validate()) return;

    final signUpModel = SignUpModel(
      email: _emailTEController.text.trim(),
      firstName: _firstNameTEController.text.trim(),
      lastName: _lastNameTEController.text.trim(),
      phone: _phoneTEController.text.trim(),
      password: _passwordTEController.text,
      deliveryAddress: _deliveryAddressTEController.text.trim(),
    );

    final bool isSuccess =
    await signUpController.signUp(signUpModel);

    if (isSuccess) {
      Navigator.pushNamed(context, VerifyOtpScreen.name);
    } else {
      showSnackBarMessage(
        context,
        signUpController.errorMessage ?? "Signup failed",
        true,
      );
    }
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _phoneTEController.dispose();
    _passwordTEController.dispose();
    _deliveryAddressTEController.dispose();
    super.dispose();
  }
}