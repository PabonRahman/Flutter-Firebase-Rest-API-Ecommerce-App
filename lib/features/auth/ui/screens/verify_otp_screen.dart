import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/core/extensions/localization_extension.dart';
import 'package:ecommerce/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ecommerce/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  static const String name = '/verify-otp-screen';

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController otpTEController = TextEditingController();

  @override
  void dispose() {
    otpTEController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 60),

              const AppLogo(),

              const SizedBox(height: 24),

              Text(
                context.localization.enteryourotpcode,
                style: textTheme.titleLarge,
              ),

              const SizedBox(height: 8),

              Text(
                context.localization.afourdigitcodehasbeensent,
                style: const TextStyle(color: Colors.grey, fontSize: 16),
              ),

              const SizedBox(height: 24),

              /// ✅ OTP FIELD
              PinCodeTextField(
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                controller: otpTEController,
                appContext: context,
                keyboardType: TextInputType.number,

                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 50,
                  fieldWidth: 45,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  activeColor: AppColors.themeColor,
                  selectedColor: AppColors.themeColor,
                  inactiveColor: Colors.grey,
                ),

                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,

                onCompleted: (value) {
                  debugPrint("OTP: $value");
                },

                onChanged: (value) {},
              ),

              const SizedBox(height: 16),

              /// ✅ VERIFY BUTTON
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromWidth(double.maxFinite),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  foregroundColor: Colors.white,
                  backgroundColor: AppColors.themeColor,
                ),
                onPressed: _onTapVerifyButton,
                child: Text(context.localization.verify),
              ),

              const SizedBox(height: 12),

              /// ✅ RESEND BUTTON
              TextButton(
                onPressed: _onTapResend,
                child: const Text("Resend OTP"),
              ),

              const SizedBox(height: 24),

              /// ✅ SIGN UP NAVIGATION

            ],
          ),
        ),
      ),
    );
  }

  /// ✅ VERIFY FUNCTION
  void _onTapVerifyButton() {
    String otp = otpTEController.text.trim();

    if (otp.length == 6) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Verifying OTP: $otp")));

      // 👉 TODO: Add Firebase OTP verification here
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Enter valid 4-digit OTP")));
    }
  }

  /// ✅ RESEND OTP
  void _onTapResend() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("OTP Resent")));

    // 👉 TODO: Call resend OTP API
  }

  /// ✅ NAVIGATE TO SIGN UP
  void _onTapSignUpButton() {
    Navigator.pushNamed(context, SignUpScreen.name);
  }
}
