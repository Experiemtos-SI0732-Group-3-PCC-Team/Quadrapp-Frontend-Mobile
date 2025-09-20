abstract class Failure {
  final String message;
  final String? code;

  const Failure(this.message, {this.code});

  @override
  String toString() => 'Failure(message: $message, code: $code)';
}

// Auth Failures
class AuthFailure extends Failure {
  const AuthFailure(String message, {String? code})
    : super(message, code: code);
}

class InvalidCredentialsFailure extends AuthFailure {
  const InvalidCredentialsFailure()
    : super('Credenciales inválidas', code: 'INVALID_CREDENTIALS');
}

class UserNotFoundFailure extends AuthFailure {
  const UserNotFoundFailure()
    : super('Usuario no encontrado', code: 'USER_NOT_FOUND');
}

class EmailAlreadyExistsFailure extends AuthFailure {
  const EmailAlreadyExistsFailure()
    : super('El email ya está registrado', code: 'EMAIL_EXISTS');
}

class WeakPasswordFailure extends AuthFailure {
  const WeakPasswordFailure()
    : super('La contraseña es muy débil', code: 'WEAK_PASSWORD');
}

class EmailNotVerifiedFailure extends AuthFailure {
  const EmailNotVerifiedFailure()
    : super('El email no está verificado', code: 'EMAIL_NOT_VERIFIED');
}

class TokenExpiredFailure extends AuthFailure {
  const TokenExpiredFailure()
    : super('La sesión ha expirado', code: 'TOKEN_EXPIRED');
}

class UnauthorizedFailure extends AuthFailure {
  const UnauthorizedFailure()
    : super(
        'No tienes permisos para realizar esta acción',
        code: 'UNAUTHORIZED',
      );
}

// Network Failures
class NetworkFailure extends Failure {
  const NetworkFailure(String message, {String? code})
    : super(message, code: code);
}

class NoInternetConnectionFailure extends NetworkFailure {
  const NoInternetConnectionFailure()
    : super('Sin conexión a internet', code: 'NO_INTERNET');
}

class ServerFailure extends NetworkFailure {
  const ServerFailure() : super('Error del servidor', code: 'SERVER_ERROR');
}

class TimeoutFailure extends NetworkFailure {
  const TimeoutFailure() : super('Tiempo de espera agotado', code: 'TIMEOUT');
}

// Cache Failures
class CacheFailure extends Failure {
  const CacheFailure(String message, {String? code})
    : super(message, code: code);
}

class CacheNotFoundFailure extends CacheFailure {
  const CacheNotFoundFailure()
    : super('Datos no encontrados en caché', code: 'CACHE_NOT_FOUND');
}

// Validation Failures
class ValidationFailure extends Failure {
  const ValidationFailure(String message, {String? code})
    : super(message, code: code);
}

class InvalidEmailFailure extends ValidationFailure {
  const InvalidEmailFailure() : super('Email inválido', code: 'INVALID_EMAIL');
}

class InvalidPasswordFailure extends ValidationFailure {
  const InvalidPasswordFailure()
    : super('Contraseña inválida', code: 'INVALID_PASSWORD');
}
