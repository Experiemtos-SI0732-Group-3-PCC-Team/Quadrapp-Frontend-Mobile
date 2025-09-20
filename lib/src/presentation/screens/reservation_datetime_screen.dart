import 'package:flutter/material.dart';

class ReservationDateTimeScreen extends StatefulWidget {
  final void Function(String hour, int duration)? onNext;
  final VoidCallback? onBack;

  const ReservationDateTimeScreen({Key? key, this.onNext, this.onBack}) : super(key: key);

  @override
  State<ReservationDateTimeScreen> createState() => _ReservationDateTimeScreenState();
}

class _ReservationDateTimeScreenState extends State<ReservationDateTimeScreen> {
  final List<String> hours = ['09:00', '10:00', '11:00', '12:00', '13:00', '14:00'];
  int selectedHourIndex = 1;
  int duration = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: widget.onBack ?? () => Navigator.of(context).pop(),
        ),
        title: const Text('Seleccionar fecha y hora', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Fecha de entrada', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today, color: Color(0xFF7B3FF2)),
                  const SizedBox(width: 8),
                  const Text('Hoy, 15 de Marzo', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('Hora de entrada', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: List.generate(hours.length, (i) =>
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedHourIndex = i;
                    });
                  },
                  child: _HourChip(label: hours[i], selected: selectedHourIndex == i),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text('Duración', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                _DurationButton(
                  icon: Icons.remove,
                  onPressed: () {
                    setState(() {
                      if (duration > 1) duration--;
                    });
                  },
                ),
                const SizedBox(width: 16),
                Text('$duration horas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(width: 16),
                _DurationButton(
                  icon: Icons.add,
                  onPressed: () {
                    setState(() {
                      duration++;
                    });
                  },
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (widget.onNext != null) {
                    widget.onNext!(hours[selectedHourIndex], duration);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF7B3FF2),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('SIGUIENTE', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HourChip extends StatelessWidget {
  final String label;
  final bool selected;

  const _HourChip({required this.label, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: selected ? Color(0xFFD6C9F7) : Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(12),
        border: selected ? Border.all(color: Color(0xFF7B3FF2), width: 2) : null,
      ),
      child: Text(label, style: TextStyle(color: selected ? Color(0xFF7B3FF2) : Colors.black)),
    );
  }
}

class _DurationButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _DurationButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black),
        onPressed: onPressed,
      ),
    );
  }
}
