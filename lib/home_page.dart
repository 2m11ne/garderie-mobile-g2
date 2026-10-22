import 'package:flutter/material.dart';

const List<Map<String, dynamic>> menus = [
  {"id": 1, "titre": "Petit déjeuner", "description": "Lait, céréales et fruits", "icone": "🥣"},
  {"id": 2, "titre": "Déjeuner", "description": "Poulet, riz et légumes", "icone": "🍲"},
  {"id": 3, "titre": "Goûter", "description": "Biscuit et compote de pomme", "icone": "🍪"},
  {"id": 4, "titre": "Jus de fruits", "description": "Jus d'orange naturel", "icone": "🍊"},
  {"id": 5, "titre": "Fruits frais", "description": "Une sélection de fruits de saison", "icone": "🍎"},
];

const List<Color> iconBg = [
  Color(0xFFE8EAFB),
  Color(0xFFE6F4E6),
  Color(0xFFFCE4EC),
  Color(0xFFFFF4D6),
  Color(0xFFE6F4E6),
];

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
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: menus.length,
                itemBuilder: (context, i) {
                  final m = menus[i];
                  return Card(
                    color: Colors.white,
                    elevation: 1,
                    margin: const EdgeInsets.only(bottom: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      leading: Container(
                        width: 56,
                        height: 56,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: iconBg[i],
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text(m['icone'],
                            style: const TextStyle(fontSize: 28)),
                      ),
                      title: Text(
                        m['titre'],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: navy,
                            fontSize: 17),
                      ),
                      subtitle: Text(m['description']),
                      trailing:
                          const Icon(Icons.chevron_right, color: navy),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}