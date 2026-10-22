import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const blue = Color(0xFF6C9EEF);
  static const navy = Color(0xFF1F2A5C);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Ma Garderie',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.notifications_none), onPressed: () {}),
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            children: const [
              ListTile(leading: Icon(Icons.home), title: Text('Accueil')),
              ListTile(
                  leading: Icon(Icons.restaurant_menu), title: Text('Menus')),
              ListTile(
                  leading: Icon(Icons.info_outline), title: Text('À propos')),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: blue,
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        onPressed: () {},
        child: const Icon(Icons.add, size: 32),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner (visible on the mockup)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFCE4EC),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: const [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bonjour !',
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: navy),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Quel plaisir de vous revoir\nà la garderie !',
                          style: TextStyle(color: navy),
                        ),
                      ],
                    ),
                  ),
                  Text('👧👦', style: TextStyle(fontSize: 44)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Icon(Icons.restaurant, color: blue, size: 28),
                SizedBox(width: 8),
                Text(
                  'Menus du jour',
                  style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold, color: navy),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}