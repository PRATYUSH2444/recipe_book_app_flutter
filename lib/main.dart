import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
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

//////////////////////////////////////////////////////////////
/// SPLASH SCREEN
//////////////////////////////////////////////////////////////

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

            SizedBox(
              height: 20,
            ),

            Text(
              "Recipe Book App",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            SizedBox(
              height: 30,
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
              child: Text(
                "Enter App",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////
/// HOME SCREEN
//////////////////////////////////////////////////////////////

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Recipe Book",
        ),
        backgroundColor: Colors.orange,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "All Recipes",
              ),
            ),

            SizedBox(
              height: 20,
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddRecipeScreen(),
                  ),
                );
              },
              child: Text(
                "Add Recipe",
              ),
            ),

            SizedBox(
              height: 20,
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoriesScreen(),
                  ),
                );
              },
              child: Text(
                "Categories",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////
/// CATEGORIES SCREEN
//////////////////////////////////////////////////////////////

class CategoriesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> categories = const [
    {
      "name": "Indian",
      "icon": Icons.rice_bowl,
    },
    {
      "name": "Italian",
      "icon": Icons.local_pizza,
    },
    {
      "name": "Chinese",
      "icon": Icons.ramen_dining,
    },
    {
      "name": "Mexican",
      "icon": Icons.local_dining,
    },
    {
      "name": "Desserts",
      "icon": Icons.icecream,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Recipe Categories",
        ),
        backgroundColor: Colors.orange,
      ),

      body: Padding(
        padding: EdgeInsets.all(
          10,
        ),

        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),

          itemCount: categories.length,

          itemBuilder: (context, index) {
            return Card(
              elevation: 4,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Icon(
                    categories[index]["icon"],
                    size: 50,
                    color: Colors.orange,
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Text(
                    categories[index]["name"],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////
/// ADD RECIPE SCREEN
//////////////////////////////////////////////////////////////

class AddRecipeScreen extends StatefulWidget {
  @override
  _AddRecipeScreenState createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _formKey = GlobalKey<FormState>();

  String? selectedCategory;

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Recipe Added Successfully",
          ),
        ),
      );

      Navigator.pop(
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Recipe",
        ),
        backgroundColor: Colors.orange,
      ),

      body: Padding(
        padding: EdgeInsets.all(
          16,
        ),

        child: Form(
          key: _formKey,

          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Recipe Name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                value!.isEmpty ? "Enter recipe name" : null,
              ),

              SizedBox(
                height: 15,
              ),

              TextFormField(
                decoration: InputDecoration(
                  labelText: "Ingredients",
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
                validator: (value) =>
                value!.isEmpty ? "Enter ingredients" : null,
              ),

              SizedBox(
                height: 15,
              ),

              TextFormField(
                decoration: InputDecoration(
                  labelText: "Steps",
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) =>
                value!.isEmpty ? "Enter steps" : null,
              ),

              SizedBox(
                height: 15,
              ),

              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Category",
                  border: OutlineInputBorder(),
                ),
                items: [
                  "Indian",
                  "Italian",
                  "Chinese",
                  "Mexican",
                  "Desserts",
                ]
                    .map(
                      (c) => DropdownMenuItem(
                    value: c,
                    child: Text(
                      c,
                    ),
                  ),
                )
                    .toList(),

                onChanged: (value) {
                  selectedCategory = value;
                },

                validator: (value) =>
                value == null ? "Select category" : null,
              ),

              SizedBox(
                height: 15,
              ),

              TextFormField(
                decoration: InputDecoration(
                  labelText: "Time (mins)",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) =>
                value!.isEmpty ? "Enter time" : null,
              ),

              SizedBox(
                height: 25,
              ),

              ElevatedButton(
                onPressed: submitForm,
                child: Text(
                  "Submit",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}