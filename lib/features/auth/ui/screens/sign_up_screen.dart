import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/core/extensions/localization_extension.dart';
import 'package:ecommerce/features/auth/ui/screens/verify_otp_screen.dart';
import 'package:ecommerce/features/auth/ui/widgets/app_logo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../l10n/app_localizations.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _deliveryAddressTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          // ✅ FIXED: added child:
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
                const SizedBox(height: 8),

                Text(
                  context.localization.enterYourEmailAndPassword,
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ),

                const SizedBox(height: 32),

                TextFormField(
                  controller: _emailTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: context.localization.email,
                  ),
                ),

                const SizedBox(height: 8),

                TextFormField(
                  controller: _firstNameTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: context.localization.firstname,
                  ),
                ),

                const SizedBox(height: 8),
                TextFormField(
                  controller: _lastNameTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: context.localization.lastname,
                  ),
                ),

                const SizedBox(height: 8),
                TextFormField(
                  controller: _phoneTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: context.localization.phone,
                  ),
                ),

                const SizedBox(height: 8),

                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: _passwordTEController,
                  decoration: InputDecoration(
                    hintText: context.localization.password,
                  ),
                  obscureText: true, // 🔒 good practice for password
                ),

                const SizedBox(height: 8),
                TextFormField(
                  controller: _deliveryAddressTEController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: context.localization.deliveryaddress,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromWidth(double.maxFinite),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    foregroundColor: Colors.white,
                    backgroundColor: AppColors.themeColor,
                  ),
                  onPressed: _onTapSignUpButton,
                  child: Text(context.localization.signup),
                ),

                const SizedBox(height: 24),

                RichText(
                  text: TextSpan(
                    text: " have an account?",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: "Sign In",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.themeColor,
                        ),

                        recognizer: TapGestureRecognizer()
                          ..onTap = _onTapSignInButton,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignUpButton() {
    Navigator.pushNamed(context, VerifyOtpScreen.name);
  }

  void _onTapSignInButton() {
    Navigator.pop(context);
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
