import 'package:projetopi/repository/cliente_repository.dart';

import '../model/cliente.dart';

class CadastrarController {
  final ClienteRepository _repository = ClienteRepository();

  Future<String> cadastrar(Cliente c) async {
    return await _repository.cadastrarClientes(c);
  }
}
