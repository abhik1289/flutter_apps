import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "myapp",
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  var musicName = "";
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: const Text("My App"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Container(
                child:  Center(
                  child: Text(
                    "M",
                    style:const TextStyle(color: Colors.white, fontSize: 30.0),
                  ),
                ),
                width: 120.0,
                height: 120.0,
                decoration: const BoxDecoration(color: Colors.redAccent),
              ),
              Text(musicName),
              Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (value) async {
                  final position = Duration(seconds: value.toInt());
                  await audioPlayer.seek(position);
                  await audioPlayer.resume();
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${position.inSeconds.toDouble()}"),
                  Text(
                      "${duration.inSeconds.toDouble() - position.inSeconds.toDouble()}")
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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
                    CircleAvatar(
                      radius: 40.0,
                      child: IconButton(
                          onPressed: () async{
                            await audioPlayer.seek(Duration(milliseconds:duration.inMilliseconds+ 5000));
                          }, icon: const Icon(Icons.history)),
                    )
                  ],
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
          width: MediaQuery.of(context).size.width - 30,
          height: 400.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          FilePickerResult? result = await FilePicker.platform.pickFiles();
          if (result != null) {
            PlatformFile file = result.files.first;
            int status =
                await audioPlayer.play(file.path.toString(), isLocal: true);
            if (status == 1) {
              setState(() {
                musicName = result.files.single.name;
                isPlaying = true;
              });
            }
          }
        },
        child: const Icon(Icons.music_note),
      ),
    );
  }
}
