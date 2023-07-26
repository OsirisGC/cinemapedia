import 'package:flutter_dotenv/flutter_dotenv.dart';




class Envnironment {
  static String theMovieDBKey = dotenv.env['THE_MOVIEDB_KEY'] ?? 'No hay api key';
}