import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:projetopi/model/agendamento.dart';

import '../constants.dart';

class AgendamentoRepository extends Disposable {
  var caminhoApi = "${Variaveis().IpAPI}/api/Agendamento/";

  Future<bool> VerificarDisponibilidadeQuadra(
      DateTime data, int idQuadra, int idCredenciado) async {
    try {
      String datetimeStr = data.toIso8601String();
      String encodedDatetimeStr = Uri.encodeComponent(datetimeStr);
      var retorno = await http.get(Uri.parse(
          "${caminhoApi}VerificaDisponibilidade?data=$encodedDatetimeStr&idQuadra=$idQuadra&idCredenciado=$idCredenciado"));
      if (retorno.body == "true") {
        return true;
      }
    } catch (e) {
      print(e.toString());
    }
    return false;
  }

  /*Map<String, dynamic> VericaDisponibilidadeQuadratoJson(
      DateTime data, int idQuadra, int idCredenciado) {
    var json = {
      "data":
          '${data.year}-${data.month.toString().padLeft(2, '0')}-${data.day.toString().padLeft(2, '0')} ${data.hour.toString().padLeft(2, '0')}:${data.minute.toString().padLeft(2, '0')}:00',
      "idQuadra": idQuadra,
      "idCredenciado": idCredenciado
    };
    return json;
  }*/
  Future<String> cadastrarAgendamento(Agendamento a) async{
    try{
      var retorno = await http.post(Uri.parse("${caminhoApi}Cadastrar/"),
          body: a.toJson());
      var aux = retorno.body;
      return aux;
    }catch (e){
      print(e.toString());
      return "Ocorreu um erro!";
    }
  }


  @override
  void dispose() {}
}
