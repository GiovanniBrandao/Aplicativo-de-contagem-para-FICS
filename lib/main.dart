// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/tela_inicial.dart'; // O main só precisa importar a primeira tela

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FICS App',
      // Remove a faixa "DEBUG" vermelha do canto da tela
      debugShowCheckedModeBanner: false, 
      
      theme: ThemeData(
        // Define o tema base como escuro, ajudando no contraste geral
        brightness: Brightness.dark, 
        useMaterial3: true,
      ),
      
      // Define qual tela vai aparecer assim que o app abrir
      home: const TelaInicial(), 
    );
  }
}