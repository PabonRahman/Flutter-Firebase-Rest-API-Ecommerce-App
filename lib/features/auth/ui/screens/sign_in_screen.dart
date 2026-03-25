import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 60),
            AppLogo(),
            const SizedBox(height: 24),
            Text('Welcome Back', style: textTheme.titleLarge),
            const SizedBox(height: 8),
            const Text(
              'Enter Your Email and Password',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 16),
            TextFormField(decoration: InputDecoration(hintText: 'Email')),
            const SizedBox(height: 8),
            TextFormField(decoration: InputDecoration(hintText: 'Password')),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromWidth(double.maxFinite),
              ),
              onPressed: () {},
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
