import 'package:flutter/material.dart';
import 'package:flutter_node_store/app_router.dart';
import 'package:flutter_node_store/themes/styles.dart';
import 'package:flutter_node_store/utils/utility.dart';

// Logger

// กำหนดตัวแปร initialRoute ให้กับ MateriaApp
var initialRoute;

void main() async {
  // Utility().testLogger();
  // testLogger();

  // ต้องเรียกฝช้ WidgetsFlutterBinding.ensureInitialized
  // เพื่อให้สามารภเรียกใช้ SharedPreferences ไดเ
  WidgetsFlutterBinding.ensureInitialized();

  // สร้างตัวแปร prefs เพื่อเรียกใช้ SharedPreferences
  // SharedPreferences prefs = await SharedPreferences.getInstance();

  // เรียกใช้ SharedPreferences
  await Utility.initSharedPrefs();

  // ตรวจสอบว่าเคยแสดง Intro แล้วหรือยัง
  if (Utility.getSharedPreference('loginStatus') == true) {
    initialRoute = AppRouter.dashboard;
  } else if (Utility.getSharedPreference('welcomeStatus') == true) {
    // ถ้าเคยแสดง Intro แล้ว ให้ไปยังหน้า Login
    initialRoute = AppRouter.login;
  } else {
    // ถ้ายังไม่เคยแสดง Intro ให้ไปยังหน้า Welcome
    initialRoute = AppRouter.welcome;
  }

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: initialRoute,
      routes: AppRouter.routes,
    );
  }
}
