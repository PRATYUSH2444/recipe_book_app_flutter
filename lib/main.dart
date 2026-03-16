import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Recipe Book App",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }

}

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(
              Icons.restaurant_menu,
              size: 100,
              color: Colors.white,
            ),

            SizedBox(height: 20),

            Text(
              "Recipe Book App",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

          ],
        ),
      ),

    );
  }

}