import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Ocupa a tela inteira
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          // Cores baseadas na sua identidade visual
          colors: [
            Color(0xFF050515), // Topo escuro
            Color(0xFF08203e), // Meio azulado
            Color(0xFF00C9B1), // Base ciano/verde
          ],
          stops: [0.0, 0.6, 1.0],
        ),
      ),
      child: child,
    );
  }
}