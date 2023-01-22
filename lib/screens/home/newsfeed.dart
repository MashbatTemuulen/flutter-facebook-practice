import 'package:facebook/bloc/common/bloc.dart';
import 'package:facebook/bloc/common/events.dart';
import 'package:facebook/models/story/index.dart';
import 'package:facebook/provider/common.dart';
import 'package:facebook/widgets/newsFeed_card.dart';
import 'package:facebook/widgets/story_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/newsFeedProfile.dart';
import '../../widgets/story_create.dart';

class NewsFeedPage extends StatefulWidget {
  const NewsFeedPage({super.key});

  @override
  State<NewsFeedPage> createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  final _bloc = CommonBloc();
  final _scrollController = ScrollController();
  final _refreshController = RefreshController();

  void removeUserProfile() async {
    final pref = await SharedPreferences.getInstance();
    if (pref.getString("userProfile") != null) pref.remove("userProfile");
  }

  void initState() {
    super.initState();
    _bloc.add(CommonStoryGet());
    _bloc.add(CommonNewsFeedGet(_refreshController));
  }

  void _onRefresh() async {
    _bloc.add(CommonNewsFeedGet(_refreshController));
  }

  void _onLoadMore() async {
    _bloc.add(CommonNewsFeedLoadMore(_refreshController));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonProvider>(builder: ((context, value, child) {
      return Scaffold(
          body: Scrollbar(
              controller: _scrollController,
              child: SmartRefresher(
                controller: _refreshController,
                scrollController: _scrollController,
                onRefresh: _onRefresh,
                onLoading: _onLoadMore,
                enablePullDown: true,
                enablePullUp: true,
                child: ListView(
                  controller: _scrollController,
                  children: [
                    NewsFeedProfileWidget(),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      color: Theme.of(context).backgroundColor,
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          StoryCreateWidget(),
                          ...List.generate(value.story.length,
                              (index) => StoryCardWidget(value.story[index])),
                          StoryCardWidget(StoryModel(
                              id: 1,
                              coverImg:
                                  "https://i.pinimg.com/564x/ef/d1/c9/efd1c901b93da7b3b1169fa2a71c9ddb.jpg",
                              name: "Underwater train",
                              circleImg:
                                  "https://i.pinimg.com/75x75_RS/1a/b5/07/1ab5070c5f8406f8f00e83cd039feefc.jpg"))
                        ]),
                      ),
                    ),
                    TextButton(
                        onPressed: removeUserProfile,
                        child: Text("Remove UserProfile")),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: List.generate(
                          value.newsFeedList.length,
                          (index) => Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: NewsfeedCard(value.newsFeedList[index]),
                              )),
                    ),
                  ],
                ),
              )));
    }));
  }
}
