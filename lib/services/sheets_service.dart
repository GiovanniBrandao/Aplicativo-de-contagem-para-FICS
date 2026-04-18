
import '../models/participante_model.dart';

class SheetsService {
  // Simulação de salvar na planilha
  Future<bool> salvarParticipante(Participante participante) async {
    try {
      print("Conectando ao Google Sheets...");
      await Future.delayed(const Duration(seconds: 2)); // Simula o tempo de internet
      
      print("Dados salvos: ${participante.toSheetsRow()}");
      return true; // Sucesso
    } catch (e) {
      print("Erro ao salvar: $e");
      return false; // Falha
    }
  }
}