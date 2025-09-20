import 'package:flutter/material.dart';

class ActiveReservationDetailScreen extends StatelessWidget {
  final String parkingName;
  final String space;
  final String endHour;
  final String remainingTime;
  final VoidCallback? onMap;
  final VoidCallback? onCancel;

  const ActiveReservationDetailScreen({
    Key? key,
    required this.parkingName,
    required this.space,
    required this.endHour,
    required this.remainingTime,
    this.onMap,
    this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('Reserva Activa', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const SizedBox(height: 32),
          Container(
            width: 140,
            height: 140,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 140,
                  height: 140,
                  child: CircularProgressIndicator(
                    value: 1.0,
                    strokeWidth: 8,
                    color: Color(0xFF34C759),
                    backgroundColor: Color(0xFFEAFBF2),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(remainingTime, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF34C759))),
                    SizedBox(height: 4),
                    Text('restante', style: TextStyle(fontSize: 16, color: Colors.black54)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Text(parkingName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          SizedBox(height: 8),
          Text('$space · Hasta $endHour', style: TextStyle(color: Colors.black54, fontSize: 16)),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: onMap,
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(color: Color(0xFFE9EAEE)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text('Ver en mapa', style: TextStyle(fontSize: 16)),
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: onCancel,
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(color: Color(0xFFFF3B30)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      foregroundColor: Color(0xFFFF3B30),
                    ),
                    child: Text('Cancelar reserva', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF7B3FF2),
        unselectedItemColor: Colors.grey,
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) Navigator.of(context).popUntil((route) => route.isFirst);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Reservas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
