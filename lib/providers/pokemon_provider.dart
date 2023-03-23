// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/models/models.dart';

class PokemonListProvider extends ChangeNotifier {
  String baseurl = "pokeapi.co";
  List<Pokemon> onDisplayPokemon = [];

  PokemonListProvider() {
    print("Pokemon provider initialized");
  
    getOnDisplayPokemon();
    
  }

  getOnDisplayPokemon() async {
    int i = 1;
    while(i < 30){
    var url = Uri.https(baseurl, "api/v2/pokemon/$i");

    final response = await http.get(url);
    final pokemon = pokemonFromJson(response.body);


    onDisplayPokemon.add(pokemon);
    i++;
    }
    notifyListeners();
  }
}
