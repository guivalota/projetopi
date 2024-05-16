// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:projetopi/controller/agendamento_controller.dart';
import 'package:projetopi/model/agendamento.dart';
import 'package:projetopi/views/carregamento/telacarregamento.dart';
import 'package:intl/intl.dart';
import 'package:projetopi/views/homepage/HomePage.dart';

class Confirmacao extends StatefulWidget {
  const Confirmacao(
      {Key? key,
      required this.idClientes,
      required this.idCredenciado,
      required this.tipoQuadra,
      required this.data})
      : super(key: key);

  final int idClientes;
  final int idCredenciado;
  final String tipoQuadra;
  final DateTime data;
  @override
  State<StatefulWidget> createState() {
    return _ConfirmacaoState();
  }
}

class _ConfirmacaoState extends State<Confirmacao> {
  AgendamentoController controller = AgendamentoController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.black,
        ),
        title: Text(
          'Confirmação',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(bottom: 20.0),
              child: Image.asset(
                'assets/img/logo.png', // Substitua 'assets/logo.png' pelo caminho da sua logo
                width: 100,
              ),
            ),
            // Informações da arena
            Text(
              'Arena MD',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Text(
              'Endereço: Rua ABC, 123\nTelefone: (12) 3456-7890\nE-mail: arena@example.com',
            ),
            SizedBox(height: 20.0),
            // Valor do agendamento
            Text(
              'Valor do Agendamento:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            Text(
              'R\$ 100,00',
              style: TextStyle(fontSize: 20.0),
            ),

            SizedBox(height: 20.0),
            // Valor do agendamento
            Text(
              'Modalidade:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            Text(
              widget.tipoQuadra,
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Horario:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            Text(
              DateFormat('dd/MM/yyyy – kk:mm').format(widget.data),
              style: TextStyle(fontSize: 20.0),
            ),

            SizedBox(height: 20.0),
            // Dados do cliente
            Text(
              'Dados do Cliente:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            Text(
              'Nome: João da Silva\nE-mail: joao@example.com\nTelefone: (98) 7654-3210',
            ),
            SizedBox(height: 20.0),
            // Botão Confirmar
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  cadastrar();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black, // Cor das letras branca
                ),
                child: Text('Confirmar'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void cadastrar() async {
    try {
      Agendamento a = Agendamento(
          data: widget.data,
          idCredenciado: widget.idCredenciado,
          idClientes: widget.idClientes,
          idQuadra: pegarIdQuadra());

      var msg = await controller.cadastrarAgendamento(a);
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Menu(
                            idClientes: widget.idClientes,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    } catch (e) {
      print(e.toString());
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
                  Text("Ocorreu um erro ao cadastrar o agendamento"),
                  ElevatedButton(
                    child: const Text('Fechar'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Menu(
                            idClientes: widget.idClientes,
                          ),
                        ),
                      );
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

  int pegarIdQuadra() {
    int idQuadra = 0;
    switch (widget.tipoQuadra) {
      case "BeachTennis":
        idQuadra = 1;
        break;
      case "Volei":
        idQuadra = 2;
        break;
      case "Futebol":
        idQuadra = 3;
        break;
      case "Outra":
        idQuadra = 4;
        break;
    }
    return idQuadra;
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
