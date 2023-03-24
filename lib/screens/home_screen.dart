// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:pokedex/providers/pokemon_provider.dart';
import 'package:pokedex/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../themes/themes.dart';
import 'package:pokedex/router/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemonProvider = Provider.of<PokemonListProvider>(context);
    final menuOptions = AppRoutes.menuOptions;
    final pokemonTypeProvider = Provider.of<PokemonTypeProvider>(context);
    final pokemonColorProvider = Provider.of<PokemonColorProvider>(context);

    
    return Scaffold(
      drawer: Drawer(
        backgroundColor: AppTheme.deep,
        child: ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, menuOptions[index].route);
                  },
                  title: Text(style: AppTheme.menu, menuOptions[index].name),
                  trailing:
                      Icon(menuOptions[index].icon, color: AppTheme.contrast),
                ),
            separatorBuilder: (context, index) =>
                const Divider(color: Colors.black),
            itemCount: menuOptions.length),
      ),
      appBar: AppBar(
        title: const Center(child: Text("Pokedex")),
        actions: const [
          IconButton(onPressed: null, icon: Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(

        child: Column(children: [
          CardSwiper(
              pokemons: pokemonProvider.onDisplayPokemon,
          ),
          FilterSlider(
            title: "Pokemon Type",
            filters: pokemonTypeProvider.existingType,
          ),
          FilterSlider(
            title: "Pokemon Color",
            filters: pokemonColorProvider.pokeByColor,
          )
        ]),
      ),
    );
  }
}
