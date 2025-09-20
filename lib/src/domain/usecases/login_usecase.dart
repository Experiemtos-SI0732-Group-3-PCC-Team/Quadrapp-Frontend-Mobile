import '../../core/result.dart';
import '../entities/auth_token.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Result<AuthToken>> call({
    required String email,
    required String password,
  }) async {
    // Validate input
    if (email.isEmpty) {
      return const Error('El email es requerido');
    }

    if (password.isEmpty) {
      return const Error('La contraseña es requerida');
    }

    if (!_isValidEmail(email)) {
      return const Error('Formato de email inválido');
    }

    if (password.length < 6) {
      return const Error('La contraseña debe tener al menos 6 caracteres');
    }

    // Call repository
    return await repository.login(
      email: email.trim().toLowerCase(),
      password: password,
    );
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}
