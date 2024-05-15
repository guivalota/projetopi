// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:projetopi/controller/login_controler.dart';
import 'package:projetopi/views/cadastrar/cadastrar.dart';
import 'login.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PreLoginPage(),
      ),
    );


class PreLoginPage extends StatelessWidget {
  LoginController controler = LoginController();

  PreLoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color.fromRGBO(255, 255, 255, 1),
              Color.fromRGBO(255, 255, 255, 1),
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2, // Image will take 2/3 of the available space
              child: Center(
                child: BounceInDown(
                  duration: const Duration(milliseconds: 1500),
                  child: Image.asset(
                    'assets/img/logo.png', // Coloque o caminho da sua imagem aqui
                    width: 325,
                    height: 325,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1, // Image will take 2/3 of the available space
              child: Center(
                child: BounceInDown(
                  duration: const Duration(milliseconds: 1500),
                  child: Image.asset(
                    'assets/img/icone.png', // Coloque o caminho da sua imagem aqui
                    width: 250,
                    height: 250,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1, // Buttons will take 1/3 of the available space
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FadeInUp(
                        duration: const Duration(milliseconds: 6000),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          },
                          height: 45,
                          minWidth: MediaQuery.of(context).size.width * 0.4,
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text("Entrar",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      FadeInUp(
                        duration: const Duration(milliseconds: 6000),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Cadastrar()),
                            );
                          },
                          height: 45,
                          minWidth: MediaQuery.of(context).size.width * 0.4,
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text("Cadastrar",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
