// ignore_for_file: list_remove_unrelated_type

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hyft/model/matching_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemNotifier with ChangeNotifier {
  SharedPreferences? sharedPreferences;

  List<MatchingInfo> listItem = [];

  addItem(String name, String mood, String detail) {
    MatchingInfo item = MatchingInfo(name, mood, detail);
    listItem.add(item);
    saveData();
    notifyListeners();
  }

  removeItem(MatchingInfo item) {
    listItem.remove(item);
    updateremoved();
    notifyListeners();
  }

  void initsharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    loadData();
    notifyListeners();
  }

  void saveData() {
    List<String> spLlist =
        listItem.map((item) => json.encode(item.toMap())).toList();
    sharedPreferences!.setStringList('list', spLlist);
  }

  void loadData() {
    List<String>? spList = sharedPreferences!.getStringList('list');
    if (spList != null) {
      listItem = spList
          .map((item) => MatchingInfo.fromMap(json.decode(item)))
          .toList();
    }
    notifyListeners();
  }

  void updateremoved() {
    sharedPreferences!.remove('list');
    saveData();
  }
}
