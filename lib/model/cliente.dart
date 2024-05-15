class Cliente{
  int idClientes;
  String nome;
  String cpf;
  String telefone;
  String email;
  String senha;
  String funcao;
  
  Cliente(
    {required this.idClientes,
    required this.nome,
    required this.cpf,
    required this.telefone,
    required this.email,
    required this.senha,
    required this.funcao
    });

  Map<String, dynamic> toJson() {
    var json = {
      "nome": nome,
      "email": email,
      "cpf": cpf,
      "telefone": telefone,
      "senha": senha,
      "funcao": funcao
    };

    return json;
  }
}