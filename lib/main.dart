import 'package:flutter/material.dart';
import 'package:untitled/pages/home/home_page.dart';

void main() => runApp(const RickMortyApp());

class RickMortyApp extends StatelessWidget {
  const RickMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage(),);
  }
}
