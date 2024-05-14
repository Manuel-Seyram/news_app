import 'dart:isolate';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Notifications {
  Notifications._();

  factory Notifications() => _instance;
  static final Notifications _instance = Notifications._();
  final AwesomeNotifications awesomeNotifications = AwesomeNotifications();
  static ReceivePort? receivePort;

  Future<void> configuration() async {
    if (kDebugMode) {
      print("Configuration  check");
    }
    await awesomeNotifications.initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic Notifications',
          channelDescription: 'Basic Instant Notification',
          defaultColor: Colors.teal,
          importance: NotificationImportance.High,
          channelShowBadge: true,
          channelGroupKey: 'basic_channel_group',
        ),
      ],
      debug: true,
    );
  }

  void checkingPermissionsNotification(BuildContext context) {
    AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Allow Notifications'),
            content:
                const Text('News app would like to send you notifications'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Don\'t Allow',
                  style: TextStyle(color: Colors.black, fontSize: 18.sp),
                ),
              ),
              TextButton(
                onPressed: () => AwesomeNotifications()
                    .requestPermissionToSendNotifications()
                    .then(
                  (value) {
                    Navigator.pop(context);
                  },
                ),
                child: Text(
                  'Allow',
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  //create instant notification
  Future<void> createInstantNotification() async {
    await awesomeNotifications.createNotification(
      content: NotificationContent(
          id: -1,
          channelKey: 'basic_channel',
          title: 'Welcome to News  App',
          body: '',
          notificationLayout: NotificationLayout.Default),
    );
  }

  //Notification listening event
  Future<void> startListeningNotificationEvents() async {
    print('Check data with start listening');
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: onActionReceivedMethod,
      onNotificationCreatedMethod: onNotificationCreatedMethod,
      onNotificationDisplayedMethod: onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: onDismissActionReceivedMethod,
    );
  }
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    if (kDebugMode) {
      print('On notification ');
    }
  }

  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    if (kDebugMode) {
      print('On notification created');
    }
  }

  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    if (kDebugMode) {
      print('On notification displayed');
    }
  }

  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    if (kDebugMode) {
      print('On notification dismissed');
    }
  }
}
