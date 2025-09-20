import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';

enum LogoSize { small, medium, large }

enum LogoVariant {
  full, // Logo + text
  iconOnly, // Solo el icono
  textOnly, // Solo el texto
}

class QuadraappLogo extends StatefulWidget {
  final LogoSize size;
  final LogoVariant variant;
  final bool animated;
  final VoidCallback? onTap;

  const QuadraappLogo({
    Key? key,
    this.size = LogoSize.medium,
    this.variant = LogoVariant.full,
    this.animated = false,
    this.onTap,
  }) : super(key: key);

  @override
  State<QuadraappLogo> createState() => _QuadraappLogoState();
}

class _QuadraappLogoState extends State<QuadraappLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.7, curve: Curves.elasticOut),
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.3, 1.0, curve: Curves.easeInOut),
      ),
    );

    if (widget.animated) {
      _animationController.forward();
    } else {
      _animationController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Opacity(opacity: _fadeAnimation.value, child: _buildLogo()),
          );
        },
      ),
    );
  }

  Widget _buildLogo() {
    switch (widget.variant) {
      case LogoVariant.full:
        return _buildFullLogo();
      case LogoVariant.iconOnly:
        return _buildIcon();
      case LogoVariant.textOnly:
        return _buildText();
    }
  }

  Widget _buildFullLogo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildIcon(),
        SizedBox(height: _getSpacing()),
        _buildText(),
      ],
    );
  }

  Widget _buildIcon() {
    return Container(
      width: _getIconSize(),
      height: _getIconSize(),
      decoration: BoxDecoration(
        gradient: AppColors.logoGradient,
        borderRadius: BorderRadius.circular(_getIconBorderRadius()),
        boxShadow: [
          BoxShadow(
            color: AppColors.logoOrangeStart.withOpacity(0.3),
            blurRadius: _getIconSize() * 0.1,
            offset: Offset(0, _getIconSize() * 0.05),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Letra P
          Center(
            child: Text(
              'P',
              style: TextStyle(
                fontSize: _getIconSize() * 0.6,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryText,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(1, 1),
                    blurRadius: 2,
                  ),
                ],
              ),
            ),
          ),
          // Silueta de carro (simplificada)
          Positioned(
            bottom: _getIconSize() * 0.15,
            right: _getIconSize() * 0.15,
            child: CustomPaint(
              size: Size(_getIconSize() * 0.3, _getIconSize() * 0.15),
              painter: _CarSilhouettePainter(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildText() {
    return Text('Quadrapp', style: _getTextStyle());
  }

  double _getIconSize() {
    switch (widget.size) {
      case LogoSize.small:
        return AppDimensions.logoHeightSmall;
      case LogoSize.medium:
        return AppDimensions.logoHeight;
      case LogoSize.large:
        return AppDimensions.splashLogoSize;
    }
  }

  double _getIconBorderRadius() {
    return _getIconSize() * 0.2;
  }

  double _getSpacing() {
    switch (widget.size) {
      case LogoSize.small:
        return AppDimensions.paddingS;
      case LogoSize.medium:
        return AppDimensions.paddingM;
      case LogoSize.large:
        return AppDimensions.paddingL;
    }
  }

  TextStyle _getTextStyle() {
    switch (widget.size) {
      case LogoSize.small:
        return AppTypography.h6.copyWith(
          color: AppColors.primaryText,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        );
      case LogoSize.medium:
        return AppTypography.h4.copyWith(
          color: AppColors.primaryText,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        );
      case LogoSize.large:
        return AppTypography.appTitle;
    }
  }
}

class _CarSilhouettePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primaryText.withOpacity(0.8)
      ..style = PaintingStyle.fill;

    final path = Path();

    // Silueta simple de un carro
    // Carrocería principal
    path.moveTo(size.width * 0.1, size.height * 0.7);
    path.lineTo(size.width * 0.2, size.height * 0.3);
    path.lineTo(size.width * 0.7, size.height * 0.3);
    path.lineTo(size.width * 0.8, size.height * 0.5);
    path.lineTo(size.width * 0.9, size.height * 0.7);
    path.lineTo(size.width * 0.8, size.height * 0.9);
    path.lineTo(size.width * 0.2, size.height * 0.9);
    path.close();

    canvas.drawPath(path, paint);

    // Ruedas
    final wheelPaint = Paint()
      ..color = AppColors.primaryText.withOpacity(0.6)
      ..style = PaintingStyle.fill;

    // Rueda izquierda
    canvas.drawCircle(
      Offset(size.width * 0.3, size.height * 0.85),
      size.width * 0.08,
      wheelPaint,
    );

    // Rueda derecha
    canvas.drawCircle(
      Offset(size.width * 0.7, size.height * 0.85),
      size.width * 0.08,
      wheelPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Logo alternativo más simple usando solo texto estilizado
class SimpleQuadraappLogo extends StatelessWidget {
  final LogoSize size;
  final Color? color;
  final VoidCallback? onTap;

  const SimpleQuadraappLogo({
    Key? key,
    this.size = LogoSize.medium,
    this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ShaderMask(
        shaderCallback: (bounds) => AppColors.logoGradient.createShader(bounds),
        child: Text(
          'Quadrapp',
          style: _getTextStyle().copyWith(
            color: color ?? AppColors.primaryText,
          ),
        ),
      ),
    );
  }

  TextStyle _getTextStyle() {
    switch (size) {
      case LogoSize.small:
        return AppTypography.h6.copyWith(
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        );
      case LogoSize.medium:
        return AppTypography.h4.copyWith(
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        );
      case LogoSize.large:
        return AppTypography.appTitle;
    }
  }
}
