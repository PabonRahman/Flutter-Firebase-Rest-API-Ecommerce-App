import 'package:ecommerce/app/app_config.dart';
import 'package:ecommerce/app/assets_path.dart';
import 'package:ecommerce/features/auth/ui/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../l10n/app_localizations.dart';
import '../widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, SignInScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Center(
          child: Column(
            children: [
              Spacer(),

              AppLogo(),

              Spacer(),

              // 🔹 Loader
              CircularProgressIndicator(),
              const SizedBox(height: 16),

              // 🔹 Version text
              Text(
                '${AppLocalizations.of(context)!.helloWorld} version ${AppConfig.currentAppVersion}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
