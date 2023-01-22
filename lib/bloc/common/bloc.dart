import 'package:facebook/bloc/common/events.dart';
import 'package:facebook/bloc/common/states.dart';
import 'package:facebook/models/newsfeed/index.dart';
import 'package:facebook/models/notification/index.dart';
import 'package:facebook/models/story/index.dart';
import 'package:facebook/provider/common.dart';
import 'package:facebook/services/api/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../provider/loader.dart';

class CommonBloc extends Bloc<CommonEvent, CommonState> {
  CommonBloc() : super(CommonInitial()) {
    on<CommonLogin>((event, emit) async {
      emit(CommonLoading());
      try {
        final res = await ApiService().getRequest("/login", true);
        // final json = jsonEncode(res.data);
        CommonProvider.instance.setUserProfile(res.data["profileImg"]);
        emit(CommonSuccess());
      } catch (ex) {
        print(ex);
        emit(CommonFailure(ex.toString()));
      }
    });
    on<CommonStoryGet>((event, emit) async {
      emit(CommonLoading());
      try {
        final res = await ApiService().getRequest("/story", true);
        CommonProvider.instance.addStory(StoryModel.fromList(res.data));
        emit(CommonSuccess());
      } catch (ex) {
        print(ex);
        emit(CommonFailure(ex.toString()));
      }
    });
    on<CommonNewsFeedGet>((event, emit) async {
      emit(CommonLoading());
      LoaderProvider.instance.startLoading();
      CommonProvider.instance.setNewsFeedClear();
      try {
        final res = await ApiService().getRequest("/newsfeed/1", true);
        await Future.delayed(Duration(seconds: 1));
        CommonProvider.instance.setNewsFeed(NewsFeedModel.fromList(res.data));
        emit(CommonSuccess());
        LoaderProvider.instance.cancelLoading();
        event.controller.refreshCompleted();
      } catch (ex) {
        print(ex);
        emit(CommonFailure(ex.toString()));
        LoaderProvider.instance.cancelLoading();
        event.controller.refreshFailed();
      }
    });
    on<CommonNewsFeedLoadMore>((event, emit) async {
      emit(CommonLoading());
      LoaderProvider.instance.startLoading();
      try {
        int page = CommonProvider.instance.newsFeedPage;
        page++;
        final res = await ApiService().getRequest("/newsfeed/$page", true);
        CommonProvider.instance
            .addNewsFeed(NewsFeedModel.fromList(res.data), page);
        LoaderProvider.instance.cancelLoading();
        emit(CommonSuccess());
        event.controller.loadComplete();
      } catch (ex) {
        print(ex);
        emit(CommonFailure(ex.toString()));
        LoaderProvider.instance.cancelLoading();
        event.controller.loadFailed();
      }
    });
    on<CommonNotificationGet>((event, emit) async {
      emit(CommonLoading());
      try {
        int page = CommonProvider.instance.newsFeedPage;
        final res = await ApiService().getRequest("/notification", true);
        CommonProvider.instance
            .setNotification(NotificationModel.fromList(res.data['data']));
        emit(CommonSuccess());
      } catch (ex) {
        print(ex);
        emit(CommonFailure(ex.toString()));
      }
    });
  }
}
