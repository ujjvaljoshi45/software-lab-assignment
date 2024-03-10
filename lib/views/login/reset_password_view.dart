import 'package:assignment/views/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ResetPasswordView extends StatefulWidget {
  static String resetPasswordView = 'reset_password_view';
  @override
  _ResetPasswordViewState createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  String password = '';
  String confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FarmerEats'), // Assuming this is the app title
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
                    'Reset Password?',
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
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                      labelText: "Enter Password",
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8.0)),
                      fillColor: Colors.grey[300],
                      filled: true),
                  onChanged: (value) => password = value,
                ),
                SizedBox(
                  height: 18.0,
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                      labelText: "Enter Password",
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8.0)),
                      fillColor: Colors.grey[300],
                      filled: true),
                  onChanged: (value) => confirmPassword = value,
                ),
                const SizedBox(height: 20.0),
                // ElevatedButton for sending code
                ElevatedButton(
                  onPressed: () {
                    if (password == confirmPassword) {
                      final String url =
                          'https://sowlab.pw/assignment/user/reset-password';
                      final res = http
                          .post(
                            Uri.parse(url),
                            body: {
                              'token': '895642',
                              'password': password,
                              'confirm_password': confirmPassword
                            },
                          )
                          .then((value) =>
                              print(" Res : ${value.body.toString()}"))
                          .catchError((e) => print(e));
                    }
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
