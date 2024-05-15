// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async'; // Importe o pacote dart:async

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:projetopi/views/homepage/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Carregamento(),
    );
  }
}

class Carregamento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use um Future.delayed para esperar 10 segundos antes de navegar para a próxima página
    /*Future.delayed(Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => menu()), // Navegue para HomePage
      );
    });*/

    return Scaffold(
      body: Stack(
        children: [
          // Logo na parte superior
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 50),
            child: Image.asset(
              'assets/img/logo.png',
              width: 200,
            ),
          ),
          // Mensagem e animação de carregamento ao meio
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Agendando',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Voce pode consultar seus agendamentos na pagina inicial do App',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                SpinKitRing(
                  color: Color.fromARGB(255, 38, 241, 106),
                  size: 50.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
