// ignore_for_file: avoid_print

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/models.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({super.key, required this.pokemons});
  final List<Pokemon> pokemons;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        scrollDirection: Axis.vertical,
        itemCount: pokemons.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.3,
        itemBuilder: (_, int index) {
          print(index);
          final pokemon = pokemons[index];
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: 'pokemon-instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage("assets/pokemonholder.png"),
                image: NetworkImage(pokemon
                    .sprites.other!.officialArtwork.frontDefault
                    .toString()),
                fit: BoxFit.contain,
              ),
            ),
          );
        },
      ),
    );
  }
}
