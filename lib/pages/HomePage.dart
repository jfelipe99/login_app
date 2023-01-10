import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page',
          style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    return Center(
      child: Container(
        child: const Text("Logado com sucesso", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}