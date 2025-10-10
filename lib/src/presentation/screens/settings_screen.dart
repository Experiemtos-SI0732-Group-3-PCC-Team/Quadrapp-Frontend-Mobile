import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final VoidCallback? onBack;
  
  const SettingsScreen({Key? key, this.onBack}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Notification settings
  bool _reservationReminders = true;
  bool _offersAndPromotions = false;
  bool _appUpdates = true;
  
  // Preferences
  String _selectedLanguage = 'Español';
  String _selectedTheme = 'Claro';

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
          onPressed: () {
            if (widget.onBack != null) {
              widget.onBack!();
            } else {
              Navigator.pop(context);
            }
          },
        ),
        title: const Text(
          'Configuración',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Notifications Section
            const Text(
              'Notificaciones',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            
            _buildSwitchTile(
              title: 'Recordatorios de reserva',
              value: _reservationReminders,
              onChanged: (value) {
                setState(() {
                  _reservationReminders = value;
                });
                _showSnackBar('Recordatorios de reserva ${value ? 'activados' : 'desactivados'}');
              },
            ),
            
            const SizedBox(height: 12),
            
            _buildSwitchTile(
              title: 'Ofertas y promociones',
              value: _offersAndPromotions,
              onChanged: (value) {
                setState(() {
                  _offersAndPromotions = value;
                });
                _showSnackBar('Ofertas y promociones ${value ? 'activadas' : 'desactivadas'}');
              },
            ),
            
            const SizedBox(height: 12),
            
            _buildSwitchTile(
              title: 'Actualizaciones de la app',
              value: _appUpdates,
              onChanged: (value) {
                setState(() {
                  _appUpdates = value;
                });
                _showSnackBar('Actualizaciones de la app ${value ? 'activadas' : 'desactivadas'}');
              },
            ),
            
            const SizedBox(height: 32),
            
            // Preferences Section
            const Text(
              'Preferencias',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            
            _buildPreferenceTile(
              title: 'Idioma',
              value: _selectedLanguage,
              onTap: () => _showLanguageDialog(),
            ),
            
            const SizedBox(height: 12),
            
            _buildPreferenceTile(
              title: 'Tema',
              value: _selectedTheme,
              onTap: () => _showThemeDialog(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: const Color(0xFF7B3FF2),
            activeTrackColor: const Color(0xFF7B3FF2).withOpacity(0.3),
            inactiveThumbColor: Colors.grey[400],
            inactiveTrackColor: Colors.grey[300],
          ),
        ],
      ),
    );
  }

  Widget _buildPreferenceTile({
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            Row(
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                  size: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Seleccionar idioma'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildLanguageOption('Español'),
              _buildLanguageOption('English'),
              _buildLanguageOption('Français'),
              _buildLanguageOption('Português'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLanguageOption(String language) {
    return ListTile(
      title: Text(language),
      leading: Radio<String>(
        value: language,
        groupValue: _selectedLanguage,
        onChanged: (String? value) {
          setState(() {
            _selectedLanguage = value!;
          });
          Navigator.pop(context);
          _showSnackBar('Idioma cambiado a $language');
        },
        activeColor: const Color(0xFF7B3FF2),
      ),
      onTap: () {
        setState(() {
          _selectedLanguage = language;
        });
        Navigator.pop(context);
        _showSnackBar('Idioma cambiado a $language');
      },
    );
  }

  void _showThemeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Seleccionar tema'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildThemeOption('Claro'),
              _buildThemeOption('Oscuro'),
              _buildThemeOption('Automático'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildThemeOption(String theme) {
    return ListTile(
      title: Text(theme),
      leading: Radio<String>(
        value: theme,
        groupValue: _selectedTheme,
        onChanged: (String? value) {
          setState(() {
            _selectedTheme = value!;
          });
          Navigator.pop(context);
          _showSnackBar('Tema cambiado a $theme');
        },
        activeColor: const Color(0xFF7B3FF2),
      ),
      onTap: () {
        setState(() {
          _selectedTheme = theme;
        });
        Navigator.pop(context);
        _showSnackBar('Tema cambiado a $theme');
      },
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color(0xFF7B3FF2),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}