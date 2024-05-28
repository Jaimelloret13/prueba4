import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/features/auth/domain/entities/user.dart';
import '/features/auth/presentation/pages/exercise_page.dart';
import '/features/auth/presentation/pages/documentation_page.dart';
import '/features/auth/presentation/pages/profile_page.dart';

class MainLobbyPage extends StatelessWidget {
  final User user;

  MainLobbyPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido, ${user.name}'),
        backgroundColor: Colors.blue,
      ),
      drawer: _buildDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 3 / 2, // Ajusta esta proporción para hacer los botones más pequeños
          children: [
            _buildCard(
              context,
              title: 'Lecciones',
              svgPath: 'assets/icons/lessons.svg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExercisePage(user: user)),
                );
              },
            ),
            _buildCard(
              context,
              title: 'Documentación',
              svgPath: 'assets/icons/documentation.svg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DocumentationPage()),
                );
              },
            ),
            _buildCard(
              context,
              title: 'Videos',
              svgPath: 'assets/icons/videos.svg',
              onTap: () {
                // Implementa la navegación a la página de videos
              },
            ),
            _buildCard(
              context,
              title: 'Leaderboard',
              svgPath: 'assets/images/svg/online_learning.svg',
              onTap: () {
                // Implementa la navegación a la página de leaderboard
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, {required String title, required String svgPath, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0), // Ajusta el padding para hacer los botones más pequeños
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svgPath,
                width: 36, // Ajusta el tamaño del icono para hacerlo más pequeño
                height: 36,
              ),
              SizedBox(height: 8), // Ajusta el espacio entre el icono y el texto
              Text(
                title,
                style: TextStyle(
                  fontSize: 14, // Ajusta el tamaño de la fuente
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'CodeLingo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Inicio'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Perfil'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage(user: user)),
              );
            },
          ),
          // Agrega más opciones según sea necesario
        ],
      ),
    );
  }
}
