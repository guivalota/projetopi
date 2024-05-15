import 'package:projetopi/repository/login_repository.dart';

class LoginController{

  final LoginRepository _repository = LoginRepository();

  
  Future<void> ListarClientes() async{
    // ignore: unused_local_variable
    var retorno = await _repository.ListarClientes();
  }



  Future<int> Logar(String email, String senha) async{
    return await _repository.Logar(email, senha);
  }

  Future<String> pegarCliente(int idClientes) async{
    return await _repository.pegarCliente(idClientes);
  }

}