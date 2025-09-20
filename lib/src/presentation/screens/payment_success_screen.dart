import 'package:flutter/material.dart';

class PaymentSuccessScreen extends StatelessWidget {
  final VoidCallback? onGoHome;

  const PaymentSuccessScreen({Key? key, this.onGoHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFEAFBF2),
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(24),
                child: Icon(Icons.check, color: Color(0xFF34C759), size: 48),
              ),
              SizedBox(height: 32),
              Text(
                '¡Pago exitoso!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                'Tu reserva ha sido confirmada.\nRecibirás un email con los detalles.',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: onGoHome ?? () => Navigator.of(context).popUntil((route) => route.isFirst),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    side: BorderSide(color: Color(0xFFE9EAEE)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('Ir al inicio', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
