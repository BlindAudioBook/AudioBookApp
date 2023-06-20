import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class uploadPage extends StatefulWidget {
  const uploadPage({Key? key}) : super(key: key);

  @override
  State<uploadPage> createState() => _uploadPageState();
}

class _uploadPageState extends State<uploadPage> {
  final _formKey = GlobalKey<FormState>();

  FilePickerResult? filePickerResult;
  String? _fileName;
  PlatformFile? pickedFile;
  bool isLoading = false;
  bool isSelected = false;
  bool submit = false;

  String? title;
  String? artist;
  String? category;

  void uploadFile(PlatformFile selectedFile, String title, String artist,
      String category) async {
    var request = http.MultipartRequest("POST",
        Uri.parse("https://5c78-14-139-53-129.ngrok-free.app/upload/audio"));
    request.files
        .add(await http.MultipartFile.fromPath("audio", selectedFile.path!));
    request.fields["title"] = title;
    request.fields["artist"] = artist;
    request.fields["category"] = category;

    var response = await request.send();
  }

  void selectFile() async {
    try {
      setState(() {
        isLoading = true;
      });

      filePickerResult = await FilePicker.platform
          .pickFiles(type: FileType.audio, allowMultiple: false);

      if (filePickerResult != null) {
        setState(() {
          isSelected = true;
        });
        _fileName = filePickerResult!.files.first.name;
        pickedFile = filePickerResult!.files.first;
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Upload Audio",
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: Form(
          key: _formKey,
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.title),
                      hintText: "Please enter the title",
                      labelText: "Title",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter title";
                      }
                      return null;
                    },
                    onChanged: (text) {
                      setState(() {
                        title = text;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: "Please enter the artist",
                      labelText: "Artist",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter artist name";
                      }
                      return null;
                    },
                    onChanged: (text) {
                      setState(() {
                        artist = text;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.category),
                      hintText: "Please enter the category",
                      labelText: "Category",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter category";
                      }
                      return null;
                    },
                    onChanged: (text) {
                      setState(() {
                        category = text;
                      });
                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: isSelected
                          ? Container(
                              child: Text(_fileName!),
                              padding: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  border:
                                      Border.all(color: Colors.green, width: 2.0),
                                  borderRadius: BorderRadius.circular(12.0)),
                            )
                          : ElevatedButton(
                              onPressed: selectFile,
                              child: Text("Select File"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey,
                              ),
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      onPressed: (pickedFile != null &&
                              title != null &&
                              title != "" &&
                              artist != null &&
                              artist != "" &&
                              category != null &&
                              category != "")
                          ? () {
                              uploadFile(pickedFile!, title!, artist!, category!);
                            }
                          : null,
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Upload", style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                            ),),
                            SizedBox(
                              width: 20.0,
                            ),
                            Icon(Icons.upload)
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
