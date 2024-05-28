import 'package:flutter/material.dart';
import '/features/auth/domain/entities/user.dart';

class LeaderboardPage extends StatelessWidget {
  final User user;

  LeaderboardPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard'),
      ),
      body: Center(
        child: Text('Página de Leaderboard'),
      ),
    );
  }
}
