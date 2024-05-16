class Agendamento{
  DateTime data;
  int idCredenciado;
  int idClientes;
  int idQuadra;

  
  Agendamento(
    {required this.data,
    required this.idCredenciado,
      required this.idClientes,
      required this.idQuadra
    });

  Map<String, dynamic> toJson() {
    var json = {
      "data": data.toIso8601String(),
      "idCredenciado": idCredenciado.toString(),
      "idCliente": idClientes.toString(),
      "idQuadra": idQuadra.toString()
    };

    return json;
  }
}