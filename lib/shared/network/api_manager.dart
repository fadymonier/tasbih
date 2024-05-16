import 'dart:convert';

import 'package:Tasbih/models/radio_model.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static Future getRadioAudio({String lang = "ar"}) async {
    Uri url = Uri.parse("https://mp3quran.net/api/v3/radios?language=$lang");

    var response = await http.get(url);
    var json = jsonDecode(response.body);
    RadioModel model = RadioModel.fromJson(json);
    return model.radios;
  }
}
