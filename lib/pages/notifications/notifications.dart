import 'package:flutter/material.dart' hide Notification;

import '../../models/notification.dart';
import '../../mocks/notifications.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, i) {
          Notification notif = notifications[i];
          return Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.notifications,
                    color: Color(0xff47ABFF),
                  ),
                  title: Text('${notif.from} ${notif.subject}'),
                  subtitle: Text(notif.dateTime),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
