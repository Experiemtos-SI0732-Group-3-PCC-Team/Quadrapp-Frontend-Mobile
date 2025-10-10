import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final VoidCallback? onBack;
  final VoidCallback? onEditProfile;
  final VoidCallback? onPaymentMethods;
  final VoidCallback? onSettings;
  final VoidCallback? onNotifications;
  const ProfileScreen({
    Key? key, 
    this.onBack, 
    this.onEditProfile,
    this.onPaymentMethods,
    this.onSettings,
    this.onNotifications,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('Perfil', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const SizedBox(height: 32),
          CircleAvatar(
            radius: 32,
            backgroundColor: Color(0xFFF6F6FF),
            child: Icon(Icons.person, color: Color(0xFF7B3FF2), size: 40),
          ),
          const SizedBox(height: 16),
          const Text('Juan Pérez', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 4),
          const Text('juan@email.com', style: TextStyle(color: Colors.black54)),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                _ProfileCard(
                  icon: Icons.person_outline,
                  title: 'Datos personales',
                  subtitle: 'Editar información',
                  onTap: onEditProfile,
                ),
                SizedBox(height: 12),
                _ProfileCard(
                  icon: Icons.credit_card,
                  title: 'Métodos de pago',
                  subtitle: 'Tarjetas guardadas',
                  onTap: onPaymentMethods,
                ),
                SizedBox(height: 12),
                _ProfileCard(
                  icon: Icons.notifications_none,
                  title: 'Notificaciones',
                  subtitle: 'Visualizar Notificaciones',
                  onTap: onNotifications,
                ),
                SizedBox(height: 12),
                _ProfileCard(
                  icon: Icons.settings,
                  title: 'Configuración',
                  subtitle: 'Preferencias de la app',
                  onTap: onSettings,
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
        currentIndex: 3,
        onTap: (index) {
          if (index == 0 && onBack != null) onBack!();
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

class _ProfileCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  const _ProfileCard({required this.icon, required this.title, required this.subtitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0,
      child: ListTile(
        leading: Icon(icon, color: Color(0xFF7B3FF2)),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.chevron_right, color: Colors.black38),
        onTap: onTap,
      ),
    );
  }
}
