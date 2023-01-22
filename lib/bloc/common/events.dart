import 'package:equatable/equatable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class CommonEvent extends Equatable {
  const CommonEvent();
}

class CommonLogin extends CommonEvent {
  final String username, password;
  const CommonLogin(this.username, this.password);

  @override
  List<Object?> get props => [username, password];
}

class CommonStoryGet extends CommonEvent {
  const CommonStoryGet();
  @override
  List<Object?> get props => [];
}

class CommonNewsFeedGet extends CommonEvent {
  final RefreshController controller;
  const CommonNewsFeedGet(this.controller);

  @override
  List<Object?> get props => [];
}

class CommonNewsFeedLoadMore extends CommonEvent {
  final RefreshController controller;
  const CommonNewsFeedLoadMore(this.controller);

  @override
  List<Object?> get props => [];
}

class CommonNotificationGet extends CommonEvent {
  const CommonNotificationGet();

  @override
  List<Object?> get props => [];
}
