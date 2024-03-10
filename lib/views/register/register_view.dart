import 'package:assignment/model/user.dart';
import 'package:assignment/model/user_provider.dart';
import 'package:assignment/views/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatefulWidget {
  static String registerView = 'register_view';
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String fullName = '';
  String email = '';
  String phone = '';
  String password = '';
  String rePassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: const Text('FarmerEats'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Signup 1 of 4",
                  style: TextStyle(color: Colors.grey.shade700),
                ),
                const Text(
                  'Welcome!',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Color.fromARGB(255, 211, 207, 203),
                        ),
                      ),
                      onPressed: () {},
                      child: Image.asset("assets/goole.png"),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Color.fromARGB(255, 211, 207, 203),
                        ),
                      ),
                      onPressed: () {},
                      child: Image.asset("assets/apple.png"),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Color.fromARGB(255, 211, 207, 203),
                        ),
                      ),
                      onPressed: () {},
                      child: Image.asset("assets/fb.png"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    'or signup with',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
            textFields(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginView.loginView);
                  },
                  child: const Text('Login'),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    if (password != rePassword) {
                      return;
                    }
                    Provider.of<UserDataProvider>(context, listen: false).user =
                        User(
                      fullName: fullName,
                      email: email,
                      phone: phone,
                      password: password,
                    );
                    Navigator.pushNamed(context, 'farm_info_view');
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color(0xffD5715B),
                    ),
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    child: const Center(
                      child: Text(
                        'Continue',
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

  textFields() {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person_2_outlined),
              labelText: "Full Name",
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.0)),
              fillColor: Colors.grey[300],
              filled: true),
          onChanged: (value) => fullName = value,
        ),
        const SizedBox(
          height: 24.0,
        ),
        TextField(
          decoration: InputDecoration(
              prefixIcon: const Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
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
              prefixIcon: const Icon(Icons.phone_outlined),
              labelText: "Phone Number",
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.0)),
              fillColor: Colors.grey[300],
              filled: true),
          onChanged: (value) => phone = value,
        ),
        const SizedBox(
          height: 24.0,
        ),
        TextField(
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock_outline),
              labelText: "Password",
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
        TextField(
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock_outline),
              labelText: "Re-enter Password",
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.0)),
              fillColor: Colors.grey[300],
              filled: true),
          onChanged: (value) => rePassword = value,
        ),
        const SizedBox(
          height: 24.0,
        ),
      ],
    );
  }
}
