import 'dart:ui';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:relosnews/Model/apiclass.dart';
import 'package:relosnews/firebase_options.dart';
import 'package:relosnews/view/Screen.dart';
import 'package:relosnews/viewmodel/hive.dart';
import 'package:rive/rive.dart';

@pragma('vm:entry-point')
Future<void> _backgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  print("Background Message: ${message.notification?.title}");
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await Hive.openBox("verified");
  await RiveNative.init();
  await GoogleSignIn.instance.initialize(
    serverClientId:"514608821242-32hkjoto0oot3641k8qgd7n00m8jo92u.apps.googleusercontent.com"
  );
  FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navkey=GlobalKey<NavigatorState>();
  late bool isverified;
  late List<Articles> articles;
  late int idx;

  @override
  void initState() {
    super.initState();
    isverified = hive().value();
    idx = hive().idx();
     initFCM();
  }

  @override
  void dispose() {
    hive().close();
    PaintingBinding.instance.imageCache.clear();
    PaintingBinding.instance.imageCache.clearLiveImages();
    super.dispose();
  }
  Future<void> initFCM() async {
      await FirebaseMessaging.instance.requestPermission();   // don't forget to add fcm background handler befor void main app

      FirebaseMessaging.onMessage.listen((message) {
        print("Foreground: ${message.notification?.title}");
      });

      FirebaseMessaging.onMessageOpenedApp.listen((message) {
        print("Background Click");
      });

      RemoteMessage? message =
      await FirebaseMessaging.instance.getInitialMessage();

      if (message != null) {
        //final screen = message.data['screen'];
        //   final newsId = message.data['news_id'];
        //
        //   if (screen == 'news_detail') {
        //     // NewsDetailScreen open karo
        //   }                                                         agar fcm se koi screen bhej rhe ho toh usme data and news id column ke liye yeh case hai

      }
    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navkey,
      debugShowCheckedModeBanner: false,
      home: Screen(isverified: isverified, idx: idx,),
    );
  }
}
