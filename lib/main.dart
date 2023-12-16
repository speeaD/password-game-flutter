import 'package:flutter/material.dart';
import 'package:side_project/providers/game_provider.dart';
import 'package:side_project/screens/game_screen.dart';
import 'package:provider/provider.dart';
import 'package:side_project/services/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GameProvider()),
      ],
      child: const MaterialApp(
        home: GameScreen(),
      ),
    );
  }
}
