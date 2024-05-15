import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:projetopi/constants.dart';

class LoginRepository extends Disposable {
  var caminhoApi = "${Variaveis().IpAPI}/api/Clientes/";

  Future<void> ListarClientes() async {
    try {
      var retorno = await http.get(Uri.parse("${caminhoApi}Listar/"));
      return json.decode(retorno.body);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<int> Logar(String email, String senha) async {
    try {
      var url = "${caminhoApi}Login?email=$email&senha=$senha";
      var retorno = await http.get(Uri.parse(url));
      var aux = json.decode(retorno.body);
      return aux;
    } catch (e) {
      print(e.toString());
    }
    return 0;
  }

  Future<String> pegarCliente(int idClientes) async {
    try {
      var url = "${caminhoApi}PegarCliente?idClientes=$idClientes";
      var retorno = await http.get(Uri.parse(url));
      var aux = retorno.body.toString();
      return aux;
    } catch (e) {
      print(e.toString());
      return "Erro!";
    }
  }



  @override
  void dispose() {}
}
