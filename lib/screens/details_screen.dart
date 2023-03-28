import 'package:flutter/material.dart';
import 'package:pokedex/models/models.dart' as poket;
import 'package:pokedex/themes/app_theme.dart';
import 'package:pokedex/widgets/widgets.dart';

late Color type;

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final poket.Pokemon poke =
        ModalRoute.of(context)?.settings.arguments as poket.Pokemon;

    String ability = poke.abilities[0].ability.name;
    String? ability2;
    bool? ability2H;
    String? ability3;
    bool? ability3H;
    switch (poke.abilities.length) {
      case (2):
        ability2 = poke.abilities[1].ability.name;
        ability2H = poke.abilities[1].isHidden;
        break;
      case (3):
        ability2 = poke.abilities[1].ability.name;
        ability2H = poke.abilities[1].isHidden;
        ability3 = poke.abilities[2].ability.name;
        ability3H = poke.abilities[2].isHidden;
        break;
    }
    setState(() {});

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppBar(poke: poke),
          SliverList(
              delegate: SliverChildListDelegate([
            _SpriteDescription(
                sprite: poke.sprites.frontDefault,
                firstType: poke.types[0].type.name,
                genus: poke.speciesData.genera[7].genus,
                description: poke.speciesData.flavorTextEntries
                    .firstWhere((x) => x.language.name == "en")
                    .flavorText),
            const SizedBox(
              height: 10,
            ),
            _Abilities(
              ability: ability,
              ability2: ability2,
              ability2H: ability2H,
              ability3: ability3,
              ability3H: ability3H,
            ),
            const Evolutions()
          ]))
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  final poket.Pokemon poke;
  const CustomAppBar({super.key, required this.poke});
  void paintType() {
    switch (poke.types[0].type.name) {
      case "normal":
        type = AppTheme.normal;
        break;
      case "fighting":
        type = AppTheme.fighting;
        break;
      case "flying":
        type = AppTheme.flying;
        break;
      case "poison":
        type = AppTheme.poison;
        break;
      case "ground":
        type = AppTheme.ground;
        break;
      case "rock":
        type = AppTheme.rock;
        break;
      case "bug":
        type = AppTheme.bug;
        break;
      case "ghost":
        type = AppTheme.ghost;
        break;
      case "steel":
        type = AppTheme.steel;
        break;
      case "fire":
        type = AppTheme.fire;
        break;
      case "water":
        type = AppTheme.water;
        break;
      case "grass":
        type = AppTheme.grass;
        break;
      case "electric":
        type = AppTheme.electric;
        break;
      case "psychic":
        type = AppTheme.psychic;
        break;
      case "ice":
        type = AppTheme.ice;
        break;
      case "dragon":
        type = AppTheme.dragon;
        break;
      case "dark":
        type = AppTheme.dark;
        break;
      case "fairy":
        type = AppTheme.fairy;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    paintType();
    return SliverAppBar(
      backgroundColor: type,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Container(
                color: type.withOpacity(.5),
                child: Text(
                  "${poke.name[0].toUpperCase()}${poke.name.substring(1)} #${poke.id}",
                  style:
                      const TextStyle(fontSize: 26, color: AppTheme.contrast),
                ))),
        background: FadeInImage(
          placeholder: const AssetImage("assets/pokemonholder.png"),
          image: NetworkImage(
              poke.sprites.other!.officialArtwork.frontDefault.toString()),
        ),
      ),
    );
  }
}

class _SpriteDescription extends StatelessWidget {
  final String sprite;
  final String firstType;
  final String genus;
  final String description;

  const _SpriteDescription(
      {required this.sprite,
      required this.firstType,
      required this.genus,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage(
                    height: 150,
                    image: NetworkImage(sprite),
                    placeholder: const AssetImage("assets/pokemonholder.png"),
                  ),
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      color: type,
                      child: Text(firstType),
                    ))
              ],
            ),
            const SizedBox(
              width: 30,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  genus,
                  style: AppTheme.title,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  description,
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _Abilities extends StatelessWidget {
  final String ability;
  final String? ability2;
  final String? ability3;
  final bool? ability2H;
  final bool? ability3H;

  const _Abilities(
      {required this.ability,
      this.ability2,
      this.ability3,
      this.ability2H,
      this.ability3H});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      child: Column(
        children: [
          const Text("Abilities", style: AppTheme.title),
          const SizedBox(height: 20),
          Row(children: [
            Text(
              "${ability[0].toUpperCase()}${ability.substring(1)}",
              style: AppTheme.title,
            ),
          ]),
          const SizedBox(height: 10),
          const Text(
              "Does not affect non-damaging electric moves, i.e. thunder wave.  Increases the frequency of Match Call calls on the overworld if any party Pokémon has this ability."),
          const SizedBox(height: 20),
          if (ability2 != null)
            Row(
              children: [
                if (ability2 != null)
                  Text("${ability2![0].toUpperCase()}${ability2!.substring(1)}",
                      style: AppTheme.title),
                if (ability2H == true)
                  TextButton(
                    child: const Icon(Icons.lock),
                    onPressed: () {
                      const AlertDialog(
                        title: Text("Hidden Ability"),
                        
                        );
                    },
                  ),
              ],
            ),
          const SizedBox(height: 10),
          const Text(
              "Does not affect non-damaging electric moves, i.e. thunder wave.  Increases the frequency of Match Call calls on the overworld if any party Pokémon has this ability."),
          const SizedBox(height: 10),
          if (ability3 != null)
            Row(
              children: [
                if (ability2 != null) Text(ability3!, style: AppTheme.title),
                if (ability3H == true) const Icon(Icons.lock)
              ],
            )
        ],
      ),
    );
  }
}
