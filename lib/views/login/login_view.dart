import 'package:assignment/model/user_provider.dart';
import 'package:assignment/views/login/forget_password_view.dart';
import 'package:assignment/views/register/register_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  static String loginView = "login_view";
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String email = "";

  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: const Text(
          'FarmerEats',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 64.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome back!',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Text(
                        'New here?',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RegisterView.registerView);
                        },
                        child: const Text(
                          'Create account',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.redAccent),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 8.0),
                        child: Text(
                          '@',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      labelText: "Email Address",
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8.0)),
                      fillColor: Colors.grey[300],
                      filled: true),
                  onChanged: (value) => email = value,
                ),
                const SizedBox(
                  height: 24.0,
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_outline_rounded),
                      labelText: "Password",
                      suffixIcon: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, ForgotPasswordView.forgotPasswordView);
                          },
                          child: const Text(
                            'Forget?',
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.normal),
                          )),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8.0)),
                      fillColor: Colors.grey[300],
                      filled: true),
                  onChanged: (value) => password = value,
                ),
                const SizedBox(
                  height: 24.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<UserDataProvider>(context, listen: false)
                        .user
                        .email = email;
                    Provider.of<UserDataProvider>(context, listen: false)
                        .user
                        .password = password;

                    Provider.of<UserDataProvider>(context, listen: false)
                        .login();
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
                        'Login',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Center(
                child: const Text(
                  'Or Login with',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: Color.fromARGB(255, 211, 207, 203),
                    ),
                  ),
                  onPressed: () {},
                  child: Image.asset("assets/goole.png"),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: Color.fromARGB(255, 211, 207, 203),
                    ),
                  ),
                  onPressed: () {},
                  child: Image.asset("assets/apple.png"),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: Color.fromARGB(255, 211, 207, 203),
                    ),
                  ),
                  onPressed: () {},
                  child: Image.asset("assets/fb.png"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
