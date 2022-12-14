/* import 'package:veterinary1/models/document_type.dart'; */
import 'package:veterinary1/models/user.dart';

class Token {
  String token = '';
  String expiracion = '';
  User user = User(
      firstName: '',
      lastName: '',
      id: '',
      /* documentType: DocumentType(id: 0, description: ''), */
      userName: '',
      email: '',
      phoneNumber: '',
      address: '',
      countryCode: '',
      document: '',
      fullName: '',
      imageFullPath: '',
      imageId: '',
      loginType: 0,
      userType: 0,
      vehiclesCount: 0,
      vehicles: []);

  Token({required this.token, required this.expiracion, required this.user});

  Token.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expiracion = json['expiracion'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    // ignore: unnecessary_this
    data['token'] = this.token;
    // ignore: unnecessary_this
    data['expiracion'] = this.expiracion;
    data['user'] = user.toJson();
    return data;
  }
}
