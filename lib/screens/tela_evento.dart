// terceira tela do modelo do canva


import 'package:flutter/material.dart';
import '../widgets/gradient_bg.dart';
import 'tela_checkin.dart';

class TelaEvento extends StatelessWidget {
  const TelaEvento({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Expanded(
                      child: Text(
                        'EVENTO\nNOME',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 48), // Espaço para centralizar o texto
                  ],
                ),
                const SizedBox(height: 40),
                const Text(
                  'CAIXA DE DESCRIÇÃO DO EVENTO, PARA COLOCAR O LOCAL E HORÁRIO. PODE COLOCAR TAMBÉM QUEM FOI O PATROCINADOR.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16, height: 1.5),
                ),
                const SizedBox(height: 40),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('PLANILHA DE PARTICIPANTES', style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text('www.planilha.com', style: TextStyle(color: Colors.black87)),
                  ),
                ),
                const SizedBox(height: 40),
                const Text('TOTAL DE PARTICIPANTES', style: TextStyle(color: Colors.white, fontSize: 12)),
                const Text('50', style: TextStyle(color: Colors.white, fontSize: 48)),
                const Spacer(),
                _buildButton('ENCERRAR EVENTO', () {}),
                const SizedBox(height: 16),
                _buildButton('CHECKIN', () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const TelaCheckin()));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF050515), // Cor escura do botão
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        onPressed: onPressed,
        child: Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }
}