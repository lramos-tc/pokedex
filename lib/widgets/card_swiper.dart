// ignore_for_file: avoid_print

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/models.dart';

class CardSwiper extends StatefulWidget {
  const CardSwiper({super.key, required this.pokemons});
  final List<Pokemon> pokemons;

  @override
  State<CardSwiper> createState() => _CardSwiperState();
}

class _CardSwiperState extends State<CardSwiper> {
  final SwiperController swipeController = SwiperController();

  @override
  void initState() {
    super.initState();
    swipeController.addListener(() {
      print(swipeController.next());
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        controller: swipeController,
        scrollDirection: Axis.vertical,
        itemCount: widget.pokemons.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.3,
        itemBuilder: (_, int index) {
          final pokemon = widget.pokemons[index];
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: pokemon),
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
