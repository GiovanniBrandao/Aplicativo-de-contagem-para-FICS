// segunda tela do modelo do canva


import 'package:flutter/material.dart';
import '../widgets/gradient_bg.dart';

class TelaCheckin extends StatefulWidget {
  const TelaCheckin({super.key});

  @override
  State<TelaCheckin> createState() => _TelaCheckinState();
}

class _TelaCheckinState extends State<TelaCheckin> {
  int acompanhantes = 20;
  String papelSelecionado = 'EXPOSITOR';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Text(
                      'Cadastro de\nParticipante',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    const Icon(Icons.more_vert, color: Colors.white, size: 36),
                  ],
                ),
                const SizedBox(height: 40),
                _buildInputLabel('NOME'),
                _buildTextField('Maria'),
                const SizedBox(height: 20),
                _buildInputLabel('CPF'),
                _buildTextField('000.000.000-00'),
                const SizedBox(height: 20),
                _buildInputLabel('PAPEL'),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: papelSelecionado,
                      icon: const Icon(Icons.keyboard_arrow_down, size: 30, color: Colors.black87),
                      dropdownColor: Colors.grey[300],
                      items: ['PARTICIPANTE', 'PROFESSOR', 'EXPOSITOR', 'FAMÍLIA']
                          .map((String value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, style: const TextStyle(color: Colors.black87)),
                              ))
                          .toList(),
                      onChanged: (newValue) {
                        setState(() {
                          papelSelecionado = newValue!;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton(
                      heroTag: 'btn_add',
                      backgroundColor: const Color(0xFF0FA3B1),
                      onPressed: () => setState(() => acompanhantes++),
                      child: const Icon(Icons.add, color: Colors.white),
                    ),
                    Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text('$acompanhantes', style: const TextStyle(fontSize: 18, color: Colors.black87)),
                      ),
                    ),
                    FloatingActionButton(
                      heroTag: 'btn_remove',
                      backgroundColor: const Color(0xFF0FA3B1),
                      onPressed: () => setState(() {
                        if (acompanhantes > 0) acompanhantes--;
                      }),
                      child: const Icon(Icons.remove, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF050515),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    onPressed: () {
                      // Aqui chamaremos o serviço do Sheets futuramente
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Enviando para a planilha...')),
                      );
                    },
                    child: const Text('Enviar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 12)),
    );
  }

  Widget _buildTextField(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black54),
        filled: true,
        fillColor: Colors.white.withOpacity(0.6),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
      ),
      style: const TextStyle(color: Colors.black87),
    );
  }
}