import 'package:assignment/views/login/login_view.dart';
import 'package:assignment/views/login/reset_password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:http/http.dart' as http;

class VerifyOtpView extends StatefulWidget {
  static String verifyOtpView = 'verify_otp_view';
  @override
  _VerifyOtpViewState createState() => _VerifyOtpViewState();
}

class _VerifyOtpViewState extends State<VerifyOtpView> {
  String myCode = '';

  void verifyCode(code) async {
    print(code);
    final String url = 'https://sowlab.pw/assignment/user/verify-otp';
    await http
        .post(
          Uri.parse(url),
          body: {'otp': code.toString()},
        )
        .then((value) => print(" Res : ${value.body.toString()}"))
        .catchError((e) => print(e));
    Navigator.pushNamed(context, ResetPasswordView.resetPasswordView);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FarmerEats'), // Assuming this is the app title
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 64.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Veriy OTP',
                    style:
                        TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    children: [
                      const Text(
                        'Remember your password?',
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.start,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, LoginView.loginView);
                          },
                          child: const Text(
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
            OtpTextField(
              numberOfFields: 4,
              fieldWidth: 50,
              fillColor: Colors.grey.shade200,
              filled: true,

              showFieldAsBox: true,
              onCodeChanged: (value) {
                String oldCode = myCode;
                if (value.isNotEmpty) {
                  myCode += value;
                } else {
                  myCode.replaceAll(oldCode[-1], '');
                }
              },
              onSubmit: (String verificationCode) {
                myCode = verificationCode;
                verifyCode(verificationCode);
              }, // end onSubmit
            ),
            const SizedBox(height: 10.0),
            Column(
              children: [
                const SizedBox(height: 20.0),
                // ElevatedButton for sending code
                ElevatedButton(
                  onPressed: () {
                    verifyCode(myCode);
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
                        'Submit',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Resend Code",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
