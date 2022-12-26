import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:marshmello_musicplayer/show_internal_music.dart';

class PlayMusicScreen extends StatefulWidget {
  const PlayMusicScreen({Key? key}) : super(key: key);

  @override
  State<PlayMusicScreen> createState() => _PlayMusicScreenState();
}

class _PlayMusicScreenState extends State<PlayMusicScreen> {
  bool playing = false;
  IconData playBtn = Icons.play_arrow_rounded;

  late AudioPlayer _player;
  // AudioCache cache;

  Duration position = new Duration();
  Duration musicLength = new Duration();

  Widget slider() {
    return Slider.adaptive(
      activeColor: Colors.white,
      inactiveColor: Colors.white60,
      value: position.inSeconds.toDouble(),
      max: musicLength.inSeconds.toDouble(),
      onChanged: (value) {
        seekToSec(value.toInt());
      },
    );
  }

  void seekToSec(int sec){
    Duration newPos = Duration (seconds: sec);
    _player.seek(newPos);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _player=AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        actions: const [
          SizedBox(
            width: 6,
            child: Image(
              image: AssetImage("assets/icons/ThreeDot.png"),
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
        backgroundColor: Colors.black,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShowInternalMusic(),
                ));
          },
          child: const Icon(
            Icons.chevron_left,
            size: 35,
          ),
        ),
        title: const Text(
          "Your Song Name",
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black,
                Color(0xff0f0817),
                Color(0xff110c1d),
                Color(0xff1b0c2b),
                Color(0xff3b1a60),
              ],
            ),
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white12,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Your Song Name",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: Icon(
                              Icons.favorite_outline_rounded,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      const Text(
                        "Artist Name",
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    slider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          iconSize: 45,
                          color: Colors.white,
                          onPressed: () {},
                          icon: Icon(Icons.skip_previous_rounded),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        IconButton(
                          iconSize: 70,
                          color: Colors.white,
                          onPressed: () {
                            if (!playing) {
                              setState(() {
                                playBtn = Icons.pause_rounded;
                                playing = true;
                              });
                            } else {
                              setState(() {
                                playBtn = Icons.play_arrow_rounded;
                                playing = false;
                              });
                            }
                          },
                          icon: Icon(playBtn),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        IconButton(
                          iconSize: 45,
                          color: Colors.white,
                          onPressed: () {},
                          icon: Icon(Icons.skip_next_rounded),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
