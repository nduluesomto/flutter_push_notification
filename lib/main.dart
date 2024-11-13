import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_push_notification/features/home/home.dart';
import 'package:flutter_push_notification/firebase_options.dart';

import 'core/api/firebase_api.dart';
import 'features/notification/notification_page.dart';

final navigationKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotification();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'пуш уведомлений',
      home: const HomePage(),
      navigatorKey: navigationKey,
      routes: {
        '/notification_screen': (context) => const NotificationPage(),
      },
    );
  }
}
