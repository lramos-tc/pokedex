import 'package:flutter/material.dart';
import 'package:pokedex/models/models.dart';
import 'package:pokedex/themes/app_theme.dart';
import 'package:pokedex/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Pokemon poke = ModalRoute.of(context)?.settings.arguments as Pokemon;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppBar(poke:poke),
          SliverList(
              delegate: SliverChildListDelegate([
            _SpriteDescription(),
            const SizedBox(
              height: 10,
            ),
            _Abilities(),
            _Abilities(),
            _Abilities(),
            _Abilities(),
            const Evolutions()
          ]))
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  final Pokemon poke;
   CustomAppBar({super.key, required this.poke});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppTheme.electric,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Container(
                color: AppTheme.electric.withOpacity(.5),
                child: Text(
                  "${poke.name} #0125",
                  style: TextStyle(fontSize: 26, color: AppTheme.contrast),
                ))),
        background: FadeInImage(
          placeholder: AssetImage("assets/pokemonholder.png"),
          image: NetworkImage(
             "https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png"),
        ),
      ),
    );
  }
}

class _SpriteDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const FadeInImage(
                  height: 150,
                  image: NetworkImage(
                      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png"),
                  placeholder: AssetImage("assets/pokemonholder.png"),
                ),
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    color: AppTheme.electric,
                    child: const Text("Electric"),
                  ))
            ],
          ),
          const SizedBox(
            width: 50,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: const [
              Text(
                "Mouse Pokémon",
                style: AppTheme.title,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "When several of\nthese POKéMON\ngather, their\u000celectricity could\nbuild and cause\nlightning storms.",
                style: TextStyle(fontSize: 15),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _Abilities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      child: Column(
        children: [
          const Text("Abilities", style: AppTheme.title),
          const SizedBox(height: 20),
          Row(children: const [
            Text(
              "Static",
              style: AppTheme.title,
            ),
          ]),
          const SizedBox(height: 10),
          const Text(
              "Whenever a move makes contact with this Pokémon, the move's user has a 30% chance of being paralyzed.\n\nPokémon that are immune to electric-type moves can still be paralyzed by this ability.\n\nOverworld: If the lead Pokémon has this ability, there is a 50% chance that encounters will be with an electric Pokémon, if applicable."),
          const SizedBox(height: 20),
          Row(
            children: const [
              Text("Lightning-rod", style: AppTheme.title),
              Icon(Icons.lock)
            ],
          ),
          const SizedBox(height: 10),
          const Text(
              "Does not affect non-damaging electric moves, i.e. thunder wave.  Increases the frequency of Match Call calls on the overworld if any party Pokémon has this ability.")
        ],
      ),
    );
  }
}
