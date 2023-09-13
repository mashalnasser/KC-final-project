import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> imageCards = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _pickImage(context);
        },
        child: Icon(Icons.add),
        elevation: 100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 0, 131, 253),
              Color.fromARGB(255, 0, 131, 253),
              Color.fromARGB(255, 66, 201, 255),
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: ListView(
          children: [
            if (imageCards.isNotEmpty) ...imageCards,
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _pickImage(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      var imageData = await file.bytes;
      String text = "";
      String date = "";
      String time = "";

      showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
          controller: ScrollController(initialScrollOffset: 1),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.memory(
                  imageData!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20),
                TextField(
                  onChanged: (value) {
                    text = value;
                  },
                  decoration: InputDecoration(labelText: 'name'),
                  style: TextStyle(fontSize: 20),
                ),
                TextField(
                  onChanged: (value) {
                    date = value;
                  },
                  decoration: InputDecoration(labelText: 'Date'),
                  style: TextStyle(fontSize: 20),
                ),
                TextField(
                  onChanged: (value) {
                    time = value;
                  },
                  decoration: InputDecoration(labelText: 'Time'),
                  style: TextStyle(fontSize: 20),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      imageCards.insert(
                        0,
                        ImageCard(
                          imageBytes: imageData,
                          name: text,
                          date: date,
                          time: time,
                        ),
                      );
                    });
                    Navigator.pop(context);
                  },
                  child: Text("Add Image"),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      print("No image selected");
    }
  }
}

class ImageCard extends StatelessWidget {
  final Uint8List? imageBytes;
  final String name;
  final String date;
  final String time;

  ImageCard({
    this.imageBytes,
    required this.name,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
              ),
              child: Image.memory(
                imageBytes!,
                height: 140,
                width: 140,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Transform(
                transform: Matrix4.skewX(-0.1),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("name: $name", style: TextStyle(fontSize: 18)),
                      Text("Date: $date", style: TextStyle(fontSize: 18)),
                      Text("Time: $time", style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
