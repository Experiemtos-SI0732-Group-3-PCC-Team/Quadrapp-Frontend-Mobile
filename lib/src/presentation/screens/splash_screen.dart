import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../components/components.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback? onSplashComplete;

  const SplashScreen({Key? key, this.onSplashComplete}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _spinnerController;
  late Animation<double> _logoAnimation;
  late Animation<Offset> _logoSlideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startSplashSequence();
  }

  void _initializeAnimations() {
    // Logo animation controller
    _logoController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // Spinner animation controller
    _spinnerController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    // Logo scale animation
    _logoAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: const Interval(0.0, 0.7, curve: Curves.elasticOut),
      ),
    );

    // Logo slide animation
    _logoSlideAnimation =
        Tween<Offset>(begin: const Offset(0, -0.5), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _logoController,
            curve: const Interval(0.0, 0.8, curve: Curves.easeOutCubic),
          ),
        );

    // Fade in animation for the whole screen
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: const Interval(0.0, 0.3, curve: Curves.easeIn),
      ),
    );
  }

  void _startSplashSequence() async {
    // Set status bar style for splash
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.primaryPurple,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    // Start logo animation
    _logoController.forward();

    // Wait for logo animation to mostly complete
    await Future.delayed(const Duration(milliseconds: 1400));

    // Start spinner animation
    _spinnerController.forward();

    // Wait for minimum splash duration (3 seconds total)
    await Future.delayed(const Duration(milliseconds: 1600));

    // Complete splash
    if (mounted && widget.onSplashComplete != null) {
      widget.onSplashComplete!();
    }
  }

  @override
  void dispose() {
    _logoController.dispose();
    _spinnerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _fadeAnimation,
        builder: (context, child) {
          return Opacity(
            opacity: _fadeAnimation.value,
            child: Container(
              decoration: const BoxDecoration(
                gradient: AppColors.splashGradient,
              ),
              child: SafeArea(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo section
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: AnimatedBuilder(
                            animation: _logoController,
                            builder: (context, child) {
                              return SlideTransition(
                                position: _logoSlideAnimation,
                                child: Transform.scale(
                                  scale: _logoAnimation.value,
                                  child: const QuadraappLogo(
                                    size: LogoSize.large,
                                    variant: LogoVariant.full,
                                    animated: false,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      // Loading section
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedBuilder(
                              animation: _spinnerController,
                              builder: (context, child) {
                                return Opacity(
                                  opacity: _spinnerController.value,
                                  child: const SimpleLoadingSpinner(
                                    size: SpinnerSize.medium,
                                    variant: SpinnerVariant.white,
                                    showMessage: false,
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: AppDimensions.paddingL),
                            AnimatedBuilder(
                              animation: _spinnerController,
                              builder: (context, child) {
                                return Opacity(
                                  opacity: _spinnerController.value * 0.8,
                                  child: const Text(
                                    'Cargando...',
                                    style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),

                      // Bottom padding
                      const SizedBox(height: AppDimensions.paddingXL),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Alternative minimal splash screen
class MinimalSplashScreen extends StatefulWidget {
  final VoidCallback? onSplashComplete;
  final Duration duration;

  const MinimalSplashScreen({
    Key? key,
    this.onSplashComplete,
    this.duration = const Duration(seconds: 3),
  }) : super(key: key);

  @override
  State<MinimalSplashScreen> createState() => _MinimalSplashScreenState();
}

class _MinimalSplashScreenState extends State<MinimalSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _startSplash();
  }

  void _startSplash() async {
    _controller.forward();
    await Future.delayed(widget.duration);
    if (mounted && widget.onSplashComplete != null) {
      widget.onSplashComplete!();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.splashGradient),
        child: Center(
          child: AnimatedBuilder(
            animation: _fadeAnimation,
            builder: (context, child) {
              return Opacity(
                opacity: _fadeAnimation.value,
                child: const QuadraappLogo(
                  size: LogoSize.large,
                  variant: LogoVariant.full,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
