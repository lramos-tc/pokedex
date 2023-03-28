// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:pokedex/models/models.dart';

class CardScroll extends StatefulWidget {
  const CardScroll({super.key, required this.pokemons, required this.onSwipe});
  final List<Pokemon> pokemons;
  final Function onSwipe;

  @override
  State<CardScroll> createState() => _CardScrollState();
}

class _CardScrollState extends State<CardScroll> {
  final ScrollController scrollController = ScrollController();

  void detectSwipe() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        widget.onSwipe();
      }
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
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.vertical,
        itemCount: widget.pokemons.length,
        itemBuilder: (_, int index) {
          final pokemon = widget.pokemons[index];
          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: pokemon),
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
