import 'package:assignment/views/custom_widget/week_selection.dart';
import 'package:flutter/material.dart';

class BusinessHoursView extends StatefulWidget {
  static String businessHoursView = 'business_hours_view';
  BusinessHoursView({super.key});

  @override
  State<BusinessHoursView> createState() => _BusinessHoursViewState();
}

class _BusinessHoursViewState extends State<BusinessHoursView> {
  final values = List.filled(7, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('FarmerEats'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Signup 4 of 4",
              style: TextStyle(color: Colors.grey.shade700),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Business Hours',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Choose the hours your farm is open for pickups. This will allow customers to order deliveries.',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
            const SizedBox(
              height: 20,
            ),
            WeekSelection(),
          ],
        ),
      ),
    );
  }
}
