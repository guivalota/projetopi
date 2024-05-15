import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:projetopi/constants.dart';
import 'package:projetopi/model/cliente.dart';

class ClienteRepository extends Disposable {
  var caminhoApi = "${Variaveis().IpAPI}/api/Clientes/";

  Future<String> cadastrarClientes(Cliente c) async {
    try {
      var retorno = await http.post(Uri.parse("${caminhoApi}CadastrarCliente/"),
          body: c.toJson());
      var aux = retorno.body;
      return aux;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return 'Ocorreu um erro';
    }
  }

  @override
  void dispose() {}
}
