import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_push_notification/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseApi {
  //Instance для Firebase
  final _firebaseMessaging = FirebaseMessaging.instance;
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  //Инициализация уведомлений
  Future<void> initNotification() async {
    //запросить разрешение пользователя
    await _firebaseMessaging.requestPermission();

    //извлеките облачный токен Firebase для этого устройства
    final firebaseTokenAndroid = await _firebaseMessaging.getToken();
    //final firebaseMessageTokenIOS = await _firebaseMessaging.getAPNSToken();

    print('Token: $firebaseTokenAndroid');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('firebaseTokenAndroid', firebaseTokenAndroid ?? '');

    initPushNotification();
  }

//Обработка полученных сообщений
  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    //navigate to Notification Page
    navigationKey.currentState?.pushNamed(
      '/notification_screen',
      arguments: message,
    );
  }

//Инициализация настроек переднего плана/фона
  Future initPushNotification() async {
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    //Прослушиватели событий, когда уведомление открывает приложение
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
