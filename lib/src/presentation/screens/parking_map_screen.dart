import 'package:flutter/material.dart';

class ParkingMapScreen extends StatelessWidget {
  final VoidCallback? onFinish;
  final String parkingName;
  final String space;
  final String remainingTime;

  const ParkingMapScreen({
    Key? key,
    this.onFinish,
    required this.parkingName,
    required this.space,
    required this.remainingTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('Reserva activa', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF6F6FF),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Color(0xFFE9EAEE)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(parkingName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFDFF6E3),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          child: Text('Pagada', style: TextStyle(color: Color(0xFF4BB543), fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Espacio:', style: TextStyle(color: Colors.black54)),
                        Text(space, style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tiempo restante:', style: TextStyle(color: Colors.black54)),
                        Text(remainingTime, style: TextStyle(color: Color(0xFF7B3FF2), fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              side: BorderSide(color: Color(0xFFE9EAEE)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text('Extender tiempo', style: TextStyle(fontSize: 15)),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: onFinish,
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              side: BorderSide(color: Color(0xFFE9EAEE)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text('Finalizar', style: TextStyle(fontSize: 15)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Color(0xFFF3F4F6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on, color: Color(0xFF7B3FF2), size: 48),
                  SizedBox(height: 8),
                  Text('Ubicación del parking', style: TextStyle(color: Colors.black54, fontSize: 16)),
                ],
              ),
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
          if (index == 0 && onFinish != null) onFinish!();
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
