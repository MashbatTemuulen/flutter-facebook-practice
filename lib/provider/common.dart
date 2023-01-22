import 'package:facebook/global_keys.dart';
import 'package:facebook/models/newsfeed/index.dart';
import 'package:facebook/models/notification/index.dart';
import 'package:facebook/models/story/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonProvider extends ChangeNotifier {
  String? userProfile;
  int bottomBarIndex = 0;
  List<StoryModel> story = [];
  List<NewsFeedModel> newsFeedList = [];
  List<NotificationModel> notificationList = [];
  List<int> readNotification = [];
  int newsFeedPage = 1;
  ThemeMode themeMode = ThemeMode.light;

  void toggleThemeMode() {
    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  CommonProvider() {
    getUserProfile();
  }
  bool get isLogged => userProfile != null;

  void setUserProfile(String val) async {
    userProfile = val;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("userProfile", userProfile.toString());
    notifyListeners();
  }

  void getUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.getString("useProfile");
    if (userProfile != null) {
      notifyListeners();
    }
  }

  void changeBottomBarIndex(int val) {
    bottomBarIndex = val;
    notifyListeners();
  }

  void addStory(List<StoryModel> value) {
    story.addAll(value);
    notifyListeners();
  }

  void addNewsFeed(List<NewsFeedModel> value, int page) {
    newsFeedList.addAll(value);
    newsFeedPage = page;
    notifyListeners();
  }

  void setNewsFeed(List<NewsFeedModel> value) {
    newsFeedList.clear();
    newsFeedPage = 1;
    newsFeedList.addAll(value);
    notifyListeners();
  }

  void setNewsFeedClear() {
    newsFeedList.clear();
    notifyListeners();
  }

  void setNotification(List<NotificationModel> data) {
    notificationList = data;
    notifyListeners();
  }

  void setRead(int id) {
    readNotification.add(id);
    notifyListeners();
  }

  bool isRead(int id) {
    return readNotification.any((element) => element == id);
  }

  static CommonProvider get instance =>
      Provider.of<CommonProvider>(GlobalKeys.navigatorKey.currentContext!,
          listen: false);
}
