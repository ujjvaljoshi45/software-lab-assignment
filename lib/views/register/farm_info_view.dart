import 'package:assignment/model/user.dart';
import 'package:assignment/model/user_provider.dart';
import 'package:assignment/views/register/verificaton_view.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FarmInfoView extends StatefulWidget {
  static String farmInfoView = 'farm_info_view';
  const FarmInfoView({super.key});

  @override
  State<FarmInfoView> createState() => _FarmInfoViewState();
}

class _FarmInfoViewState extends State<FarmInfoView> {
  String businessName = '';
  String informalName = '';
  String streetAddress = '';
  String city = '';
  String state = '';
  String zipCode = '';
  List<String> indianStates = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jammu and Kashmir',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: const Text('FarmerEats'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Signup 2 of 4",
                  style: TextStyle(color: Colors.grey.shade700),
                ),
                const Text(
                  'Farm Info',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
            textFields(MediaQuery.of(context).size.width / 2),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.22,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    print(state);
                    User oldUser =
                        Provider.of<UserDataProvider>(context, listen: false)
                            .user;
                    oldUser.businessName = businessName;
                    oldUser.informalName = informalName;
                    oldUser.address = streetAddress;
                    oldUser.city = city;
                    oldUser.state = state;
                    oldUser.zipCode = zipCode;

                    Provider.of<UserDataProvider>(context, listen: false).user =
                        oldUser;
                    Provider.of<UserDataProvider>(context, listen: false)
                        .printUser();
                    Navigator.pushNamed(
                        context, VerificationView.verficationView);
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

  textFields(var width) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person_2_outlined),
              labelText: "Business Name",
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.0)),
              fillColor: Colors.grey[300],
              filled: true),
          onChanged: (value) => businessName = value,
        ),
        const SizedBox(
          height: 24.0,
        ),
        TextField(
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.emoji_emotions_outlined),
              labelText: "Informal Name",
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.0)),
              fillColor: Colors.grey[300],
              filled: true),
          onChanged: (value) => informalName = value,
        ),
        const SizedBox(
          height: 24.0,
        ),
        TextField(
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.home_outlined),
              labelText: "Street Address",
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.0)),
              fillColor: Colors.grey[300],
              filled: true),
          onChanged: (value) => streetAddress = value,
        ),
        const SizedBox(
          height: 24.0,
        ),
        TextField(
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.pin_drop_outlined),
              labelText: "City",
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.0)),
              fillColor: Colors.grey[300],
              filled: true),
          onChanged: (value) => city = value,
        ),
        const SizedBox(
          height: 24.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width * 0.7,
              child: DropDownTextField(
                onChanged: (value) {
                  if (value.value != null) {
                    print(value.value);
                    state = value.value;
                  }
                },
                textFieldDecoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8.0)),
                    labelText: 'State',
                    fillColor: Colors.grey[300],
                    filled: true),
                dropDownList: [
                  for (var state in indianStates)
                    DropDownValueModel(name: state, value: state)
                ],
              ),
            ),
            SizedBox(
              width: width * 0.9,
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Enter Zipcode",
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8.0)),
                    fillColor: Colors.grey[300],
                    filled: true),
                onChanged: (value) => zipCode = value,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
