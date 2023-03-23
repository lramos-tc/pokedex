import 'package:flutter/material.dart';
import 'package:pokedex/themes/themes.dart';

class FilterSlider extends StatelessWidget {
  const FilterSlider({super.key, required this.title});

  final String title;
  //final List<dynamic> filters;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 260,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(title, style: AppTheme.title),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, int index) =>  _PokemonType(),
            itemCount: 20,
          ),
        ),
      ]),
    );
  }
}

class _PokemonType extends StatelessWidget {

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
              child: const FadeInImage(
                  placeholder: AssetImage("assets/pokemonholder.png"),
                  image: NetworkImage(
                      "https://th.bing.com/th/id/OIP.mGik7m2SiXedkVyz4_C51gHaHa?pid=ImgDet&w=920&h=920&rs=1"),
                  width: 130,
                  height: 190,
                  fit: BoxFit.cover),
            ),
          ),
        ),
        const Text(
          "Water",
          style: AppTheme.menu,
          overflow: TextOverflow.ellipsis,
        )
      ]),
    );
  }
}
