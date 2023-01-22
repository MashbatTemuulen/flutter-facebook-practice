import 'package:facebook/provider/common.dart';
import 'package:facebook/screens/home/newsfeed.dart';
import 'package:facebook/screens/home/notification.dart';
import 'package:facebook/screens/home/settings.dart';
import 'package:facebook/screens/home/shop.dart';
import 'package:facebook/screens/home/watch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? userProfile;

  void removeUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString("userProfile") != null) {
      prefs.remove("userProfile");
    }
  }

  void saveLoacalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    // prefs.setInt("counter", count);
  }

  void getLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    Provider.of<CommonProvider>(context, listen: false)
        .setUserProfile(prefs.getString("userProfile").toString());
  }

  void initState() {
    super.initState;
    print("home rendered");
    getLocalStorage();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonProvider>(builder: ((context, value, child) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Image.asset(
            "assets/cover.png",
            height: 40,
            alignment: Alignment.centerLeft,
          ),
          centerTitle: false,
          actions: [
            Row(
              children: [
                IconButton(
                    color: Colors.black,
                    onPressed: () {},
                    icon: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.black12, shape: BoxShape.circle),
                        child: Icon(
                          Icons.search,
                          size: 20,
                        ))),
                IconButton(
                    color: Colors.black,
                    onPressed: () {},
                    icon: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.black12, shape: BoxShape.circle),
                        child: Icon(
                          Icons.chat,
                          size: 20,
                        ))),
                IconButton(
                    color: Colors.black,
                    onPressed: () => value.toggleThemeMode(),
                    icon: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.black12, shape: BoxShape.circle),
                        child: Icon(
                          value.themeMode == ThemeMode.light
                              ? Icons.light_mode
                              : Icons.dark_mode,
                          size: 20,
                          color: Theme.of(context).dividerColor,
                        )))
              ],
            )
          ],
        ),
        body: [
          NewsFeedPage(),
          WatchPage(),
          ShopPage(),
          NotificationPage(),
          SettingsPage()
        ][value.bottomBarIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: value.bottomBarIndex,
            onTap: value.changeBottomBarIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.newspaper,
                      color: Theme.of(context).dividerColor),
                  label: "Нүүр"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.video_camera_back_outlined,
                      color: Theme.of(context).dividerColor),
                  label: "Бичлэг"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.storefront_outlined,
                      color: Theme.of(context).dividerColor),
                  label: "Дэлгүүр"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_none,
                      color: Theme.of(context).dividerColor),
                  label: "Мэдэгдэл"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.menu, color: Theme.of(context).dividerColor),
                  label: "Тохиргоо"),
            ]),
      );
    }));
  }
}
