import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final VoidCallback? onAccountCreated;
  final VoidCallback? onBackToLogin;

  const RegisterScreen({Key? key, this.onAccountCreated, this.onBackToLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    bool acceptedTerms = false;

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
                'Crear cuenta',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text('Únete a Quadrapp', style: TextStyle(fontSize: 16, color: Colors.black54)),
              const SizedBox(height: 32),
              const Text('Nombre completo', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Juan Pérez',
                  filled: true,
                  fillColor: Color(0xFFF3F4F6),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),
              const Text('Contraseña', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: '*******',
                  filled: true,
                  fillColor: Color(0xFFF3F4F6),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  StatefulBuilder(
                    builder: (context, setState) {
                      return Checkbox(
                        value: acceptedTerms,
                        onChanged: (value) {
                          setState(() {
                            acceptedTerms = value ?? false;
                          });
                        },
                      );
                    },
                  ),
                  const Text('Acepto los '),
                  GestureDetector(
                    onTap: () {},
                    child: const Text('Términos y Condiciones', style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (onAccountCreated != null) {
                          onAccountCreated!();
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
                      child: const Text('Registrarse', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Center(
                child: GestureDetector(
                  onTap: onBackToLogin,
                  child: const Text(
                    '¿Ya tienes cuenta? Inicia sesión',
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
