// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:projetopi/controller/agendamento_controller.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:projetopi/views/confirmaagendamento/confirmacao.dart';
import 'package:intl/date_symbol_data_local.dart';

class perfil extends StatefulWidget {
  perfil({Key? key, required this.idClientes, required this.idCredenciado})
      : super(key: key);

  final idClientes;
  final idCredenciado;
  @override
  State<StatefulWidget> createState() {
    return _perfilState();
  }
}

class _perfilState extends State<perfil> {
  AgendamentoController controller = AgendamentoController();
  String selectedModality = 'BeachTennis'; // Initial modality
  DateTime selectedDate = DateTime.now(); // Initial date
  String selectedHour = '09:00'; // Initial hour
  bool liberado = false;
  @override
  void initState() {
    initializeDateFormatting("pt_BR");
    verificarDisponibilidade();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
            'Cadastrar',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Container(
                    height: 200, // Altura da capa
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/img/arenamdcapa.jpg'), // Imagem de capa
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(20)),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 50, // Tamanho da foto de perfil
                            backgroundImage: AssetImage(
                                'assets/img/arenamd.png'), // Foto de perfil
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Arena MD',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Aberto até 22h',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Image.asset(
                            'assets/img/certificado.png', // Pequena imagem
                            height: 100,
                            width: 100,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Modalidades',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'BeachTennis',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text('a partir'),
                        trailing: Text('R\$ 100,00'),
                      ),
                      ListTile(
                        title: Text(
                          'Volei',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text('a partir'),
                        trailing: Text('R\$ 100,00'),
                      ),
                      // Adicione mais pedidos recentes conforme necessário
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 200,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {},
                    scrollDirection: Axis.horizontal,
                  ),
                  items: [
                    'assets/img/capa2.jpeg',
                    'assets/img/capa3.jpg',
                    'assets/img/capa4.jpeg',
                    'assets/img/arenamdcapa.jpg'
                    // Add more images as needed
                  ].map((imagePath) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage(imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              // Wrap the new column with a Container for padding
              Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Modalidade',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DropdownButtonFormField<String>(
                      value: selectedModality,
                      onChanged: (newValue) {
                        setState(() {
                          selectedModality = newValue!;
                          verificarDisponibilidade();
                        });
                      },
                      items: <String>[
                        'BeachTennis',
                        'Volei',
                        'Futebol',
                        'Outra'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Data',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TableCalendar(
                        locale: Localizations.localeOf(context).languageCode,
                        focusedDay: selectedDate,
                        firstDay: DateTime.now().subtract(Duration(days: 365)),
                        lastDay: DateTime.now().add(Duration(days: 365)),
                        calendarFormat: CalendarFormat.month,
                        onFormatChanged: (format) {},
                        onPageChanged: (focusedDay) {},
                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                        ),
                        calendarStyle: CalendarStyle(
                          selectedDecoration: BoxDecoration(
                            color: Color.fromARGB(255, 33, 243, 86),
                            shape: BoxShape.circle,
                          ),
                          todayDecoration: BoxDecoration(
                            color: Color.fromARGB(255, 0, 0, 0),
                            shape: BoxShape.circle,
                          ),
                        ),
                        selectedDayPredicate: (day) {
                          return isSameDay(selectedDate, day);
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            selectedDate = selectedDay;
                            verificarDisponibilidade();
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Horário',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DropdownButtonFormField<String>(
                      value: selectedHour,
                      onChanged: (newValue) {
                        setState(() {
                          selectedHour = newValue!;
                          verificarDisponibilidade();
                        });
                      },
                      items: List.generate(24, (index) {
                        String hour = '${index.toString().padLeft(2, '0')}:00';
                        return DropdownMenuItem<String>(
                          value: hour,
                          child: Text(hour),
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(liberado ? "Quadra Vaga" : "Quadra ocupada", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: liberado ? Colors.green : Colors.red),),
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: liberado
                            ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Confirmacao(idClientes: widget.idClientes, idCredenciado: widget.idCredenciado, tipoQuadra: selectedModality, data: converterData()),
                                  ),
                                );
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              Colors.black, // Cor das letras branca
                        ),
                        child: Text('Confirmar'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> verificarDisponibilidade() async {
    var aux = await controller.VerificarDisponibilidadeQuadra(
        selectedModality, selectedDate, selectedHour, widget.idCredenciado);
    setState(() {
      liberado = !aux;
    });
  }

  DateTime converterData(){
    DateTime data = DateTime.now();
    try {
      var aux = '${selectedDate.year}-${selectedDate.month}-${selectedDate.day} $selectedHour:00';
       data = DateTime.parse(
          '${selectedDate.year}-${selectedDate.month.toString().padLeft(2,'0')}-${selectedDate.day.toString().padLeft(2,'0')} $selectedHour:00');
    } catch (e) {
      print(e);
    }
    return data;
  }

}
