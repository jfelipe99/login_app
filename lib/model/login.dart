class LoginModel {
  String? username;
  int? id;
  String? cpf;
  String? token;
  String? password;

  LoginModel({this.username, this.id, this.cpf, this.token, this.password});

  LoginModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    id = json['id'];
    cpf = json['cpf'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}