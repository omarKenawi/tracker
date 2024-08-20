import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tracker/firebase_options.dart';
import 'package:tracker/features/auth/screens/login_screen.dart';
import 'package:tracker/features/home/screens/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Expense Tracker',
          theme: ThemeData(
            useMaterial3: true,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const LoginScreen(),
            '/home': (context) => const HomeScreen(),
          },
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
