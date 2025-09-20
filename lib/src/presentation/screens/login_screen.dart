import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';
import '../components/components.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback? onLoginSuccess;
  final VoidCallback? onNavigateToRegister;
  final VoidCallback? onForgotPassword;

  const LoginScreen({
    Key? key,
    this.onLoginSuccess,
    this.onNavigateToRegister,
    this.onForgotPassword,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  bool _isLoading = false;
  bool _obscurePassword = true;
  String? _emailError;
  String? _passwordError;

  @override
  void initState() {
    super.initState();

    // Set status bar style for login screen
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.whiteBackground,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _handleLogin() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
      _emailError = null;
      _passwordError = null;
    });

    try {
      // Simular llamada a API
      await Future.delayed(const Duration(seconds: 2));

      // Aquí iría la lógica real de autenticación
      final email = _emailController.text.trim();
      final password = _passwordController.text;

      if (email == 'admin@quadrapp.com' && password == '123456') {
        if (widget.onLoginSuccess != null) {
          widget.onLoginSuccess!();
        }
      } else {
        setState(() {
          _emailError = 'Credenciales incorrectas';
          _passwordError = 'Credenciales incorrectas';
        });
      }
    } catch (e) {
      // Manejar errores
      setState(() {
        _emailError = 'Error de conexión';
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'El email es requerido';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Ingresa un email válido';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'La contraseña es requerida';
    }
    if (value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > AppDimensions.mobileBreakpoint;

    return Scaffold(
      body: SafeArea(
        child: isWideScreen ? _buildWideScreenLayout() : _buildMobileLayout(),
      ),
    );
  }

  Widget _buildWideScreenLayout() {
    return Row(
      children: [
        // Left side - Splash/Logo section (40%)
        Expanded(flex: 4, child: _buildSplashSection()),
        // Right side - Login form (60%)
        Expanded(flex: 6, child: _buildLoginForm()),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Compact splash section for mobile
          Container(
            height: 200,
            width: double.infinity,
            child: _buildSplashSection(),
          ),
          // Login form
          _buildLoginForm(),
        ],
      ),
    );
  }

  Widget _buildSplashSection() {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.splashGradient),
      child: const Center(
        child: QuadraappLogo(size: LogoSize.large, variant: LogoVariant.full),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Container(
      color: AppColors.whiteBackground,
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.loginFormPadding),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: AppDimensions.loginFormWidth,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Welcome text
                  Text(
                    'Bienvenido',
                    style: AppTypography.h2Dark,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppDimensions.paddingS),
                  Text(
                    'Ingresa tus credenciales para continuar',
                    style: AppTypography.bodyMediumDark.copyWith(
                      color: AppColors.hintText,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppDimensions.loginButtonSpacing),

                  // Email field
                  CustomTextField(
                    label: 'Email',
                    hintText: 'Ingresa tu email',
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    errorText: _emailError,
                    validator: _validateEmail,
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: AppColors.hintText,
                    ),
                    onSubmitted: (_) {
                      _passwordFocusNode.requestFocus();
                    },
                  ),
                  const SizedBox(height: AppDimensions.loginInputSpacing),

                  // Password field
                  CustomTextField(
                    label: 'Contraseña',
                    hintText: 'Ingresa tu contraseña',
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    obscureText: _obscurePassword,
                    textInputAction: TextInputAction.done,
                    errorText: _passwordError,
                    validator: _validatePassword,
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: AppColors.hintText,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColors.hintText,
                      ),
                    ),
                    onSubmitted: (_) {
                      _handleLogin();
                    },
                  ),
                  const SizedBox(height: AppDimensions.paddingL),

                  // Forgot password link
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: widget.onForgotPassword,
                      child: Text(
                        '¿Olvidaste tu contraseña?',
                        style: AppTypography.link,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppDimensions.loginButtonSpacing),

                  // Login button
                  CustomButton(
                    text: 'Iniciar Sesión',
                    onPressed: _isLoading ? null : _handleLogin,
                    isLoading: _isLoading,
                    variant: ButtonVariant.gradient,
                    size: ButtonSize.large,
                    width: double.infinity,
                  ),
                  const SizedBox(height: AppDimensions.paddingL),

                  // Divider
                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppDimensions.paddingM,
                        ),
                        child: Text(
                          'o',
                          style: AppTypography.bodyMedium.copyWith(
                            color: AppColors.hintText,
                          ),
                        ),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: AppDimensions.paddingL),

                  // Register link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '¿No tienes cuenta? ',
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppColors.hintText,
                        ),
                      ),
                      TextButton(
                        onPressed: widget.onNavigateToRegister,
                        child: Text('Regístrate', style: AppTypography.link),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Version simple del login para móviles
class SimpleLoginScreen extends StatefulWidget {
  final VoidCallback? onLoginSuccess;

  const SimpleLoginScreen({Key? key, this.onLoginSuccess}) : super(key: key);

  @override
  State<SimpleLoginScreen> createState() => _SimpleLoginScreenState();
}

class _SimpleLoginScreenState extends State<SimpleLoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  void _handleLogin() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _isLoading = false);
    widget.onLoginSuccess?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.splashGradient),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.paddingL),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const QuadraappLogo(
                  size: LogoSize.medium,
                  variant: LogoVariant.full,
                ),
                const SizedBox(height: AppDimensions.paddingXXL),

                CustomTextField(
                  hintText: 'Email',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: AppDimensions.paddingL),

                CustomTextField(
                  hintText: 'Contraseña',
                  controller: _passwordController,
                  obscureText: true,
                ),
                const SizedBox(height: AppDimensions.paddingXL),

                CustomButton(
                  text: 'Iniciar Sesión',
                  onPressed: _isLoading ? null : _handleLogin,
                  isLoading: _isLoading,
                  variant: ButtonVariant.primary,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
