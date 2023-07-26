import 'package:cinemapedia/config/constants/environtment.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  static const name = 'home-screen';
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Text( Envnironment.theMovieDBKey),
      ),
    );
  }
}