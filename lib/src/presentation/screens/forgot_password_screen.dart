import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final VoidCallback? onBackToLogin;
  final VoidCallback? onPasswordResetSent;

  const ForgotPasswordScreen({Key? key, this.onBackToLogin, this.onPasswordResetSent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final emailController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 48),
              const Text(
                'Recuperar contraseña',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Te enviaremos un enlace para restablecer tu contraseña',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 32),
              const Text('Email', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'tu@email.com',
                  filled: true,
                  fillColor: Color(0xFFF3F4F6),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (onPasswordResetSent != null) {
                          onPasswordResetSent!();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text('Enviar enlace', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Center(
                child: GestureDetector(
                  onTap: onBackToLogin,
                  child: const Text(
                    'Volver al inicio de sesión',
                    style: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
