// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:projetopi/controller/login_controler.dart';
import 'package:projetopi/views/c.bot/cbot.dart';
import 'package:projetopi/views/perfil/perfil.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key, required this.idClientes}) : super(key: key);

  final idClientes;
  @override
  State<StatefulWidget> createState() {
    return _Menu();
  }
}

class _Menu extends State<Menu> {
  LoginController _loginController = LoginController();
  String nomeCliente = "";
  @override
  void initState() {
    _loginController.pegarCliente(widget.idClientes).then((value) {
      if (!value.isEmpty) {
        nomeCliente = value;
      } else {
        nomeCliente = "Erro ao carregar o nome";
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors
            .transparent, // Define o fundo como transparente para exibir o gradiente
        elevation: 0, // Remove a sombra do AppBar
        title: Stack(
          children: [
            Container(
              width: double.infinity,
              height: AppBar().preferredSize.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 248, 248, 248),
                    Color.fromARGB(255, 255, 255, 255)
                  ], // Define o gradiente de branco para branco
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Arena C.actus',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Define a cor do texto como preto
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Bem vindo $nomeCliente',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Define a cor do texto como preto
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Modalidades',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: ModalidadeButton(
                    imagePath: 'assets/img/beachtennis.png',
                    text: 'Beach Tennis',
                  ),
                ),
                Flexible(
                  child: ModalidadeButton(
                    imagePath: 'assets/img/volei.png',
                    text: 'Vôlei',
                  ),
                ),
                Flexible(
                  child: ModalidadeButton(
                    imagePath: 'assets/img/futebol.png',
                    text: 'Futebol',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Navigate to CbotScreen when the button is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => chat()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 233, 233, 233),
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(color: Colors.black),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/img/logo.png', height: 24.0),
                      const SizedBox(width: 10.0),
                      const Text(
                        'C.bot - agende de forma simples',
                        style: TextStyle(color: Colors.black, fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40.0),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Arenas Favoritas',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                arenaButton(context, 'assets/img/arenamd.png', 1),
                arenaButton(context, 'assets/img/99beach.png', 2),
                arenaButton(context, 'assets/img/clube.png', 3),
              ],
            ),
            const SizedBox(height: 40.0),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Alugue com eles novamente',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                arenaButton(context, 'assets/img/arenamd.png',1),
                arenaButton(context, 'assets/img/99beach.png',2),
                arenaButton(context, 'assets/img/clube.png',2),
              ],
            ),
            const SizedBox(height: 40.0),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Suas últimas reservas',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: ReservaWidget(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.recommend),
            label: 'Recomendações',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }

  Widget arenaButton(BuildContext context, String imagePath, int idcredenciado) {
    return GestureDetector(
      onTap: () {
        // Navigate to CbotScreen when the button is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => perfil(idClientes: widget.idClientes, idCredenciado: idcredenciado)),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromARGB(
              255, 255, 255, 255), // Define a cor de fundo como branca
        ),
        child: CircleAvatar(
          radius: 45.0,
          backgroundImage: AssetImage(imagePath),
        ),
      ),
    );
  }
}

class ModalidadeButton extends StatelessWidget {
  final String imagePath;
  final String text;

  const ModalidadeButton({
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          width: 135.0,
          height: 135.0,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 10.0),
        Text(
          text,
          style: const TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}

class ReservaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          20.0, 20.0, 20.0, 0.0), // Define o preenchimento
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 0, 0, 0)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/img/arenamd.png',
                    width: 50.0,
                    height: 50.0,
                  ),
                  const SizedBox(width: 10.0),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Beach Tennis - Arena MD',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Data e hora: 21/04/2024 ás 16:00',
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
