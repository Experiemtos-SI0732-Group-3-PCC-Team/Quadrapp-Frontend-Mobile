import 'package:flutter/material.dart';

class SearchResultsScreen extends StatelessWidget {
  final VoidCallback? onBack;
  final VoidCallback? onShowParkingDetail;

  const SearchResultsScreen({Key? key, this.onBack, this.onShowParkingDetail}) : super(key: key);

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
        title: const Text('Resultados cerca de ti', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _ParkingCard(
            name: 'Parking Centro 1',
            address: 'Av. Principal 123',
            rating: 4.4,
            time: '2 min',
            price: '�15/hora',
            status: 'Confirmada',
            statusColor: Color(0xFFD6C9F7),
            statusTextColor: Color(0xFF7B3FF2),
            onShowParkingDetail: onShowParkingDetail,
          ),
          const SizedBox(height: 16),
          _ParkingCard(
            name: 'Parking Centro 2',
            address: 'Av. Principal 123',
            rating: 4.5,
            time: '2 min',
            price: '�15/hora',
            status: 'Pagada',
            statusColor: Color(0xFFD6F7E2),
            statusTextColor: Color(0xFF2ECC40),
            onShowParkingDetail: onShowParkingDetail,
          ),
          const SizedBox(height: 16),
          _ParkingCard(
            name: 'Parking Centro 3',
            address: 'Av. Principal 123',
            rating: 4.6,
            time: '2 min',
            price: '�15/hora',
            status: 'Pendiente',
            statusColor: Color(0xFFD6EAF7),
            statusTextColor: Color(0xFF3498DB),
            onShowParkingDetail: onShowParkingDetail,
          ),
        ],
      ),
    );
  }
}

class _ParkingCard extends StatelessWidget {
  final String name;
  final String address;
  final double rating;
  final String time;
  final String price;
  final String status;
  final Color statusColor;
  final Color statusTextColor;
  final VoidCallback? onShowParkingDetail;

  const _ParkingCard({
    required this.name,
    required this.address,
    required this.rating,
    required this.time,
    required this.price,
    required this.status,
    required this.statusColor,
    required this.statusTextColor,
    this.onShowParkingDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(status, style: TextStyle(color: statusTextColor, fontWeight: FontWeight.w600)),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(address, style: TextStyle(color: Colors.black54)),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.star, color: Color(0xFFFFC107), size: 18),
                const SizedBox(width: 4),
                Text(rating.toString()),
                const SizedBox(width: 16),
                Icon(Icons.access_time, color: Colors.black38, size: 18),
                const SizedBox(width: 4),
                Text(time),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(price, style: TextStyle(color: Color(0xFF7B3FF2), fontWeight: FontWeight.bold, fontSize: 18)),
                OutlinedButton(
                  onPressed: onShowParkingDetail,
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Ver detalles'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
