// To parse this JSON data, do
//
//     final type = typeFromJson(jsonString);

import 'dart:convert';

PokemonType typeFromJson(String str) => PokemonType.fromJson(json.decode(str));

String typeToJson(PokemonType data) => json.encode(data.toJson());

class PokemonType {
  PokemonType({
    required this.damageRelations,
    required this.gameIndices,
    required this.generation,
    required this.id,
    this.moveDamageClass,
    required this.moves,
    required this.name,
    required this.names,
    required this.pastDamageRelations,
    required this.pokemon,
  });

  DamageRelations damageRelations;
  List<GameIndex> gameIndices;
  Generation generation;
  int id;
  Generation? moveDamageClass;
  List<Generation> moves;
  String name;
  List<Name> names;
  List<dynamic> pastDamageRelations;
  List<Pokemon> pokemon;

  factory PokemonType.fromJson(Map<String, dynamic> json) => PokemonType(
        damageRelations: DamageRelations.fromJson(json["damage_relations"]),
        gameIndices: List<GameIndex>.from(
            json["game_indices"].map((x) => GameIndex.fromJson(x))),
        generation: Generation.fromJson(json["generation"]),
        id: json["id"],
        moveDamageClass: json["move_damage_class"] == null ? null : Generation.fromJson(json["move_damage_class"]),
        moves: List<Generation>.from(
            json["moves"].map((x) => Generation.fromJson(x))),
        name: json["name"],
        names: List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
        pastDamageRelations:
            List<dynamic>.from(json["past_damage_relations"].map((x) => x)),
        pokemon:
            List<Pokemon>.from(json["pokemon"].map((x) => Pokemon.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "damage_relations": damageRelations.toJson(),
        "game_indices": List<dynamic>.from(gameIndices.map((x) => x.toJson())),
        "generation": generation.toJson(),
        "id": id,
        "move_damage_class": moveDamageClass?.toJson(),
        "moves": List<dynamic>.from(moves.map((x) => x.toJson())),
        "name": name,
        "names": List<dynamic>.from(names.map((x) => x.toJson())),
        "past_damage_relations":
            List<dynamic>.from(pastDamageRelations.map((x) => x)),
        "pokemon": List<dynamic>.from(pokemon.map((x) => x.toJson())),
      };
}

class DamageRelations {
  DamageRelations({
    required this.doubleDamageFrom,
    required this.doubleDamageTo,
    required this.halfDamageFrom,
    required this.halfDamageTo,
    required this.noDamageFrom,
    required this.noDamageTo,
  });

  List<Generation> doubleDamageFrom;
  List<dynamic> doubleDamageTo;
  List<dynamic> halfDamageFrom;
  List<Generation> halfDamageTo;
  List<Generation> noDamageFrom;
  List<Generation> noDamageTo;

  factory DamageRelations.fromJson(Map<String, dynamic> json) =>
      DamageRelations(
        doubleDamageFrom: List<Generation>.from(
            json["double_damage_from"].map((x) => Generation.fromJson(x))),
        doubleDamageTo:
            List<dynamic>.from(json["double_damage_to"].map((x) => x)),
        halfDamageFrom:
            List<dynamic>.from(json["half_damage_from"].map((x) => x)),
        halfDamageTo: List<Generation>.from(
            json["half_damage_to"].map((x) => Generation.fromJson(x))),
        noDamageFrom: List<Generation>.from(
            json["no_damage_from"].map((x) => Generation.fromJson(x))),
        noDamageTo: List<Generation>.from(
            json["no_damage_to"].map((x) => Generation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "double_damage_from":
            List<dynamic>.from(doubleDamageFrom.map((x) => x.toJson())),
        "double_damage_to": List<dynamic>.from(doubleDamageTo.map((x) => x)),
        "half_damage_from": List<dynamic>.from(halfDamageFrom.map((x) => x)),
        "half_damage_to":
            List<dynamic>.from(halfDamageTo.map((x) => x.toJson())),
        "no_damage_from":
            List<dynamic>.from(noDamageFrom.map((x) => x.toJson())),
        "no_damage_to": List<dynamic>.from(noDamageTo.map((x) => x.toJson())),
      };
}

class Generation {
  Generation({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Generation.fromJson(Map<String, dynamic> json) => Generation(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class GameIndex {
  GameIndex({
    required this.gameIndex,
    required this.generation,
  });

  int gameIndex;
  Generation generation;

  factory GameIndex.fromJson(Map<String, dynamic> json) => GameIndex(
        gameIndex: json["game_index"],
        generation: Generation.fromJson(json["generation"]),
      );

  Map<String, dynamic> toJson() => {
        "game_index": gameIndex,
        "generation": generation.toJson(),
      };
}

class Name {
  Name({
    required this.language,
    required this.name,
  });

  Generation language;
  String name;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        language: Generation.fromJson(json["language"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "language": language.toJson(),
        "name": name,
      };
}

class Pokemon {
  Pokemon({
    required this.pokemon,
    required this.slot,
  });

  Generation pokemon;
  int slot;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        pokemon: Generation.fromJson(json["pokemon"]),
        slot: json["slot"],
      );

  Map<String, dynamic> toJson() => {
        "pokemon": pokemon.toJson(),
        "slot": slot,
      };
}
