import 'package:flutter/material.dart';
import 'package:marshmello_musicplayer/favorite_songs.dart';
import 'package:marshmello_musicplayer/home_page.dart';
import 'package:marshmello_musicplayer/play_screen.dart';
import 'package:marshmello_musicplayer/show_internal_music.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
