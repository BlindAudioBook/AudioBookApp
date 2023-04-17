import 'package:blind_spot/components/homePageHero.dart';
import 'package:blind_spot/components/recommendations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final audioArtist = "Sidhu Moosewala";
  final audioTitle = "295";
  final audioCover =
      "https://c.saavncdn.com/758/295-Sidhu-Moose-Wala--English-2021-20210922022502-500x500.jpg";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("Most Popular", style: GoogleFonts.lato(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),),
          ),
          Container( // hero for the homepage
            child: homePageHero(),
            height: MediaQuery.of(context).size.height *0.23,
            width: MediaQuery.of(context).size.width *0.8,
          ),
          recommendations(),
        ],
      ),
    );
  }
}
