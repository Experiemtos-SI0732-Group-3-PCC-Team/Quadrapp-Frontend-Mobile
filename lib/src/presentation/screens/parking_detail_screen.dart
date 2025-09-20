import 'package:flutter/material.dart';

class ParkingDetailScreen extends StatelessWidget {
  final VoidCallback? onBack;
  final VoidCallback? onSelectDateTime;

  const ParkingDetailScreen({Key? key, this.onBack, this.onSelectDateTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: onBack ?? () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: double.infinity,
            color: const Color(0xFFE9EAEE),
            child: const Center(
              child: Icon(Icons.camera_alt_outlined, size: 48, color: Colors.black38),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Parking Centro Premium', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                const Text('Av. Principal 123, Centro', style: TextStyle(color: Colors.black54)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, color: Color(0xFFFFC107), size: 18),
                    const SizedBox(width: 4),
                    const Text('4.8', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 4),
                    const Text('(124 reseñas)', style: TextStyle(color: Colors.black54)),
                  ],
                ),
                const SizedBox(height: 16),
                const Text('Servicios', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _ServiceChip(icon: Icons.verified_user, label: 'Seguro'),
                    const SizedBox(width: 8),
                    _ServiceChip(icon: Icons.electric_bolt, label: 'Carga eléctrica'),
                    const SizedBox(width: 8),
                    _ServiceChip(icon: Icons.security, label: 'Vigilancia'),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    const Text('�15/hora', style: TextStyle(color: Color(0xFF7B3FF2), fontWeight: FontWeight.bold, fontSize: 22)),
                    const SizedBox(width: 16),
                    const Text('Disponible', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onSelectDateTime,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF7B3FF2),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Seleccionar fecha y hora', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ServiceChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ServiceChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.black38),
          const SizedBox(width: 4),
          Text(label, style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }
}
