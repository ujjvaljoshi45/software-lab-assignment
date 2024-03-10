import 'package:assignment/model/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoneView extends StatelessWidget {
  static String doneView = 'done_view';
  const DoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('FarmerEats'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset("assets/Vector@1x.png"),
            const Text(
              'You’re all done!',
              style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Hang tight!  We are currently reviewing your account and will follow up with you in 2-3 business days. In the meantime, you can setup your inventory.',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Provider.of<UserDataProvider>(context, listen: false)
                    .register();
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
        ),
      ),
    );
  }
}
