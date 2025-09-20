import 'package:flutter/material.dart';

class MyReservationsScreen extends StatefulWidget {
  final VoidCallback? onBack;
  final void Function(Map<String, dynamic> reserva)? onSelectReserva;
  const MyReservationsScreen({Key? key, this.onBack, this.onSelectReserva}) : super(key: key);

  @override
  State<MyReservationsScreen> createState() => _MyReservationsScreenState();
}

class _MyReservationsScreenState extends State<MyReservationsScreen> {
  int _tabIndex = 0;

  final List<Map<String, dynamic>> proximas = [
    {
      'nombre': 'Parking Centro',
      'fecha': 'Hoy 09:00-11:00',
      'estado': 'Activa',
    },
  ];
  final List<Map<String, dynamic>> pasadas = [
    {
      'nombre': 'Plaza Mayor',
      'fecha': 'Ayer 14:00-16:00',
      'estado': 'Completada',
    },
    {
      'nombre': 'Estación Norte',
      'fecha': '10 Dic 10:00-12:00',
      'estado': 'Completada',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('Mis reservas', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _tabIndex = 0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _tabIndex == 0 ? Color(0xFFF6F6FF) : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: _tabIndex == 0 ? Color(0xFF7B3FF2) : Color(0xFFF3F4F6), width: 2),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      alignment: Alignment.center,
                      child: Text('Próximas', style: TextStyle(fontWeight: FontWeight.bold, color: _tabIndex == 0 ? Color(0xFF7B3FF2) : Colors.black)),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _tabIndex = 1),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _tabIndex == 1 ? Color(0xFFF6F6FF) : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: _tabIndex == 1 ? Color(0xFF7B3FF2) : Color(0xFFF3F4F6), width: 2),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      alignment: Alignment.center,
                      child: Text('Pasadas', style: TextStyle(fontWeight: FontWeight.bold, color: _tabIndex == 1 ? Color(0xFF7B3FF2) : Colors.black)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              children: (_tabIndex == 0 ? proximas : pasadas).map((reserva) {
                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                  margin: const EdgeInsets.only(bottom: 16),
                  child: InkWell(
                    onTap: () {
                      if (widget.onSelectReserva != null) widget.onSelectReserva!(reserva);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(reserva['nombre'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: reserva['estado'] == 'Activa' ? Color(0xFFDFF6E3) : Color(0xFFF3F4F6),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                child: Text(
                                  reserva['estado'] == 'Activa' ? 'Activa' : 'Completada',
                                  style: TextStyle(
                                    color: reserva['estado'] == 'Activa' ? Color(0xFF4BB543) : Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(reserva['fecha'], style: TextStyle(color: Colors.black54)),
                          const SizedBox(height: 8),
                          Text('Ver detalles', style: TextStyle(color: Color(0xFF7B3FF2), fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
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
          if (index == 0 && widget.onBack != null) widget.onBack!();
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
