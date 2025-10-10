import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  final VoidCallback? onBack;
  
  const NotificationsScreen({Key? key, this.onBack}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<NotificationItem> notifications = [
    NotificationItem(
      title: 'Reserva confirmada',
      description: 'Tu reserva para hoy a las 10:00 está confirmada',
      time: 'Hace 2h',
      type: NotificationType.confirmation,
      isRead: false,
    ),
    NotificationItem(
      title: 'Recordatorio',
      description: 'Tu reserva comienza en 30 minutos',
      time: 'Hace 4h',
      type: NotificationType.reminder,
      isRead: false,
    ),
    NotificationItem(
      title: 'Oferta especial',
      description: '20% de descuento en tu próxima reserva',
      time: 'Ayer',
      type: NotificationType.offer,
      isRead: false,
    ),
  ];

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
          'Notificaciones',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          TextButton(
            onPressed: _markAllAsRead,
            child: const Text(
              'Marcar todas',
              style: TextStyle(
                color: Color(0xFF7B3FF2),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      body: notifications.isEmpty
          ? _buildEmptyState()
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: notifications.length,
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                color: Colors.grey,
                thickness: 0.3,
              ),
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return _buildNotificationTile(notification, index);
              },
            ),
    );
  }

  Widget _buildNotificationTile(NotificationItem notification, int index) {
    return Dismissible(
      key: Key('notification_$index'),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.red,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 24,
        ),
      ),
      onDismissed: (direction) {
        _deleteNotification(index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
        child: InkWell(
          onTap: () => _markAsRead(index),
          borderRadius: BorderRadius.circular(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Notification indicator dot
              Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.only(top: 8, right: 12),
                decoration: BoxDecoration(
                  color: notification.isRead 
                      ? Colors.grey.shade400 
                      : const Color(0xFF7B3FF2),
                  shape: BoxShape.circle,
                ),
              ),
              
              // Notification content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: notification.isRead 
                            ? FontWeight.w500 
                            : FontWeight.bold,
                        color: notification.isRead 
                            ? Colors.grey.shade700 
                            : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      notification.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: notification.isRead 
                            ? Colors.grey.shade600 
                            : Colors.grey.shade800,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      notification.time,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Options menu
              IconButton(
                onPressed: () => _showNotificationOptions(index),
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.grey.shade400,
                  size: 20,
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_none_outlined,
            size: 80,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            'No tienes notificaciones',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Te notificaremos sobre tus reservas\ny ofertas especiales',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade500,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  void _markAsRead(int index) {
    setState(() {
      notifications[index].isRead = true;
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Notificación marcada como leída'),
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

  void _markAllAsRead() {
    setState(() {
      for (var notification in notifications) {
        notification.isRead = true;
      }
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Todas las notificaciones marcadas como leídas'),
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

  void _deleteNotification(int index) {
    final deletedNotification = notifications[index];
    setState(() {
      notifications.removeAt(index);
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Notificación eliminada'),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        action: SnackBarAction(
          label: 'Deshacer',
          textColor: Colors.white,
          onPressed: () {
            setState(() {
              notifications.insert(index, deletedNotification);
            });
          },
        ),
      ),
    );
  }

  void _showNotificationOptions(int index) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: Icon(
                  notifications[index].isRead 
                      ? Icons.mark_as_unread 
                      : Icons.mark_email_read,
                  color: const Color(0xFF7B3FF2),
                ),
                title: Text(
                  notifications[index].isRead 
                      ? 'Marcar como no leída' 
                      : 'Marcar como leída',
                ),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    notifications[index].isRead = !notifications[index].isRead;
                  });
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ),
                title: const Text(
                  'Eliminar notificación',
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _deleteNotification(index);
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}

class NotificationItem {
  String title;
  String description;
  String time;
  NotificationType type;
  bool isRead;

  NotificationItem({
    required this.title,
    required this.description,
    required this.time,
    required this.type,
    this.isRead = false,
  });
}

enum NotificationType {
  confirmation,
  reminder,
  offer,
  general,
}