import 'package:blind_spot/ExplorePage/explorePage.dart';
import 'package:blind_spot/LibraryPage/libraryPage.dart';
import 'package:blind_spot/NowPlayingPage/nowPlayingPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    title: "BlindSpot",
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;
  List<Widget> _screen = [ExplorePage(),NowPlayingPage(), LibraryPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (currentIndex!=1)?AppBar(
        title: Text(
          "Hi User!",
          style: GoogleFonts.lato(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30)),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.settings, color: Colors.black,)),
          )
        ],
      ):null,
      body: _screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        backgroundColor: currentIndex==1?Colors.blue:Colors.white,
        selectedItemColor:currentIndex==1?Colors.white:Colors.blue,
        elevation: currentIndex==1?0:30,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.explore, size: 25,), label: "Explore", ),
          BottomNavigationBarItem(icon: Icon(Icons.music_note, size: 40,), label: "Now playing"),
          BottomNavigationBarItem(icon: Icon(Icons.book_online, size: 25,), label: "Library")
        ],
      ),
      floatingActionButton: currentIndex!=1?FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
        tooltip: "Upload Content",
      ):null,
    );
  }
}
