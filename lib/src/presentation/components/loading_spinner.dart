import 'dart:math';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';

enum SpinnerSize { small, medium, large }

enum SpinnerVariant { primary, secondary, white, accent }

class LoadingSpinner extends StatefulWidget {
  final SpinnerSize size;
  final SpinnerVariant variant;
  final String? message;
  final bool showMessage;
  final double? strokeWidth;

  const LoadingSpinner({
    Key? key,
    this.size = SpinnerSize.medium,
    this.variant = SpinnerVariant.primary,
    this.message,
    this.showMessage = false,
    this.strokeWidth,
  }) : super(key: key);

  @override
  State<LoadingSpinner> createState() => _LoadingSpinnerState();
}

class _LoadingSpinnerState extends State<LoadingSpinner>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.linear),
    );
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: _getSpinnerSize(),
          height: _getSpinnerSize(),
          child: AnimatedBuilder(
            animation: _rotationAnimation,
            builder: (context, child) {
              return Transform.rotate(
                angle: _rotationAnimation.value * 2 * 3.14159,
                child: CustomPaint(
                  painter: _SpinnerPainter(
                    color: _getSpinnerColor(),
                    strokeWidth: widget.strokeWidth ?? _getStrokeWidth(),
                  ),
                ),
              );
            },
          ),
        ),
        if (widget.showMessage && widget.message != null) ...[
          const SizedBox(height: AppDimensions.paddingM),
          Text(
            widget.message!,
            style: _getMessageStyle(),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }

  double _getSpinnerSize() {
    switch (widget.size) {
      case SpinnerSize.small:
        return AppDimensions.iconS;
      case SpinnerSize.medium:
        return AppDimensions.splashSpinnerSize;
      case SpinnerSize.large:
        return AppDimensions.iconXL;
    }
  }

  double _getStrokeWidth() {
    switch (widget.size) {
      case SpinnerSize.small:
        return 2.0;
      case SpinnerSize.medium:
        return 3.0;
      case SpinnerSize.large:
        return 4.0;
    }
  }

  Color _getSpinnerColor() {
    switch (widget.variant) {
      case SpinnerVariant.primary:
        return AppColors.primaryPurple;
      case SpinnerVariant.secondary:
        return AppColors.secondaryPurple;
      case SpinnerVariant.white:
        return AppColors.primaryText;
      case SpinnerVariant.accent:
        return AppColors.logoOrangeStart;
    }
  }

  TextStyle _getMessageStyle() {
    switch (widget.variant) {
      case SpinnerVariant.primary:
        return AppTypography.bodyMedium.copyWith(
          color: AppColors.primaryPurple,
        );
      case SpinnerVariant.secondary:
        return AppTypography.bodyMedium.copyWith(
          color: AppColors.secondaryPurple,
        );
      case SpinnerVariant.white:
        return AppTypography.bodyMedium.copyWith(color: AppColors.primaryText);
      case SpinnerVariant.accent:
        return AppTypography.bodyMedium.copyWith(
          color: AppColors.logoOrangeStart,
        );
    }
  }
}

class _SpinnerPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  _SpinnerPainter({required this.color, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // Draw the arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0,
      3.14159 * 1.5, // 270 degrees
      false,
      paint,
    );

    // Draw a small circle at the end for a smooth appearance
    final endAngle = 3.14159 * 1.5;
    final endPoint = Offset(
      center.dx + radius * (1 + 0.02) * cos(endAngle),
      center.dy + radius * (1 + 0.02) * sin(endAngle),
    );

    final dotPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawCircle(endPoint, strokeWidth / 2, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Simple loading indicator that uses built-in CircularProgressIndicator
class SimpleLoadingSpinner extends StatelessWidget {
  final SpinnerSize size;
  final SpinnerVariant variant;
  final String? message;
  final bool showMessage;
  final double? strokeWidth;

  const SimpleLoadingSpinner({
    Key? key,
    this.size = SpinnerSize.medium,
    this.variant = SpinnerVariant.primary,
    this.message,
    this.showMessage = false,
    this.strokeWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: _getSpinnerSize(),
          height: _getSpinnerSize(),
          child: CircularProgressIndicator(
            strokeWidth: strokeWidth ?? _getStrokeWidth(),
            valueColor: AlwaysStoppedAnimation<Color>(_getSpinnerColor()),
          ),
        ),
        if (showMessage && message != null) ...[
          const SizedBox(height: AppDimensions.paddingM),
          Text(
            message!,
            style: _getMessageStyle(),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }

  double _getSpinnerSize() {
    switch (size) {
      case SpinnerSize.small:
        return AppDimensions.iconS;
      case SpinnerSize.medium:
        return AppDimensions.splashSpinnerSize;
      case SpinnerSize.large:
        return AppDimensions.iconXL;
    }
  }

  double _getStrokeWidth() {
    switch (size) {
      case SpinnerSize.small:
        return 2.0;
      case SpinnerSize.medium:
        return 3.0;
      case SpinnerSize.large:
        return 4.0;
    }
  }

  Color _getSpinnerColor() {
    switch (variant) {
      case SpinnerVariant.primary:
        return AppColors.primaryPurple;
      case SpinnerVariant.secondary:
        return AppColors.secondaryPurple;
      case SpinnerVariant.white:
        return AppColors.primaryText;
      case SpinnerVariant.accent:
        return AppColors.logoOrangeStart;
    }
  }

  TextStyle _getMessageStyle() {
    switch (variant) {
      case SpinnerVariant.primary:
        return AppTypography.bodyMedium.copyWith(
          color: AppColors.primaryPurple,
        );
      case SpinnerVariant.secondary:
        return AppTypography.bodyMedium.copyWith(
          color: AppColors.secondaryPurple,
        );
      case SpinnerVariant.white:
        return AppTypography.bodyMedium.copyWith(color: AppColors.primaryText);
      case SpinnerVariant.accent:
        return AppTypography.bodyMedium.copyWith(
          color: AppColors.logoOrangeStart,
        );
    }
  }
}
