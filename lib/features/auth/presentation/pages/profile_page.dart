import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/features/auth/domain/entities/user.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatelessWidget {
  final User user;

  ProfilePage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            SizedBox(height: 16),
            Text(
              user.name,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              user.email,
              style: GoogleFonts.lato(
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'XP: ${user.statistics['XP']}',
              style: GoogleFonts.lato(
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Lecciones Completadas: ${user.statistics['Lecciones Completadas']}',
              style: GoogleFonts.lato(
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Días Seguidos: ${user.statistics['Días Seguidos']}',
              style: GoogleFonts.lato(
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfilePage(user: user)),
                );
              },
              icon: Icon(Icons.edit),
              label: Text('Editar Perfil'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
