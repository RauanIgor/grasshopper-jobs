import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initialize() async {
    // Solicitar permissão para iOS
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('Usuário concedeu permissão');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print('Usuário concedeu permissão provisória');
    } else {
      print('Usuário não concedeu permissão');
    }

    // Configurar os handlers de mensagens
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Recebeu uma mensagem no primeiro plano: ${message.messageId}');
      if (message.notification != null) {
        print('A notificação contém um título: ${message.notification!.title}');
        print('A notificação contém um corpo: ${message.notification!.body}');
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Uma mensagem foi aberta: ${message.messageId}');
    });
  }

  Future<void> subscribeToTopic(String topic) async {
    await _firebaseMessaging.subscribeToTopic(topic);
    print('Inscrito no tópico $topic');
  }

  Future<void> unsubscribeFromTopic(String topic) async {
    await _firebaseMessaging.unsubscribeFromTopic(topic);
    print('Cancelou a inscrição no tópico $topic');
  }
}