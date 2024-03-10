import 'dart:convert';

import 'package:assignment/model/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserDataProvider extends ChangeNotifier {
  User user = User();

  void printUser() {
    print(user.toString());
  }

  void login() async {
    print(user.toMap());
    final String url = 'https://sowlab.pw/assignment/user/login';
    final res = await http
        .post(
          Uri.parse(url),
          body: jsonEncode(user.toMap()),
        )
        .then((value) => print(" Res : ${value.body.toString()}"))
        .catchError((e) => print(e));
  }

  void register() async {
    print(user.toMap());
    final String url = 'https://sowlab.pw/assignment/user/register';
    final res = await http
        .post(
          Uri.parse(url),
          body: jsonEncode(user.toMap()),
        )
        .then((value) => print(" Res : ${value.body.toString()}"))
        .catchError((e) => print(e));
  }
}
/*
{
  "full_name": "abc", 
  "phone": '123', 
  "email": "abc@gmail.com", 
  "password": "123", 
  "role": "farmer", 
  "business_name": "abc", 
  "informal_name": "abc", 
  "address": "abc", 
  "city": "abc", 
  "state": "Goa", 
  "zip_code": "123", 
  "registration_proof": "proof.pdf", 
  "bussiness_hours": 
  {"M": ["8:00 AM - 10:00 AM"], "T": [], "W": ["4:00 PM - 7:00 PM"], "Th": [], "F": ["7:00 PM - 10:00 PM"], "S": [], "Su": ["1:00 PM - 4:00 PM"]},
   "type": "email", 
   "device_token": "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx",
  "social_id": "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx"
  }
  */