import 'package:coffee_master/datamanager.dart';
import 'package:coffee_master/pages/offerspage.dart';
import 'package:flutter/material.dart';

import 'pages/menupage.dart';
import 'pages/orderpage.dart';

void main() {
  runApp(const MyApp());
}

class HelloWord extends StatelessWidget {
  const HelloWord({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Hello World");
  }
}

class Greet extends StatefulWidget {
  const Greet({super.key});

  @override
  State<Greet> createState() => _GreetState();
}

class _GreetState extends State<Greet> {
  // state variable 
  var name = "";

  @override
  Widget build(BuildContext context) {
    var greetStyle = const TextStyle(fontSize: 24);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text("Hello $name ", style: greetStyle),
              Text("???", style: greetStyle),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 19.0, left: 20.0),
          child: TextField(
            onChanged: (value) => setState(() {
              name = value;
            }),
          ),
        ),
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Masters',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        // Apply the colorScheme based on the primarySwatch
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.brown),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var dataManager = DataManager();
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget currentWidgetPage = const Text("!!!!!");
    
    switch(selectedIndex){
     case 0:
      currentWidgetPage =  MenuPage(dataManager: dataManager,);
      break;
     case 1:
      currentWidgetPage = const OffersPage();
      break;
     case 2:
      currentWidgetPage =  OrderPage(dataManager: dataManager,);
      break;
    }

    return Scaffold(
      appBar: AppBar(
        // Directly use the primary color for the AppBar
        backgroundColor: Theme.of(context).primaryColor,
        title: Image.asset("images/logo.png"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (newIndex){
          setState(() {
selectedIndex = newIndex;            
          });
        },
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.yellow.shade400,
        unselectedItemColor: Colors.brown.shade50,
        items:const [
        BottomNavigationBarItem(label: "Menu",icon: Icon(Icons.coffee)),
        BottomNavigationBarItem(label: "Offers",icon: Icon(Icons.local_offer)),
        BottomNavigationBarItem(label: "Order",icon: Icon(Icons.shopping_cart_checkout_outlined)),
      ]) ,
      body:
      currentWidgetPage,        
    );
  }
}
