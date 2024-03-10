import 'package:assignment/model/user_provider.dart';
import 'package:assignment/views/login/forget_password_view.dart';
import 'package:assignment/views/login/login_view.dart';
import 'package:assignment/views/login/reset_password_view.dart';
import 'package:assignment/views/login/verify_otp_view.dart';
import 'package:assignment/views/register/bussiness_hours_view.dart';
import 'package:assignment/views/register/done_view.dart';
import 'package:assignment/views/register/farm_info_view.dart';
import 'package:assignment/views/register/register_view.dart';
import 'package:assignment/views/register/verificaton_view.dart';
import 'package:assignment/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => UserDataProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(200, 118, 97, 1),
        ),
      ),
      home: SplashView(),
      routes: {
        LoginView.loginView: (context) => const LoginView(),
        ForgotPasswordView.forgotPasswordView: (context) =>
            ForgotPasswordView(),
        ResetPasswordView.resetPasswordView: (context) => ResetPasswordView(),
        VerifyOtpView.verifyOtpView: (context) => VerifyOtpView(),
        RegisterView.registerView: (context) => RegisterView(),
        FarmInfoView.farmInfoView: (context) => FarmInfoView(),
        VerificationView.verficationView: (context) => VerificationView(),
        BusinessHoursView.businessHoursView: (context) => BusinessHoursView(),
        DoneView.doneView: (context) => DoneView(),
      },
    );
  }
}
