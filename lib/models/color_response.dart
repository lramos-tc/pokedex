// To parse this JSON data, do
//
//     final color = colorFromJson(jsonString);

import 'dart:convert';

Color colorFromJson(String str) => Color.fromJson(json.decode(str));

String colorToJson(Color data) => json.encode(data.toJson());

class Color {
    Color({
        required this.id,
        required this.name,
        required this.names,
        required this.pokemonSpecies,
    });

    int id;
    String name;
    List<ColorName> names;
    List<PokemonSpecy> pokemonSpecies;

    factory Color.fromJson(Map<String, dynamic> json) => Color(
        id: json["id"],
        name: json["name"],
        names: List<ColorName>.from(json["names"].map((x) => ColorName.fromJson(x))),
        pokemonSpecies: List<PokemonSpecy>.from(json["pokemon_species"].map((x) => PokemonSpecy.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "names": List<dynamic>.from(names.map((x) => x.toJson())),
        "pokemon_species": List<dynamic>.from(pokemonSpecies.map((x) => x.toJson())),
    };
}

class ColorName {
    ColorName({
        required this.language,
        required this.name,
    });

    PokemonSpecy language;
    String name;

    factory ColorName.fromJson(Map<String, dynamic> json) => ColorName(
        language: PokemonSpecy.fromJson(json["language"]),
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "language": language.toJson(),
        "name": name,
    };
}

class PokemonSpecy {
    PokemonSpecy({
        required this.name,
        required this.url,
    });

    String name;
    String url;

    factory PokemonSpecy.fromJson(Map<String, dynamic> json) => PokemonSpecy(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}
