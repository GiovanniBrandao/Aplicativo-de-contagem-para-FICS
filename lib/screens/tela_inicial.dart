// lib/screens/tela_inicial.dart
import 'package:flutter/material.dart';
import '../widgets/gradient_bg.dart';
import 'tela_evento.dart'; // Importação adicionada para a navegação funcionar

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 60),
              const Text(
                'FICS',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 40),
              // Botão Criar Evento
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0FA3B1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      print("Botão Criar Evento pressionado");
                    },
                    child: const Text(
                      'CRIAR EVENTO',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60),
              // Título da lista
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'EVENTOS PASSADOS',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Agora passamos o 'context' para a função saber como navegar
              _buildEventoItem(context, 'EVENTO 1', '50 PARTICIPANTES'),
              _buildEventoItem(context, 'EVENTO 2', '50 PARTICIPANTES'),
              _buildEventoItem(context, 'EVENTO 3', '50 PARTICIPANTES'),
            ],
          ),
        ),
      ),
    );
  }

  // Função atualizada para receber o BuildContext e realizar a navegação
  Widget _buildEventoItem(BuildContext context, String titulo, String sub) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      title: Text(titulo, style: const TextStyle(color: Colors.white, fontSize: 18)),
      subtitle: Text(sub, style: const TextStyle(color: Colors.white70, fontSize: 14)),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 30),
      onTap: () {
        // Ao clicar no item, navega para a Tela do Evento
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TelaEvento()),
        );
      },
    );
  }
}