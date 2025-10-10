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
  bool _showPaymentMethods = false;
  void _onShowPaymentMethods() {
    setState(() {
      _showPaymentMethods = true;
    });
  }

  void _onBackFromPaymentMethods() {
    setState(() {
      _showPaymentMethods = false;
    });
  }
  bool _showReservations = false;
  bool _showProfile = false;
  bool _showEditProfile = false;
  bool _showSettings = false;
  bool _showNotifications = false;
  
  void _onShowProfile() {
    setState(() {
      _showProfile = true;
    });
  }

  void _onBackFromProfile() {
    setState(() {
      _showProfile = false;
    });
  }

  void _onShowEditProfile() {
    setState(() {
      _showEditProfile = true;
    });
  }

  void _onBackFromEditProfile() {
    setState(() {
      _showEditProfile = false;
    });
  }

  void _onShowSettings() {
    setState(() {
      _showSettings = true;
    });
  }

  void _onBackFromSettings() {
    setState(() {
      _showSettings = false;
    });
  }

  void _onShowNotifications() {
    setState(() {
      _showNotifications = true;
    });
  }

  void _onBackFromNotifications() {
    setState(() {
      _showNotifications = false;
    });
  }
  Map<String, dynamic>? _selectedReserva;
  bool _showActiveReservationDetail = false;
  bool _showParkingMap = false;
  void _onShowParkingMap() {
    setState(() {
      _showParkingMap = true;
    });
  }

  void _onFinishMap() {
    setState(() {
      _showParkingMap = false;
      _showActiveReservationDetail = false;
      _showReservations = false;
    });
  }

  void _onShowReservations() {
    setState(() {
      _showReservations = true;
      _showActiveReservationDetail = false;
    });
  }

  void _onBackFromReservations() {
    setState(() {
      _showReservations = false;
      _showActiveReservationDetail = false;
    });
  }

  void _onSelectReserva(Map<String, dynamic> reserva) {
    if (reserva['estado'] == 'Activa') {
      setState(() {
        _selectedReserva = reserva;
        _showActiveReservationDetail = true;
      });
    }
    // Si es completada, aquí podrías mostrar otra pantalla de detalle si lo deseas
  }

  void _onCancelReserva() {
    setState(() {
      _showActiveReservationDetail = false;
      _showReservations = false;
      // Mantener al usuario logueado y mostrar Home
    });
  }
  bool _showReservationDateTime = false;
  bool _showReservationSummary = false;
  bool _showPaymentMethod = false;
  bool _showPaymentSuccess = false;
  bool _showPaymentError = false;
  void _onShowPaymentError() {
    setState(() {
      _showPaymentError = true;
      _showPaymentMethod = false;
    });
  }
  String _selectedHour = '10:00';
  int _selectedDuration = 2;

  void _onShowReservationDateTime() {
    setState(() {
      _showReservationDateTime = true;
      _showReservationSummary = false;
    });
  }

  void _onBackToParkingDetail() {
    setState(() {
      _showReservationDateTime = false;
      _showReservationSummary = false;
    });
  }

  void _onShowReservationSummary(String hour, int duration) {
    setState(() {
      _showReservationSummary = true;
      _showReservationDateTime = false;
      _showPaymentMethod = false;
      _selectedHour = hour;
      _selectedDuration = duration;
    });
  }

  void _onShowPaymentMethod() {
    setState(() {
      _showPaymentMethod = true;
      _showReservationSummary = false;
    });
  }

  void _onBackToReservationSummary() {
    setState(() {
      _showPaymentMethod = false;
      _showReservationSummary = true;
    });
  }

  void _onShowPaymentSuccess() {
    setState(() {
      _showPaymentSuccess = true;
      _showPaymentMethod = false;
    });
  }

  void _onGoHome() {
    setState(() {
      _showPaymentSuccess = false;
      _showSearchResults = false;
      _showParkingDetail = false;
      _showReservationDateTime = false;
      _showReservationSummary = false;
      _showPaymentMethod = false;
    });
  }

  void _onBackToReservationDateTime() {
    setState(() {
      _showReservationSummary = false;
      _showReservationDateTime = true;
    });
  }
  bool _showParkingDetail = false;

  void _onShowParkingDetail() {
    setState(() {
      _showParkingDetail = true;
    });
  }

  void _onBackToResults() {
    setState(() {
      _showParkingDetail = false;
    });
  }
  bool _showSearchResults = false;

  void _onShowSearchResults() {
    setState(() {
      _showSearchResults = true;
    });
  }

  void _onBackToHome() {
    setState(() {
      _showSearchResults = false;
    });
  }
  bool _showSplash = true;

  void _onSplashComplete() {
    setState(() {
      _showSplash = false;
    });
  }

  bool _isLoggedIn = false;

  void _onLoginSuccess() {
    setState(() {
      _isLoggedIn = true;
    });
  }

  bool _showRegister = false;
  bool _showAccountCreated = false;

  void _onNavigateToRegister() {
    setState(() {
      _showRegister = true;
      _showAccountCreated = false;
    });
  }

  void _onAccountCreated() {
    setState(() {
      _showAccountCreated = true;
      _showRegister = false;
    });
  }

  bool _showForgotPassword = false;
  bool _showPasswordResetSent = false;

  void _onForgotPassword() {
    setState(() {
      _showForgotPassword = true;
      _showPasswordResetSent = false;
    });
  }

  void _onBackToLogin() {
    setState(() {
      _showForgotPassword = false;
      _showPasswordResetSent = false;
      _showRegister = false;
      _showAccountCreated = false;
    });
  }

  void _onPasswordResetSent() {
    setState(() {
      _showPasswordResetSent = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showSplash) {
      return SplashScreen(onSplashComplete: _onSplashComplete);
    }
    if (_showRegister && !_showAccountCreated) {
      return RegisterScreen(
        onAccountCreated: _onAccountCreated,
        onBackToLogin: _onBackToLogin,
      );
    }
    if (_showAccountCreated) {
      return AccountCreatedScreen(onGoToLogin: _onBackToLogin);
    }
    if (_showForgotPassword && !_showPasswordResetSent) {
      return ForgotPasswordScreen(
        onBackToLogin: _onBackToLogin,
        onPasswordResetSent: _onPasswordResetSent,
      );
    }
    if (_showPasswordResetSent) {
      return PasswordResetSentScreen(onBackToLogin: _onBackToLogin);
    }
    if (_isLoggedIn && _showSearchResults && _showParkingDetail && _showReservationDateTime) {
      return ReservationDateTimeScreen(
        onBack: _onBackToParkingDetail,
        onNext: (String hour, int duration) {
          _onShowReservationSummary(hour, duration);
        },
      );
    }
    if (_isLoggedIn && _showSearchResults && _showParkingDetail && _showReservationSummary) {
      return ReservationSummaryScreen(
        parkingName: 'Parking Centro Premium',
        date: 'Hoy, 15 de Marzo',
        hour: '${_selectedHour} - ${_getEndHour(_selectedHour, _selectedDuration)}',
        duration: _selectedDuration,
        onBack: _onBackToReservationDateTime,
        onPay: _onShowPaymentMethod,
      );
    }
    if (_isLoggedIn && _showSearchResults && _showParkingDetail && _showPaymentMethod) {
      final subtotal = _selectedDuration * 15;
      final total = subtotal + 2;
      return PaymentMethodScreen(
        total: total,
        onBack: _onBackToReservationSummary,
        onConfirm: _onShowPaymentSuccess,
        onReject: _onShowPaymentError,
      );
    }
    if (_isLoggedIn && _showPaymentError) {
      return PaymentErrorScreen(
        onBack: () {
          setState(() {
            _showPaymentError = false;
            _showPaymentMethod = true;
          });
        },
      );
    }
    if (_isLoggedIn && _showPaymentSuccess) {
      return PaymentSuccessScreen(
        onGoHome: _onGoHome,
      );
    }
    if (_isLoggedIn && _showSearchResults && _showParkingDetail) {
      return ParkingDetailScreen(
        onBack: _onBackToResults,
        onSelectDateTime: _onShowReservationDateTime,
      );
    }
    if (_isLoggedIn && _showSearchResults) {
      return SearchResultsScreen(
        onBack: _onBackToHome,
        onShowParkingDetail: _onShowParkingDetail,
      );
    }
    if (_isLoggedIn && _showParkingMap && _selectedReserva != null) {
      return ParkingMapScreen(
        parkingName: _selectedReserva!['nombre'],
        space: 'A-15',
        remainingTime: '1h 23m',
        onFinish: _onFinishMap,
      );
    }
    if (_isLoggedIn && _showActiveReservationDetail && _selectedReserva != null) {
      return ActiveReservationDetailScreen(
        parkingName: _selectedReserva!['nombre'],
        space: 'Espacio A-15',
        endHour: '11:00',
        remainingTime: '01:23',
        onMap: _onShowParkingMap,
        onCancel: _onCancelReserva,
      );
    }
    if (_isLoggedIn && _showReservations) {
      return MyReservationsScreen(
        onBack: _onBackFromReservations,
        onSelectReserva: _onSelectReserva,
      );
    }
    if (_isLoggedIn && _showPaymentMethods) {
      return PaymentMethodsScreen(onBack: _onBackFromPaymentMethods);
    }
    if (_isLoggedIn && _showNotifications) {
      return NotificationsScreen(onBack: _onBackFromNotifications);
    }
    if (_isLoggedIn && _showSettings) {
      return SettingsScreen(onBack: _onBackFromSettings);
    }
    if (_isLoggedIn && _showEditProfile) {
      return EditProfileScreen(onBack: _onBackFromEditProfile);
    }
    if (_isLoggedIn && _showProfile) {
      return ProfileScreen(
        onBack: _onBackFromProfile,
        onEditProfile: _onShowEditProfile,
        onPaymentMethods: _onShowPaymentMethods,
        onSettings: _onShowSettings,
        onNotifications: _onShowNotifications,
      );
    }
    if (_isLoggedIn) {
      return HomeScreen(
        onShowSearchResults: _onShowSearchResults,
        onShowReservations: _onShowReservations,
        onShowProfile: _onShowProfile,
      );
    }
    return LoginScreen(
      onLoginSuccess: _onLoginSuccess,
      onNavigateToRegister: _onNavigateToRegister,
      onForgotPassword: _onForgotPassword,
    );
  }

  String _getEndHour(String startHour, int duration) {
    final parts = startHour.split(":");
    int hour = int.parse(parts[0]);
    int min = int.parse(parts[1]);
    hour += duration;
    if (hour >= 24) hour -= 24;
    return "${hour.toString().padLeft(2, '0')}:${min.toString().padLeft(2, '0')}";
  }
}
