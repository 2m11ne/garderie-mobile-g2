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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const blue = Color(0xFF6C9EEF);
  static const navy = Color(0xFF1F2A5C);

  int _selected = 0;

  void _msg(String text) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(text), duration: const Duration(seconds: 2)),
      );
  }

  Widget _drawerItem(int index, IconData icon, String label) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      selected: _selected == index,
      selectedTileColor: const Color(0xFFE8EFFD),
      onTap: () {
        setState(() => _selected = index);
        Navigator.pop(context);
        _msg(label);
      },
    );
  }

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
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _msg('Rechercher un menu'),
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () => _msg('Aucune notification'),
          ),
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            children: [
              _drawerItem(0, Icons.home, 'Accueil'),
              _drawerItem(1, Icons.restaurant_menu, 'Menus'),
              _drawerItem(2, Icons.info_outline, 'À propos'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: blue,
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        onPressed: () => _msg('Ajouter un menu'),
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
                      onTap: () => _msg(m['titre']),
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