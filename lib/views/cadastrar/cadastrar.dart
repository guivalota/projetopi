// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:projetopi/controller/cadastrar_controller.dart';

import '../../model/cliente.dart';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Cadastrar(),
      ),
    );

class Cadastrar extends StatefulWidget {
  const Cadastrar({Key? key}) : super(key: key);

  @override
  State<Cadastrar> createState() => _CadastrarState();
}

class _CadastrarState extends State<Cadastrar> {
  CadastrarController controller = CadastrarController();
  final inputEmail = TextEditingController();
  final inputSenha = TextEditingController();
  final inputSenhaRepetir = TextEditingController();
  final inputNome = TextEditingController();
  final inputTelefone = TextEditingController();
  final inputCPF = TextEditingController();

  @override
  void dispose() {
    inputEmail.dispose();
    inputSenha.dispose();
    inputSenhaRepetir.dispose();
    inputNome.dispose();
    inputTelefone.dispose();
    inputCPF.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.white,
        ),
        title: Text(
          'Cadastrar',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color.fromRGBO(100, 170, 160, 1),
              Color.fromRGBO(255, 173, 73, 1),
            ],
          ),
        ),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  BounceInDown(
                    duration: const Duration(milliseconds: 500),
                    child: Image.asset(
                      'assets/img/logo.png',
                      width: 125,
                      height: 125,
                    ),
                  ),
                  const SizedBox(height: 10),
                  FadeInUp(
                    duration: const Duration(milliseconds: 500),
                    child: const Text(
                      "Cadastrar-se",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 20),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1400),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(189, 189, 189, 0.747),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                TextField(
                                  controller: inputEmail,
                                  decoration: const InputDecoration(
                                    hintText: 'Email',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                TextField(
                                  controller: inputSenha,
                                  decoration: const InputDecoration(
                                    hintText: 'Senha',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                TextField(
                                  controller: inputSenhaRepetir,
                                  decoration: const InputDecoration(
                                    hintText: 'Repita a Senha',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                TextField(
                                  controller: inputNome,
                                  decoration: const InputDecoration(
                                    hintText: 'Nome',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                TextField(
                                  controller: inputTelefone,
                                  decoration: const InputDecoration(
                                    hintText: 'Telefone',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                TextField(
                                  controller: inputCPF,
                                  decoration: const InputDecoration(
                                    hintText: 'CPF',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(height: 40),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FadeInUp(
                            duration: const Duration(milliseconds: 1600),
                            child: MaterialButton(
                              onPressed: () {
                                cadastrar();
                              },
                              height: 45,
                              minWidth:
                                  MediaQuery.of(context).size.width / 1.25,
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                "Cadastrar",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
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

  cadastrar() async {
    try {
      String email = inputEmail.text;
      String senha = inputSenha.text;
      String senhaRepetir = inputSenhaRepetir.text;
      String nome = inputNome.text;
      String cpf = inputCPF.text;
      String telefone = inputTelefone.text;
      if (senha != senhaRepetir) {
        return showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              height: 200,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('As senhas são diferentes'),
                    ElevatedButton(
                      child: const Text('Fechar'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      } else {
        Cliente c = Cliente(
            idClientes: 10,
            nome: nome,
            cpf: cpf,
            telefone: telefone,
            email: email,
            senha: senha,
            funcao: 'a');
        //retorno(await controller.cadastrar(c));
        var aux = await controller.cadastrar(c);
        retorno(aux);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<void> retorno(String msg) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(msg),
                ElevatedButton(
                  child: const Text('Fechar'),
                  onPressed: () {
                    if (msg.contains('sucesso')) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    } else {
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
