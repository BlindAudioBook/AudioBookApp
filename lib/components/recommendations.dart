import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class recommendations extends StatefulWidget {
  const recommendations({Key? key}) : super(key: key);

  @override
  State<recommendations> createState() => _recommendationsState();
}

class _recommendationsState extends State<recommendations> {

  List itemsInfo = [
    {
      "title": "Lovish",
      "desc": "this is the description of the story",
      "color": 0xFFFF56FF,
      "type": "Story",
      "imageURL":
      "https://c.saavncdn.com/758/295-Sidhu-Moose-Wala--English-2021-20210922022502-500x500.jpg",
      "audioURL":
      "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3"
    },
    {
      "title": "Bains",
      "desc": "this is the description of the story",
      "color": 0x90898234,
      "type": "Podcast",
      "imageURL":
      "https://c.saavncdn.com/758/295-Sidhu-Moose-Wala--English-2021-20210922022502-500x500.jpg",
      "audioURL":
      "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3"
    },
    {
      "title": "Developer",
      "desc": "this is the description of the story",
      "color": 0x90343434,
      "type": "Story",
      "imageURL":
      "https://c.saavncdn.com/758/295-Sidhu-Moose-Wala--English-2021-20210922022502-500x500.jpg",
      "audioURL":
      "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3"
    },
    {
      "title": "Lovish",
      "desc": "this is the description of the story",
      "color": 0xFFFF56FF,
      "type": "Experience",
      "imageURL":
      "https://c.saavncdn.com/758/295-Sidhu-Moose-Wala--English-2021-20210922022502-500x500.jpg",
      "audioURL":
      "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3"
    },
    {
      "title": "Bains",
      "desc": "this is the description of the story",
      "color": 0x90898234,
      "type": "Podcast",
      "imageURL":
      "https://c.saavncdn.com/758/295-Sidhu-Moose-Wala--English-2021-20210922022502-500x500.jpg",
      "audioURL":
      "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3"
    },
    {
      "title": "Developer",
      "desc": "this is the description of the story",
      "color": 0x90343434,
      "type": "Story",
      "imageURL":
      "https://c.saavncdn.com/758/295-Sidhu-Moose-Wala--English-2021-20210922022502-500x500.jpg",
      "audioURL":
      "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3"
    },
    {
      "title": "Lovish",
      "desc": "this is the description of the story",
      "color": 0xFFFF56FF,
      "type": "Story",
      "imageURL":
      "https://c.saavncdn.com/758/295-Sidhu-Moose-Wala--English-2021-20210922022502-500x500.jpg",
      "audioURL":
      "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3"
    },
    {
      "title": "Bains",
      "desc": "this is the description of the story",
      "color": 0x90898234,
      "type": "Experience",
      "imageURL":
      "https://c.saavncdn.com/758/295-Sidhu-Moose-Wala--English-2021-20210922022502-500x500.jpg",
      "audioURL":
      "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3"
    },
    {
      "title": "Developer",
      "desc": "this is the description of the story",
      "color": 0x90343434,
      "type": "Story",
      "imageURL":
      "https://c.saavncdn.com/758/295-Sidhu-Moose-Wala--English-2021-20210922022502-500x500.jpg",
      "audioURL":
      "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3"
    },
    {
      "title": "Lovish",
      "desc": "this is the description of the story",
      "color": 0xFFFF56FF,
      "type": "Story",
      "imageURL":
      "https://c.saavncdn.com/758/295-Sidhu-Moose-Wala--English-2021-20210922022502-500x500.jpg",
      "audioURL":
      "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3"
    },
    {
      "title": "Bains",
      "desc": "this is the description of the story",
      "color": 0x90898234,
      "type": "Story",
      "imageURL":
      "https://c.saavncdn.com/758/295-Sidhu-Moose-Wala--English-2021-20210922022502-500x500.jpg",
      "audioURL":
      "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3"
    },
    {
      "title": "Developer",
      "desc": "this is the description of the story",
      "color": 0x90343434,
      "type": "Story",
      "imageURL":
      "https://c.saavncdn.com/758/295-Sidhu-Moose-Wala--English-2021-20210922022502-500x500.jpg",
      "audioURL":
      "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3"
    }
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetsList = [];
    _widgetsList.add(
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text("Recents", style: GoogleFonts.lato(
          fontSize: 25,
          fontWeight: FontWeight.bold
        ),),
      )
    );

    for(var item in itemsInfo){
      _widgetsList.add(
        GestureDetector(
          onTap: (){
            print("Play music");
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                // child: Image.network(item["imageURL"], scale: 5,),
                child: Container(
                  height : MediaQuery.of(context).size.width*0.3,
                  width: MediaQuery.of(context).size.width*0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(item["imageURL"])
                    )
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(item["title"], style: GoogleFonts.lato(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Container(
                              padding: EdgeInsets.all(4),
                              child: Text(item["type"],style: GoogleFonts.lato(
                                fontSize: 15
                              ),),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.greenAccent
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(item["desc"]),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _widgetsList,
    );

  }
}
