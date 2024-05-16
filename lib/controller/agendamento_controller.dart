import 'package:projetopi/model/agendamento.dart';
import 'package:projetopi/repository/agendamento_repository.dart';

class AgendamentoController {
  final AgendamentoRepository _repository = AgendamentoRepository();

  Future<bool> VerificarDisponibilidadeQuadra(String selectedModality,
      DateTime selectedDate, String selectedHour, int idCredenciado) async {
    int idQuadra = 0;
    //'BeachTennis', 'Volei', 'Futebol', 'Outra'
    switch (selectedModality) {
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
    DateTime data = DateTime.now();

    try {
      var aux =
          '${selectedDate.year}-${selectedDate.month}-${selectedDate.day} $selectedHour:00';
      data = DateTime.parse(
          '${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')} $selectedHour:00');
    } catch (e) {
      print(e);
    }
    return await _repository.VerificarDisponibilidadeQuadra(
        data, idQuadra, idCredenciado);
  }

  Future<String> cadastrarAgendamento(Agendamento a) async {
    return await _repository.cadastrarAgendamento(a);
  }
}
