import 'package:flutter_dotenv/flutter_dotenv.dart';

class HAppAPI {
  static const movieBaseUrl = "https://api.themoviedb.org/3/";
  static const imageBaseUrl = "https://image.tmdb.org/t/p/w500/";
  static final movieAPIKey = dotenv.env['TMDBAPIKEY'] ?? '';
}
