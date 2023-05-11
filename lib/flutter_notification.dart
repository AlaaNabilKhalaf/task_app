//
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// LocalNotificationService();
//
// final _localNotificationService = FlutterLocalNotificationsPlugin();
//
// Future<void> intialize() async {
//   tz.initializeTimeZones();
//
//   const AndroidInitializationSettings androidInitializationSettings =
//   AndroidInitializationSettings('ic_launcher');
//
//   const InitializationSettings settings = InitializationSettings(
//     android: androidInitializationSettings,
//   );
//   await _localNotificationService.initialize(
//     settings,
//   );
// }
//
// Future<NotificationDetails> _notificationDetails() async {
//   const AndroidNotificationDetails androidNotificationDetails =
//   AndroidNotificationDetails('my_channel_id','sending notifications',
//       channelDescription: 'description',
//       importance: Importance.max,
//       priority: Priority.max,
//       playSound: true);
//
//   return const NotificationDetails(
//     android: androidNotificationDetails,
//   );
// }
//
// Future<void> showNotification({
//   required int id,
//   required String title,
//   required String body,
// }) async {
//   final details = await _notificationDetails();
//   await _localNotificationService.show(id, title, body, details);
// }
//
// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
// Future<void> scheduleNotification({required int hour,required int minute,required int numOfDays}) async {
//   final details = await _notificationDetails();
//
//   await flutterLocalNotificationsPlugin.zonedSchedule(
//       0,      'It\'s time to log today\'s meals!',
//       'Click here',
//       _nextInstanceOfSevenThirty(hour: hour,minute: minute,numOfDay: numOfDays),
//       details,
//       uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
//       androidAllowWhileIdle: true
//   );
// }
// tz.TZDateTime _nextInstanceOfSevenThirty({required int hour,required int minute,required int numOfDay}) {
//   final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
//   tz.TZDateTime scheduledDate =
//   tz.TZDateTime(tz.local, now.year, now.month, now.day, 19, 30);
//   if (scheduledDate.isBefore(now)) {
//     scheduledDate = scheduledDate.add(const Duration(days: 1));
//   }
//   return scheduledDate;
// }