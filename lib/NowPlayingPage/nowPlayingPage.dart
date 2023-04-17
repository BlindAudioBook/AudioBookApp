import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/audioPlayer.dart';

class NowPlayingPage extends StatefulWidget {
  const NowPlayingPage({Key? key}) : super(key: key);

  @override
  State<NowPlayingPage> createState() => _NowPlayingPageState();
}

class _NowPlayingPageState extends State<NowPlayingPage> {
  late final AudioPlayer advancedPlayer;

  @override
  void initState(){
    super.initState();
    advancedPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidht = MediaQuery.of(context).size.width;
    final PlayerBackground = Colors.blue;

    final audioArtist = "Sidhu Moosewala";
    final audioTitle = "295";
    final audioCover =
        "https://c.saavncdn.com/758/295-Sidhu-Moose-Wala--English-2021-20210922022502-500x500.jpg";

    return Scaffold(
      backgroundColor: PlayerBackground,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              height: screenHeight / 3,
              right: 0,
              child: Container(
                color: PlayerBackground,
              )),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                elevation: 0,
                backgroundColor: PlayerBackground,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {},
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                  )
                ],
              )),
          Positioned(
              top: screenHeight / 4,
              left: 0,
              right: 0,
              height: screenHeight*.36,
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight / 10,
                    ),
                    Text(audioTitle,
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold))),
                    Text(audioArtist, style: GoogleFonts.lato()),
                    AudioPlayerFile(advancedPlayer: advancedPlayer)
                  ],
                ),
              )),
          Positioned(
              top: screenHeight / 6,
              left: (screenWidht - 150) / 2,
              right: (screenWidht - 150) / 2,
              height: 150,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: PlayerBackground,
                    border: Border.all(
                      style: BorderStyle.solid,
                      color: Colors.white,
                      width: 1,
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    // height: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        // borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.circle,
                        border: Border.all(
                          style: BorderStyle.solid,
                          color: Colors.white,
                          width: 4,
                        ),
                        image: DecorationImage(
                            image: NetworkImage(audioCover), fit: BoxFit.fill)),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
