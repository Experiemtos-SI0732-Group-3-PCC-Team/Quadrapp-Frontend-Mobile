import 'package:flutter/material.dart';

class PasswordResetSentScreen extends StatelessWidget {
  final VoidCallback? onBackToLogin;

  const PasswordResetSentScreen({Key? key, this.onBackToLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(24),
                  child: const Icon(Icons.check, color: Colors.green, size: 48),
                ),
                const SizedBox(height: 32),
                const Text(
                  '¡Enlace enviado!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Revisa tu email para restablecer tu contraseña',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                TextButton(
                  onPressed: onBackToLogin,
                  child: const Text('Volver al inicio de sesión', style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
