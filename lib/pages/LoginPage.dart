import 'package:flutter/material.dart';
import 'package:login_app/model/login.dart';
import 'package:login_app/pages/HomePage.dart';
import 'package:login_app/services/loginApi.dart';

class LoginPage extends StatelessWidget {

  final _ctrlLogin = TextEditingController();
  final _ctrlPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final api = LoginApi();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text("myLIMS Mobile", style: TextStyle(color: Colors.white,
            fontSize: 40, fontWeight: FontWeight.w400)),
      ),
      body: _body(context),
      );
  }

  _body(BuildContext context) {
    return Form(
      key: _formKey,
      child:
      Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: <Widget>[
            _textFormField(
              "Login",
              "Digite o Login",
              controller: _ctrlLogin,
              validator: _validaLogin,
            ),
            _textFormField(
              "Senha",
              "Digite a Senha",
              senha: true,
              controller: _ctrlPassword,
              validator: _validaPassword,
            ),
            _raisedButton("Login", Colors.blue, context),
          ],
        ),
      ),
    );
  }


_textFormField(
  String label,
  String hint, {
    bool senha = false,
    required TextEditingController controller,
    required FormFieldValidator<String> validator,
}) {
  return TextFormField(
    controller: controller,
    validator: validator,
    autofocus: true,
    obscureText: senha,
    decoration: InputDecoration(
      labelText: label,
      hintText: hint,
    ),
  );
}

_raisedButton(
  String texto,
  Color cor,
  BuildContext context) {
  return MaterialButton(
    color: cor,
    child: Text(
      texto,
      style: const TextStyle(
        color:  Colors.white,
        fontSize: 20,
      ),
    ),
    onPressed: () {
      _clickButton(context);
    }
  );
}

  String? _validaLogin(String? texto) {
    if(texto!.isEmpty) {
      return "Digite o Login";
    }
    return null;
  }

  String? _validaPassword(String? texto) {
    if(texto!.isEmpty) {
      return "Digite a Senha";
    }
    return null;
  }

  void _clickButton(BuildContext context) async {
    bool formOk = _formKey.currentState!.validate();

    if (!formOk) {
      return;
    }

    LoginModel user = LoginModel();


    user.username = _ctrlLogin.text;
    user.password = _ctrlPassword.text;

    var response = await api.login(user);

    if(response!.token != null && response!.token != '')
    {
        print("Usuário autenticado com sucesso");
        print("Token JWT: ${response.token}");

        _navegaHomePage(context);
    }else {
      print("Usuário não autenticado");
    }

  }

  _navegaHomePage(BuildContext context) {
      Navigator.push(
          context, MaterialPageRoute(
            builder: (context)=> HomePage()
          ),
      );
  }
}
