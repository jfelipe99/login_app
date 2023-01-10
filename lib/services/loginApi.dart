import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:login_app/model/login.dart';

class LoginApi {

  var url = 'http://192.168.0.20:3000/login';

  var header = { "Content-Type" : "application/json" };

  Future<LoginModel?> login(LoginModel user) async {

    var bodyJson = json.encode(user.toJson());

    print("Json enviado: ${bodyJson}");

    var response = await http.post(Uri.parse(url), headers: header, body: bodyJson);

    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");

    var bodyResponse = json.decode(response.body);

    return LoginModel.fromJson(bodyResponse);
  }
}