import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AudioPlayerFile extends StatefulWidget {
  final AudioPlayer advancedPlayer;
  const AudioPlayerFile({Key? key, required this.advancedPlayer})
      : super(key: key);

  @override
  State<AudioPlayerFile> createState() => _AudioPlayerFileState();
}

class _AudioPlayerFileState extends State<AudioPlayerFile> {
  Duration _duration = new Duration();
  Duration _position = new Duration();
  final String path =
      "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3";

  bool isPlaying = false;
  // bool isPaused = false;
  // bool onLoop = false;

  List<IconData> _icons = [Icons.play_circle_filled, Icons.pause_circle_filled];

  @override
  void initState() {
    super.initState();
    this.widget.advancedPlayer.onDurationChanged.listen((event) {
      setState(() {
        _duration = event;
      });
    });

    this.widget.advancedPlayer.onPositionChanged.listen((event) {
      setState(() {
        _position = event;
      });
    });

    this.widget.advancedPlayer.setSourceUrl(path);
    this.widget.advancedPlayer.onPlayerComplete.listen((event) {
      setState(() {
        _position = Duration(seconds: 0);
        isPlaying = false;
      });
    });
  }

  Widget btnStart() {
    // bool isPlaying = false;
    return IconButton(
      onPressed: () {
        if (isPlaying == false) {
          this.widget.advancedPlayer.play(UrlSource(path));

          setState(() {
            isPlaying = true;
          });
        } else if (isPlaying == true) {
          this.widget.advancedPlayer.pause();
          setState(() {
            isPlaying = false;
          });
        }
      },
      icon: isPlaying == false
          ? Icon(_icons[0], size: 60, color: Colors.blueAccent)
          : Icon(
              _icons[1],
              size: 60,
              color: Colors.blueAccent,
            ),
      padding: EdgeInsets.only(bottom: 10.0),
    );
  }

  Widget btnFast() {
    return IconButton(
        onPressed: () {
          this.widget.advancedPlayer.setPlaybackRate(1.5);
        },
        icon: Icon(
          Icons.fast_forward,
          size: 50,
        ));
  }

  Widget btnSlow() {
    return IconButton(
        onPressed: () {
          this.widget.advancedPlayer.setPlaybackRate(0.5);
        },
        icon: Icon(
          Icons.fast_rewind,
          size: 50,
        ));
  }

  Widget loadAsset() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [btnSlow(), btnStart(), btnFast()],
      ),
    );
  }

  void changeToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    this.widget.advancedPlayer.seek(newDuration);
  }

  Widget slider() {
    return Slider(
      activeColor: Colors.black,
      inactiveColor: Colors.grey,
      value: _position.inSeconds.toDouble(),
      onChanged: (double value) {
        setState(() {
          changeToSecond(value.toInt());
          value = value;
        });
      },
      min: 0.0,
      max: _duration.inSeconds.toDouble(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _position.toString().split(".")[0],
                  style: GoogleFonts.lato(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(_duration.toString().split(".")[0],
                    style: GoogleFonts.lato(
                        fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          slider(),
          loadAsset()
        ],
      ),
    );
  }
}
