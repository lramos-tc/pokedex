import 'package:flutter/material.dart';
import 'package:pokedex/themes/themes.dart';

class FilterSlider extends StatelessWidget {
  const FilterSlider({super.key, required this.title, required this.filters});

  final String title;
  final List<dynamic> filters;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(title, style: AppTheme.title),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, int index) {
              var typer = filters[index];
              print("$typer,Helloo");
              return _PokemonType(filterText: typer.name);
            },
            itemCount: filters.length,
          ),
        ),
      ]),
    );
  }
}

class _PokemonType extends StatelessWidget {
  final String filterText;

  const _PokemonType({required this.filterText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 170,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, "details",
                arguments: "type-instance"),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                  imageErrorBuilder:
                      (_, Object exception, StackTrace? stackTrace) {
                    return Container();
                  },
                  placeholder: const AssetImage("assets/pokemonholder.png"),
                  image: AssetImage("assets/$filterText.png"),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover),
            ),
          ),
        ),
        Text(
          filterText,
          style: AppTheme.menu.copyWith(color: AppTheme.contrast),
          overflow: TextOverflow.ellipsis,
        )
      ]),
    );
  }
}
