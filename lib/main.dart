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
      backgroundColor: Colors.orange,

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

            SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );

              },
              child: Text("Enter App"),
            )

          ],
        ),
      ),

    );
  }

}

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Recipe Book"),
        backgroundColor: Colors.orange,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
              onPressed: () {},
              child: Text("All Recipes"),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {},
              child: Text("Add Recipe"),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {},
              child: Text("Categories"),
            ),

          ],
        ),
      ),

    );
  }

}


