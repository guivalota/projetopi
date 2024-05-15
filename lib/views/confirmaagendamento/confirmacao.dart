// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:projetopi/views/carregamento/telacarregamento.dart';

class confirmacao extends StatelessWidget {
  const confirmacao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmação'),
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
              'Beachtennis',
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Carregamento(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.black, // Cor das letras branca
                ),
                child: Text('Confirmar'),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
