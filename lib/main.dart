import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    title: "BlindSpot",
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Container(
        child: Text("Bains"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.explore, size: 25,), label: "Explore", ),
          BottomNavigationBarItem(icon: Icon(Icons.music_note, size: 40,), label: "Now playing"),
          BottomNavigationBarItem(icon: Icon(Icons.book_online, size: 25,), label: "Library")
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
        tooltip: "Upload Content",
      ),
    );
  }
}
