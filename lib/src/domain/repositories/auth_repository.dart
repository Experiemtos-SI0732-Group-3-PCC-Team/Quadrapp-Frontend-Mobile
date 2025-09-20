import '../../core/result.dart';
import '../entities/user.dart';
import '../entities/auth_token.dart';

abstract class AuthRepository {
  /// Login with email and password
  Future<Result<AuthToken>> login({
    required String email,
    required String password,
  });

  /// Register a new user
  Future<Result<User>> register({
    required String email,
    required String password,
    required String name,
  });

  /// Logout current user
  Future<Result<void>> logout();

  /// Get current user information
  Future<Result<User>> getCurrentUser();

  /// Check if user is logged in
  Future<bool> isLoggedIn();

  /// Refresh authentication token
  Future<Result<AuthToken>> refreshToken();

  /// Reset password
  Future<Result<void>> resetPassword({required String email});

  /// Verify email
  Future<Result<void>> verifyEmail({
    required String email,
    required String verificationCode,
  });

  /// Resend email verification
  Future<Result<void>> resendEmailVerification({required String email});

  /// Update user profile
  Future<Result<User>> updateProfile({
    required String userId,
    String? name,
    String? profileImageUrl,
  });

  /// Change password
  Future<Result<void>> changePassword({
    required String currentPassword,
    required String newPassword,
  });

  /// Delete account
  Future<Result<void>> deleteAccount({required String password});

  /// Get stored auth token
  Future<Result<AuthToken?>> getStoredToken();

  /// Store auth token
  Future<Result<void>> storeToken(AuthToken token);

  /// Clear stored token
  Future<Result<void>> clearStoredToken();
}
