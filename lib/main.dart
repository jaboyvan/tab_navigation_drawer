import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/calculator_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tab Navigation Drawer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tab Navigation Drawer'),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Text('Menu'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  _tabController.animateTo(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.calculate),
                title: Text('Calculator'),
                onTap: () {
                  _tabController.animateTo(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  _tabController.animateTo(2);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () {
                  _tabController.animateTo(3);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text('Notifications'),
                onTap: () {
                  _tabController.animateTo(4);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            HomeScreen(),
            CalculatorScreen(),
            SettingsScreen(),
            ProfileScreen(),
            NotificationsScreen(),
          ],
        ),
        bottomNavigationBar: Material(
          color: Colors.blue,
          child: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.calculate),
                text: 'Calculator',
              ),
              Tab(
                icon: Icon(Icons.settings),
                text: 'Settings',
              ),
              Tab(
                icon: Icon(Icons.person),
                text: 'Profile',
              ),
              Tab(
                icon: Icon(Icons.notifications),
                text: 'Notifications',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
