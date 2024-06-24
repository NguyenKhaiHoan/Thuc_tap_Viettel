// ignore: depend_on_referenced_packages
import 'package:flutter_dotenv/flutter_dotenv.dart';

const String newsAPIBaseUrl = 'https://newsapi.org/v2/';
final String newsAPIKey = dotenv.env['NEWSAPIKEY'] ?? '';
const String countryQuery = 'us';
const String categoryQuery = 'general';
