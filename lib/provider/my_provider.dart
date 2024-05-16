import 'package:Tasbih/models/radio_model.dart';
import 'package:Tasbih/shared/network/api_manager.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  late SharedPreferences sharedPreferences;
  List<Radios> data = [];

  ThemeMode myTheme = ThemeMode.light;
  final player = AudioPlayer();

  Future<void> getRadioData() async {
    data = await ApiManager.getRadioAudio();
    notifyListeners();
  }

  void playAudio(int index) async {
    await player.play(UrlSource(data[index].url ?? ""));
    notifyListeners();
  }

  void pauseAudio() {
    player.pause();
    notifyListeners();
  }

  void stopAudio() {
    player.stop();
    notifyListeners();
  }

  void changeAppTheme(ThemeMode mode) {
    myTheme = mode;
    notifyListeners();
    cacheTheme(myTheme);
  }

  String getBG() {
    if (myTheme == ThemeMode.light) {
      return "assets/images/background.png";
    } else {
      return "assets/images/bgDark.png";
    }
  }

  Future<void> cacheTheme(ThemeMode theme) async {
    String newTheme = theme == ThemeMode.dark ? "dark" : "light";

    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('theme', newTheme);
  }

  String? getCachedTheme() {
    return sharedPreferences.getString('theme');
  }

  Future<void> loadThemeData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    String? oldTheme = getCachedTheme();
    if (oldTheme != null) {
      myTheme = oldTheme == "dark" ? ThemeMode.dark : ThemeMode.light;
    }
    notifyListeners();
  }

  saveSwitchButton() {}
}
