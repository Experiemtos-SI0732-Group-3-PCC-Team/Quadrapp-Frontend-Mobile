// Simple Result type for handling success/failure without external dependencies
sealed class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

class Error<T> extends Result<T> {
  final String message;
  final String? code;
  const Error(this.message, {this.code});
}
