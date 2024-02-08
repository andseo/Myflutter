import 'package:flutter/material.dart';
import 'webview_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _navigateToHome();

    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    _animationController.forward();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 5), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WebViewScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4a1f75), // Set the background color
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.png', // Replace 'assets/logo.png' with your logo image path
              width: 200, // Adjust the width as needed
              height: 200, // Adjust the height as needed
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: FadeTransition(
              opacity: _animation,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'كل ',
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.white, // Default text color
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'نجوم',
                      style: TextStyle(
                        color: Color(0xFFFFCA28), // Color for "نجوم"
                      ),
                    ),
                    TextSpan(
                      text: ' صوت وصورة',
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
