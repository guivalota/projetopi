import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class AgendamentoRepository extends Disposable {
  var caminhoApi = "http://10.24.254.172:9090/api/Agendamento/";

  Future<bool> VerificarDisponibilidadeQuadra(DateTime data, int idQuadra, int idCredenciado) async {
    try {
      var aux  = "${caminhoApi}VerificarDisponibilidadeQuadra?data=${data.toString()}&idQuadra=$idQuadra&idCredenciado=$idCredenciado";
      var retorno = await http.get(Uri.parse("${caminhoApi}VerificarDisponibilidadeQuadra?data=${data.toString()}&idQuadra=$idQuadra&idCredenciado=$idCredenciado"));
      return json.decode(retorno.body);
    } catch (e) {
      print(e.toString());
    }
    return false;
  }




  @override
  void dispose() {}
}
