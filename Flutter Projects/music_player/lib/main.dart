import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "musicapp",
      debugShowCheckedModeBanner: false,
      home: MyMusic(),
    );
  }
}

class MyMusic extends StatefulWidget {
  MyMusic({Key? key}) : super(key: key);

  @override
  State<MyMusic> createState() => _MyMusicState();
}

class _MyMusicState extends State<MyMusic> {
  bool isPlaying = false;
  AudioPlayer audioPlayer = AudioPlayer();
  String currentTime = "00:00";
  String completeTime = "00:00";
  @override
  void initState() {
    super.initState();
    audioPlayer.onAudioPositionChanged.listen((Duration duration) {
      setState(() {
        currentTime = duration.toString().split(".")[0];
      });
    });
    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        completeTime = event.toString().split(".")[0];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          FilePickerResult? result = await FilePicker.platform.pickFiles();
          if (result != null) {
            PlatformFile file = result.files.first;
            print(file.path);
            int status =
                await audioPlayer.play(file.path.toString(), isLocal: true);
            if (status == 1) {
              setState(() {
                isPlaying = true;
              });
            }
          }
        },
        child: const Icon(Icons.music_note),
      ),
      appBar: AppBar(
        title: const Text("Music Player"),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * .8,
          height: 250.0,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                height: 50.0,
                child: Row(
                  children: [
                    Text("${currentTime}/${completeTime}"),
                  ],
                ),
              ),
              CircleAvatar(
                radius: 40.0,
                child: isPlaying
                    ? IconButton(
                        onPressed: () {
                          audioPlayer.pause();
                          setState(() {
                            isPlaying = false;
                          });
                        },
                        icon: const Icon(Icons.pause))
                    : IconButton(
                        onPressed: () {
                          audioPlayer.resume();
                          setState(() {
                            isPlaying = true;
                          });
                        },
                        icon: const Icon(Icons.play_arrow)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
