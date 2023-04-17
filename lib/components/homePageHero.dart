import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class homePageHero extends StatefulWidget {
  const homePageHero({Key? key}) : super(key: key);

  @override
  State<homePageHero> createState() => _homePageHeroState();
}

class _homePageHeroState extends State<homePageHero> {
  List itemsInfo = [
    {
      "title": "Lovish",
      "desc": "this is the description of the story",
      "color": 0xFFFF56FF,
      "imageURL":
          "https://c.saavncdn.com/758/295-Sidhu-Moose-Wala--English-2021-20210922022502-500x500.jpg",
      "audioURL":
          "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3"
    },
    {
      "title": "Bains",
      "desc": "this is the description of the story",
      "color": 0x90898234,
      "imageURL":
          "https://c.saavncdn.com/758/295-Sidhu-Moose-Wala--English-2021-20210922022502-500x500.jpg",
      "audioURL":
          "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3"
    },
    {
      "title": "Developer",
      "desc": "this is the description of the story",
      "color": 0x90343434,
      "imageURL":
          "https://c.saavncdn.com/758/295-Sidhu-Moose-Wala--English-2021-20210922022502-500x500.jpg",
      "audioURL":
          "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3"
    }
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    List<Widget> _widgetsList = [];

    for (var item in itemsInfo) {
      // print(item);
      _widgetsList.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: (){
            print("Clicked");
          },
          child: Container(
            width: width * 0.8,
            decoration: BoxDecoration(
                color: Color(item["color"]), borderRadius: BorderRadius.circular(30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: width*0.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(item['title'], style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),),
                        Text(item['desc'])
                      ],
                    ),
                  ),
                ),
                Container(
                  width: width*0.35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(item["imageURL"])
                    )
                  ),
                )
              ],
            ),
          ),
        ),
      ));
    }

    print(_widgetsList.length);

    return ListView(
      scrollDirection: Axis.horizontal,
      children: _widgetsList,
    );
  }
}
