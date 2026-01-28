import 'package:flutter/material.dart';
import 'package:supabase_app_demo/screens/notes_screen.dart';
import 'package:supabase_app_demo/screens/splash_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://uoubpvmvgtbodokthvmr.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVvdWJwdm12Z3Rib2Rva3Rodm1yIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk0ODMxNjcsImV4cCI6MjA4NTA1OTE2N30.Ezwcsw8QPGMPK_WIEytrM5AkbBOGpZsLpBWFjqjD8C4',
  );

  supabase.auth.onAuthStateChange.listen((data) {
    final session = data.session;

    if (session != null) {
      navigatorKey.currentState?.pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => NotesScreen()),
            (route) => false,
      );
    }
  });
  
  runApp(MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: SplashScreen(),
    );
  }
}
