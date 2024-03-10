import 'package:assignment/views/register/bussiness_hours_view.dart';
import 'package:flutter/material.dart';

class VerificationView extends StatelessWidget {
  static String verficationView = 'verfication_view';
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('FarmerEats'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Signup 3 of 4",
              style: TextStyle(color: Colors.grey.shade700),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Verification',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Attached proof of Department of Agriculture registrations i.e. Florida Fresh, USDA Approved, USDA Organic',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Attact Proof of registration'),
                CircleAvatar(
                  minRadius: 30,
                  backgroundColor: Color(0xffD5715B),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  suffixIcon:
                      IconButton(onPressed: () {}, icon: Icon(Icons.close)),
                  labelText: "Filename.pdf",
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.0)),
                  fillColor: Colors.grey[300],
                  filled: true),
              onChanged: (value) {},
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, BusinessHoursView.businessHoursView);
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color(0xffD5715B),
                    ),
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    child: Center(
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
}
