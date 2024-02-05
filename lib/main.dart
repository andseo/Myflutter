import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import services to access SystemChrome
import 'screens/splash_screen.dart';

void main() {
  // Ensure that SystemChrome modifications are done before the app starts
  WidgetsFlutterBinding.ensureInitialized();
  // Set the status bar color
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xFF4a1f75), // Set any color you want here
    statusBarIconBrightness: Brightness.light, // Status bar icons' color (light for dark background)
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter WebView App',
      theme: ThemeData(
        primaryColor: Color(0xFF4a1f75),
        splashColor: Colors.transparent, // Disables ripple effect
        highlightColor: Colors.transparent, // Disables highlight effect
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Starting with the SplashScreen
    );
  }
}
