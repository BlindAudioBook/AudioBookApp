import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Your Library", style: GoogleFonts.lato(
              fontSize: 22,
              fontWeight: FontWeight.bold
            ),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(blurStyle: BlurStyle.inner, color: Colors.grey, blurRadius: 40, spreadRadius: 0.5, )]
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Icon(Icons.thumb_up, size: 30,),
                  ),
                  Text("Favorites", style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.w400
                  ),)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(blurStyle: BlurStyle.inner, color: Colors.grey, blurRadius: 40, spreadRadius: 0.5, )]
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Icon(Icons.headphones, size: 30,),
                  ),
                  Text("Listen Later", style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.w400
                  ),)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(blurStyle: BlurStyle.inner, color: Colors.grey, blurRadius: 40, spreadRadius: 0.5, )]
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Icon(Icons.piano, size: 30,),
                  ),
                  Text("Playlist 1", style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.w400
                  ),)
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
