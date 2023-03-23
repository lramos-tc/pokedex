import 'package:flutter/material.dart';
import 'package:pokedex/providers/pokemon_provider.dart';
import 'package:pokedex/screens/screens.dart';
import 'package:pokedex/themes/themes.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

int i = 1;

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
  
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PokemonListProvider(),
          lazy: false,
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      initialRoute: "home",
      routes: {
        "home": (_) => const HomeScreen(),
        "details": (_) => const DetailsScreen(),
      },
      theme: AppTheme.lightTheme,
    );
  }
}
