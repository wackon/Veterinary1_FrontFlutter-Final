/* import 'package:veterinary1/models/document_type.dart'; */

class User {
  String firstName = '';
  String lastName = '';
  String document = '';
  String address = '';
  String imageId = '';
  String imageFullPath = '';
  int userType = 1;
  int loginType = 0;
  String fullName = '';
  int vehiclesCount = 0;
  String id = '';
  String userName = '';
  String email = '';
  String countryCode = '';
  String phoneNumber = '';

  User({
    required this.firstName,
    required this.lastName,
    required this.document,
    required this.address,
    required this.imageId,
    required this.imageFullPath,
    required this.userType,
    required this.loginType,
    required this.fullName,
    required this.vehiclesCount,
    required this.id,
    required this.userName,
    required this.email,
    required this.countryCode,
    required this.phoneNumber,
    required List vehicles,
    /* required DocumentType documentType, */
  });

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    document = json['document'];
    address = json['address'];
    imageId = json['imageId'];
    imageFullPath = json['imageFullPath'];
    userType = json['userType'];
    loginType = json['loginType'];
    fullName = json['fullName'];

    vehiclesCount = json['vehiclesCount'];
    id = json['id'];
    userName = json['userName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    countryCode = json['countryCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['document'] = document;
    data['address'] = address;
    data['imageId'] = imageId;
    data['imageFullPath'] = imageFullPath;
    data['userType'] = userType;
    data['loginType'] = loginType;
    data['fullName'] = fullName;
    data['vehiclesCount'] = vehiclesCount;
    data['id'] = id;
    data['userName'] = userName;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['countryCode'] = countryCode;
    return data;
  }
}
