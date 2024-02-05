import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WebView Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF4a1f75),
        splashColor: Colors.transparent, // Disables ripple effect
        highlightColor: Colors.transparent, // Disables highlight effect
      ),
      home: WebViewScreen(),
    );
  }
}



class WebViewScreen extends StatefulWidget {
  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  final String url = "https://noujoumart.com/";
  bool isLoading = true; // State variable for tracking loading state

  int _selectedIndex = 3;
  late WebViewController _controller;
  int _lastSelectedIndex = -1;



  @override
  void initState() {
    super.initState();
    // Set the status bar color and height
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF4a1f75), // Purple color
      statusBarIconBrightness: Brightness.light, // Set icon color to light
      statusBarBrightness: Brightness.dark,
      // Set status bar content to dark
    ));

  }


  void _injectJavaScriptToHideSections() {
    final String jsCode = """
    var element = document.getElementById('sec_41_0');
    if(element && element.classList.contains('qma-sec-innrs')) {
        element.style.display = 'none';
    }
    document.querySelectorAll('#sec_41_0 .qma-sec-innrs.row').forEach(function(child) {
        child.style.display = 'none';
    });
    document.getElementById('sec_89_2').style.display = 'none';
    document.getElementById('sec_14_3').style.display = 'none';
    document.getElementById('sec_75_4').style.display = 'none';
    document.getElementById('sec_68_5').style.display = 'none';
    document.getElementById('sec_38_6').style.display = 'none';
    document.getElementById('sec_11_7').style.display = 'none';
    document.getElementById('sec_61_8').style.display = 'none';
    document.getElementById('qma-footer').style.display = 'none';
  """;
    _controller.runJavascript(jsCode);
  }

  void _home() async {


    // JavaScript code to manipulate the DOM as needed
    final String jsCode = """
    var element = document.getElementById('sec_41_0');
    if (element && element.classList.contains('qma-sec-innrs')) {
      element.style.display = 'block';
    }
    document.querySelectorAll('#sec_41_0 .qma-sec-innrs.row').forEach(function(child) {
      child.style.display = 'block';
    });
    document.getElementById('sec_89_2').style.display = 'block';
    document.getElementById('sec_14_3').style.display = 'block';
    document.getElementById('sec_75_4').style.display = 'block';
    document.getElementById('sec_68_5').style.display = 'block';
    document.getElementById('sec_38_6').style.display = 'block';
    document.getElementById('sec_11_7').style.display = 'block';
    document.getElementById('sec_61_8').style.display = 'block';
    document.getElementById('qma-footer').style.display = 'block';
  """;

    // Run the JavaScript code
    if (jsCode.isNotEmpty) {
      _controller.runJavascript(jsCode);
    }
  }


  void _sport() {
    final String jsCode = """
    var element = document.getElementById('sec_41_0');
    if(element && element.classList.contains('qma-sec-innrs')) {
        element.style.display = 'none';
    }
    document.querySelectorAll('#sec_41_0 .qma-sec-innrs.row').forEach(function(child) {
        child.style.display = 'none';
    });
    document.getElementById('sec_21_1').style.display = 'none';
    document.getElementById('sec_75_4').style.display = 'none';
    document.getElementById('sec_89_2').style.display = 'none';
    document.getElementById('sec_68_5').style.display = 'none';
    document.getElementById('sec_38_6').style.display = 'none';
    document.getElementById('sec_11_7').style.display = 'none';
    document.getElementById('sec_61_8').style.display = 'none';
    document.getElementById('qma-footer').style.display = 'none';
  """;
    _controller.runJavascript(jsCode);
  }
  void _weather() {
    final String jsCode = """
    var element = document.getElementById('sec_41_0');
    if(element && element.classList.contains('qma-sec-innrs')) {
        element.style.display = 'none';
    }
    document.querySelectorAll('#sec_41_0 .qma-sec-innrs.row').forEach(function(child) {
        child.style.display = 'none';
    });
    document.getElementById('sec_21_1').style.display = 'none';
    document.getElementById('sec_75_4').style.display = 'none';
    document.getElementById('sec_89_2').style.display = 'none';
    document.getElementById('sec_14_3').style.display = 'none';
    document.getElementById('sec_38_6').style.display = 'none';
    document.getElementById('ap_widget_top-2').style.display = 'none';
    document.getElementById('block_21_5').style.display = 'none';
    document.getElementById('sec_11_7').style.display = 'none';
    document.getElementById('sec_61_8').style.display = 'none';
    document.getElementById('qma-footer').style.display = 'none';
  """;
    _controller.runJavascript(jsCode);
  }



  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
      isLoading = true; // Show loading indicator while processing
    });

    final String homeUrl = "https://noujoumart.com/";
    String currentUrl = await _controller.currentUrl() ?? "";
    Uri currentUri = Uri.parse(currentUrl);
    Uri homeUri = Uri.parse(homeUrl);

    // Normalize URLs to compare without query parameters or fragments
    String normalizedCurrentUrl = currentUri.origin + currentUri.path;
    String normalizedHomeUrl = homeUri.origin + homeUri.path;

    if (index == 0) { // Assuming the "Weather" button is at index 0
      if (normalizedCurrentUrl != normalizedHomeUrl) {
        await _controller.loadUrl(homeUrl);
        await Future.delayed(Duration(seconds: 1)); // Wait for page to load before scrolling
      }
      final String scrollToWeatherSectionJS = """
      (function() {
        const section = document.getElementById('sec_68_5');
        if (section) {
          section.scrollIntoView({ behavior: 'smooth' });
        }
      })();
    """;
      await _controller.runJavascript(scrollToWeatherSectionJS);
    } else if (index == 1) { // Assuming the "Sport" button is at index 1
      if (normalizedCurrentUrl != normalizedHomeUrl) {
        await _controller.loadUrl(homeUrl);
        await Future.delayed(Duration(seconds: 1)); // Wait for page to load before scrolling
      }
      final String scrollToSportSectionJS = """
      (function() {
        const section = document.getElementById('sec_14_3');
        if (section) {
          section.scrollIntoView({ behavior: 'smooth' });
        }
      })();
    """;
      await _controller.runJavascript(scrollToSportSectionJS);
    } else if (index == 2) { // Assuming the "Stars" button is at index 2
      if (normalizedCurrentUrl != normalizedHomeUrl) {
        await _controller.loadUrl(homeUrl);
        await Future.delayed(Duration(seconds: 1)); // Wait for page to load before scrolling
      }
      final String scrollToStarsSectionJS = """
      (function() {
        const section = document.getElementById('sec_21_1');
        if (section) {
          section.scrollIntoView({ behavior: 'smooth' });
        }
      })();
    """;
      await _controller.runJavascript(scrollToStarsSectionJS);
    } else if (index == 3) { // Assuming the "Home" button is at index 3
      if (normalizedCurrentUrl == normalizedHomeUrl) {
        await _controller.reload();
        final String scrollToTopJS = "window.scrollTo(0, 0);";
        await _controller.runJavascript(scrollToTopJS);
      } else {
        await _controller.loadUrl(homeUrl);
      }
    }

    setState(() {
      isLoading = false; // Hide loading indicator after processing
    });
  }



  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: topPadding),
            child: WebView(
              initialUrl: url,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller = webViewController;
              },
              onPageStarted: (String url) {
                setState(() {
                  isLoading = true;
                });
              },
              onPageFinished: (String url) {
                setState(() {
                  isLoading = false;
                });
                _handlePageFinished(url);
              },
              onWebResourceError: (WebResourceError error) {
                print("Web resource loading error: ${error.description}");
              },
              navigationDelegate: (NavigationRequest request) {
                return NavigationDecision.navigate;
              },
            ),
          ),
          if (isLoading)
            Positioned.fill(
              child: AnimatedOpacity(
                opacity: isLoading ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: PlaceholderWidget(),
              ),
            ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: buildBottomNavigationBar(),
          ),
        ],
      ),
    );
  }


  void _handlePageFinished(String url) {
    const String jsCode = """
    function overrideStyles() {
      var style = document.createElement('style');
      style.type = 'text/css';
      style.innerHTML = `
        * {
          -webkit-tap-highlight-color: rgba(0, 0, 0, 0) !important;
          -webkit-touch-callout: none !important;
          -webkit-user-select: none !important;
          -khtml-user-select: none !important;
          -moz-user-select: none !important;
          -ms-user-select: none !important;
          user-select: none !important;
          outline: none !important;
        }
        *::selection {
          background: transparent !important;
        }
        *::-moz-selection {
          background: transparent !important;
        }
        *::-webkit-selection {
          background: transparent !important;
        }
      `;
      document.head.appendChild(style);
    }
    // Apply styles initially
    overrideStyles();
    // Reapply styles every 500 milliseconds to combat any JavaScript that might be setting styles dynamically
    setInterval(overrideStyles, 500);
  """;
    _controller.runJavascript(jsCode).then((result) {
      print('CSS overrides for text selection applied.');
    }).catchError((error) {
      print('Error injecting CSS overrides for text selection: $error');
    });
  }





  Widget buildBottomNavigationBar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(17), // Rounded corners
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0.001, sigmaY: 0.001), // Increased blur effect
        child: Container(
          color: Color(0xFF4a1f75).withOpacity(0.9), // Adjust opacity for desired blur effect
          child: BottomNavigationBar(
            currentIndex: _selectedIndex, // Set in the state class
            onTap: _onItemTapped, // Implemented in the state class
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.wb_sunny),
                label: 'أحوال الطقس',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports_soccer),
                label: 'رياضة',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: 'نجوم و مشاهير',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'الرئيسية',
              ),
            ],
            backgroundColor: Colors.transparent, // Use a transparent background
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white, // White selected item color
            unselectedItemColor: Colors.white70, // White with transparency for unselected items
            showUnselectedLabels: true,
            selectedLabelStyle: TextStyle(
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,

            ),
            unselectedLabelStyle: TextStyle(
              fontFamily: 'Tajawal',
            ),
          ),
        ),
      ),
    );
  }



}
class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF4a1f75), // AppBar color
      height: 50,
      child: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: 120, // Adjust the size to fit your needs
          height: 40, // Adjust the size to fit your needs
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}


class PlaceholderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).padding.top;

    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            _CustomAppBar(), // Custom AppBar at the top
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30, bottom: 8),
                      height: 31,
                      width: 375,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      height: 220,
                      margin: EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 40,
                        width: 100,
                        margin: EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Container(
                      height: 70,
                      margin: EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      height: 70,
                      margin: EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      height: 70,
                      margin: EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      height: 70,
                      margin: EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      height: 70,
                      margin: EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}