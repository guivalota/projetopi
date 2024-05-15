import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: chat(),
      ),
    );

class chat extends StatelessWidget {
  const chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  BounceInDown(
                    duration: const Duration(milliseconds: 1000),
                    child: Image.asset(
                      'assets/img/logo.png',
                      width: 125,
                      height: 125,
                    ),
                  ),
                  const SizedBox(height: 10),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1000),
                    child: const Text(
                      "C.actus C.Bot ",
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
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    // Chat list (replace with your actual chat list widget)
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.all(20),
                        children: [
                          ChatMessage(text: 'Alugar uma Quadra entre 15h a 17h'),
                          ChatMessage1(text: 'Olá User01, que tipo de quadra gostaria de alugar?'),
                          ChatMessage(text: 'Beachtennis'),
                          ChatMessage1(text: 'Listando alguns de nossos Credenciados disponiveis:\n\n99 beach Tennis às 16h por R\$100,00 \n \nArena MD às 15h por R\$90,00 \n \nClube de Campo Aguai às 17h por R\$110,00'),
                          ChatMessage(text: 'Alugar 99 beach Tennis'),
                          ChatMessage1(text: 'Agendando...'),
                          ChatMessage1(text: 'Prontinho, você pode consultar seus agendamentos na página inicial do aplicativo '),
                        ],
                      ),
                    ),
                    // Input field
                    Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: 'Digite sua mensagem...',
                                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.send),
                            onPressed: () {
                              // Send message functionality
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;

  const ChatMessage({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[300], // Gray for user message
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black, // Black for user message text
        ),
      ),
    );
  }
}

class ChatMessage1 extends StatelessWidget {
  final String text;

  const ChatMessage1({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue[100], // Light blue for bot message
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: Color.fromRGBO(13, 71, 161, 1), // Dark blue for bot message text
        ),
      ),
    );
  }
}
