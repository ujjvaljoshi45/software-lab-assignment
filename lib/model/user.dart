import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  String? fullName;
  String? phone;
  String? email;
  String? password;
  String? role = "farmer";
  String? businessName;
  String? informalName;
  String? address;
  String? city;
  String? state = "Goa";
  String? zipCode;
  String? registrationProof = "proof.pdf";
  Map<String, List>? bussinessHours;
  String? type = "email";
  String? deviceToken = "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx";
  String? socialId = "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx";

  User({
    this.fullName,
    this.phone,
    this.email,
    this.password,
    this.businessName,
    this.informalName,
    this.address,
    this.city,
    this.state,
    this.zipCode,
    this.bussinessHours,
  });

  @override
  String toString() {
    return 'User(fullName: $fullName, phone: $phone, password: $password, role: $role, bussinessName: $businessName, informalName: $informalName, address: $address, city: $city, state: $state, zipCode: $zipCode, registrationProof: $registrationProof, bussinessHours: $bussinessHours, deviceToken: $deviceToken, socialId: $socialId)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'full_name': fullName,
      'phone': phone,
      'email': email,
      'password': password,
      'role': role,
      'business_name': businessName,
      'informal_name': informalName,
      'address': address,
      'city': city,
      'state': state,
      'zip_code': zipCode,
      'registration_proof': registrationProof,
      'bussiness_hours': bussinessHours,
      'type': type,
      'device_token': deviceToken,
      'social_id': socialId,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      fullName: map['fullName'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      businessName: map['businessName'] as String,
      informalName: map['informalName'] as String,
      address: map['address'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      zipCode: map['zipCode'] as String,
      bussinessHours: map['bussinessHours'] as Map<String, List>?,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
