import 'package:flutter/material.dart';
import 'add_payment_method_screen.dart';

class PaymentMethodsScreen extends StatelessWidget {
  final VoidCallback? onBack;
  const PaymentMethodsScreen({Key? key, this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: onBack ?? () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Métodos de pago',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 8),
            
            // Visa Card
            _PaymentCard(
              brand: 'Visa',
              lastFourDigits: '1234',
              holderName: 'Juan Pérez',
              expiryDate: '12/25',
              gradientColors: const [Color(0xFF6366F1), Color(0xFF8B5CF6)],
            ),
            
            const SizedBox(height: 16),
            
            // Mastercard
            _PaymentCard(
              brand: 'Mastercard',
              lastFourDigits: '5678',
              holderName: 'Juan Pérez',
              expiryDate: '08/26',
              gradientColors: const [Color(0xFF6366F1), Color(0xFF8B5CF6)],
            ),
            
            const SizedBox(height: 24),
            
            // Add Payment Method Button
            Container(
              width: double.infinity,
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300, width: 1.5),
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: InkWell(
                onTap: () {
                  // Navigate to add payment method screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddPaymentMethodScreen(
                        onBack: () => Navigator.pop(context),
                      ),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(
                          color: Color(0xFF7B3FF2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Agregar método de pago',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentCard extends StatelessWidget {
  final String brand;
  final String lastFourDigits;
  final String holderName;
  final String expiryDate;
  final List<Color> gradientColors;

  const _PaymentCard({
    required this.brand,
    required this.lastFourDigits,
    required this.holderName,
    required this.expiryDate,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Brand and menu icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  brand,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                  size: 24,
                ),
              ],
            ),
            
            const SizedBox(height: 8),
            
            // Card number
            Text(
              '•••• •••• •••• $lastFourDigits',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                letterSpacing: 2.0,
              ),
            ),
            
            const SizedBox(height: 8),
            
            // Holder name and expiry date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  holderName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  expiryDate,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
