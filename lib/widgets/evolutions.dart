import 'package:flutter/material.dart';
import 'package:pokedex/themes/themes.dart';

class Evolutions extends StatelessWidget {
  const Evolutions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, int index) => _EvoStep(),
      ),
    );
  }
}

class _EvoStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 200,
      height: 100,
      child: Column(
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(10),child: const FadeInImage(fit:BoxFit.cover,height: 170,width: 200,placeholder: AssetImage("assets/pokemonholder.png"),image: NetworkImage("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/26.png"),),),
          const Text("Raichu",style:AppTheme.title),
        ],
      ),

    );
  }
}
