import 'dart:convert';

import 'package:assignment/models/person_details_model.dart';
import 'package:assignment/models/popular_people_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppCache {
  static final AppCache _instance = AppCache._private();

  static AppCache get instance {
    return _instance;
  }

  SharedPreferences? _prefs;

  static final String _KEY_TOKEN = "token";
  static final String _KEY_POPULAR_LIST = "popularlist";
  static final String _KEY_PERSON_DETAILS = "persondetails";

  AppCache._private();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // void setApiToken(String? token) async {
  //   if (token == null) return;
  //   await _prefs!.setString(_KEY_TOKEN, token);
  // }

  // String? getApiToken() {
  //   String? token = _prefs!.getString(_KEY_TOKEN);
  //   //printDone('storedToken id: $token');
  //   return token;
  // }

  void setPopularList(PopularPeopleModel? model) async {
    if (model == null) return;
    String json = jsonEncode(model.toJson());
    await _prefs!.setString(_KEY_POPULAR_LIST, json);
  }

  PopularPeopleModel? getPopularList() {
    String? json = _prefs!.getString(_KEY_POPULAR_LIST);
    return json == null ? null : PopularPeopleModel.fromJson(jsonDecode(json));
  }

  void setPersonDetails(PersonDetailsModel? model) async {
    if (model == null) return;
    String json = jsonEncode(model.toJson());
    await _prefs!.setString(_KEY_PERSON_DETAILS, json);
  }

  PersonDetailsModel? getPersonDetails() {
    String? json = _prefs!.getString(_KEY_PERSON_DETAILS);
    return json == null ? null : PersonDetailsModel.fromJson(jsonDecode(json));
  }

  void removeToken() {
    _prefs!.remove(_KEY_TOKEN);
    _prefs!.clear();
  }
}
