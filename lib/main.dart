// ignore_for_file: avoid_print

import "package:flutter/material.dart";
import "package:flutter_local_notifications/flutter_local_notifications.dart";
import 'package:flutter_local_notifications_platform_interface/flutter_local_notifications_platform_interface.dart';
import 'package:push_notification_testing/notification_services.dart';
import 'notification_services.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    notificationServices.initialiseNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("NOTIFICATION TESTING"),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: (() {
                  print("send Notification pressed");
                  notificationServices.sendNotification(
                      "this is title", "this is body");
                }),
                child: const Text("send notification"),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: (() {
                    print("Schedule notification pressed");
                    notificationServices.scheduleNotification(
                        "this is schedule notification", "this is body");
                  }),
                  child: const Text("Schedule notification")),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: (() {
                    print("Stop notification pressed");
                    notificationServices.stopNotifications();
                  }),
                  child: const Text("Stop Notification"))
            ],
          ),
        ),
      ),
    );
  }
}
