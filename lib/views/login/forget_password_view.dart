import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:assignment/views/login/login_view.dart';
import 'package:assignment/views/login/verify_otp_view.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatefulWidget {
  static String forgotPasswordView = 'forgot_password_view';

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  String phoneNumber = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FarmerEats'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 64.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Forgot Password?',
                    style:
                        TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    children: [
                      Text(
                        'Remember your password?',
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.start,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, LoginView.loginView);
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone_outlined),
                      labelText: "Phone Number",
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8.0)),
                      fillColor: Colors.grey[300],
                      filled: true),
                  onChanged: (value) => phoneNumber = value,
                ),
                const SizedBox(height: 20.0),
                // ElevatedButton for sending code
                ElevatedButton(
                  onPressed: () async {
                    final url =
                        'https://sowlab.pw/assignment/user/forgot-password';
                    final res = await http
                        .post(
                          Uri.parse(url),
                          body: jsonEncode({'phone': phoneNumber}),
                        )
                        .then(
                            (value) => print(" Res : ${value.body.toString()}"))
                        .catchError((e) => print(e));
                    Navigator.pushNamed(context, VerifyOtpView.verifyOtpView);
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color(0xffD5715B),
                    ),
                  ),
                  child: const SizedBox(
                    width: double.maxFinite,
                    child: Center(
                      child: Text(
                        'Send Code',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
