import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/core/extensions/localization_extension.dart';
import 'package:ecommerce/features/auth/ui/widgets/app_logo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../l10n/app_localizations.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          // ✅ FIXED: added child:
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 60),
              const AppLogo(),
              const SizedBox(height: 24),

              Text(
                context.localization.welcomeBack,
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 8),

              Text(
                context.localization.enterYourEmailAndPassword,
                style: const TextStyle(color: Colors.grey, fontSize: 16),
              ),

              const SizedBox(height: 16),

              TextFormField(
                decoration: InputDecoration(
                  hintText: context.localization.email,
                ),
              ),

              const SizedBox(height: 8),

              TextFormField(
                decoration: InputDecoration(
                  hintText: context.localization.password,
                ),
                obscureText: true, // 🔒 good practice for password
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
                onPressed: () {
                  FirebaseCrashlytics.instance.log('Entered sign in button');
                  throw Exception('my custom error');
                },
                child: Text(context.localization.signin),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
