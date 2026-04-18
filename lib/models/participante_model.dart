// este arquivo serve para a lógica de dizer o que é um participante

class Participante {
  String nome;
  String cpf;
  String papel;
  int acompanhantes;

  Participante({
    required this.nome,
    required this.cpf,
    required this.papel,
    this.acompanhantes = 0,
  });

  // Esta função ajudará mais tarde a enviar os dados para a planilha do Google
  List<dynamic> toSheetsRow() {
    return [nome, cpf, papel, acompanhantes];
  }
}