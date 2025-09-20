import 'package:flutter/material.dart';

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
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: onBack ?? () => Navigator.of(context).pop(),
        ),
        title: const Text('Métodos de pago', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          _CardWidget(
            brand: 'Visa',
            number: '1234',
            name: 'Juan Pérez',
            expiry: '12/25',
            gradient: LinearGradient(colors: [Color(0xFF7B3FF2), Color(0xFF3F8DF2)]),
          ),
          const SizedBox(height: 16),
          _CardWidget(
            brand: 'Mastercard',
            number: '5678',
            name: 'Juan Pérez',
            expiry: '08/26',
            gradient: LinearGradient(colors: [Color(0xFF7B3FF2), Color(0xFF3F8DF2)]),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.add, color: Color(0xFF7B3FF2)),
                label: Text('Agregar método de pago', style: TextStyle(fontSize: 16, color: Colors.black)),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  side: BorderSide(color: Color(0xFFE9EAEE)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CardWidget extends StatelessWidget {
  final String brand;
  final String number;
  final String name;
  final String expiry;
  final Gradient gradient;
  const _CardWidget({required this.brand, required this.number, required this.name, required this.expiry, required this.gradient});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(brand, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  Icon(Icons.menu, color: Colors.white),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text('•••• •••• •••• ', style: TextStyle(color: Colors.white, fontSize: 20)),
                  Text(number, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name, style: TextStyle(color: Colors.white)),
                  Text(expiry, style: TextStyle(color: Colors.white)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
