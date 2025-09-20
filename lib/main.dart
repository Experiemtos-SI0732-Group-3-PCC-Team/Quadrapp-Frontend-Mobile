import 'package:flutter/material.dart';
import 'src/presentation/theme/app_theme.dart';
import 'src/presentation/screens/screens.dart';

void main() {
  runApp(const QuadraApp());
}

class QuadraApp extends StatelessWidget {
  const QuadraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quadrapp',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: const AppNavigator(),
    );
  }
}

class AppNavigator extends StatefulWidget {
  const AppNavigator({super.key});

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  bool _showSplash = true;

  void _onSplashComplete() {
    setState(() {
      _showSplash = false;
    });
  }

  void _onLoginSuccess() {
    // Aquí navegarías a la pantalla principal de la app
    // Por ahora mostraremos un mensaje
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('¡Login exitoso! Bienvenido a Quadrapp'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _onNavigateToRegister() {
    // Aquí navegarías a la pantalla de registro
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Navegando a registro... (pendiente implementar)'),
      ),
    );
  }

  void _onForgotPassword() {
    // Aquí navegarías a la pantalla de recuperar contraseña
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Recuperar contraseña... (pendiente implementar)'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_showSplash) {
      return SplashScreen(onSplashComplete: _onSplashComplete);
    }

    return LoginScreen(
      onLoginSuccess: _onLoginSuccess,
      onNavigateToRegister: _onNavigateToRegister,
      onForgotPassword: _onForgotPassword,
    );
  }
}
