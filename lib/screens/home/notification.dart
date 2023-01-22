import 'package:facebook/models/notification/index.dart';
import 'package:facebook/provider/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bloc/common/bloc.dart';
import '../../bloc/common/events.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final _bloc = CommonBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(CommonNotificationGet());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonProvider>(builder: (context, value, child) {
      return ListView.builder(
          itemCount: value.notificationList.length,
          itemBuilder: ((context, index) {
            return _buildTile(value, value.notificationList[index]);
          }));
    });
  }

  Widget _buildTile(CommonProvider provider, NotificationModel item) {
    return ListTile(
      onTap: () => provider.setRead(item.id),
      title: Text(
        item.description.join(' '),
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, height: 20 / 14),
      ),
      subtitle: Text(
        item.createdData,
        style: TextStyle(fontSize: 12),
      ),
      leading: Image.network(item.coverImage),
      trailing: IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
      tileColor: provider.isRead(item.id)
          ? Colors.grey[100]
          : Colors.blue.withOpacity(0.3),
    );
  }
}
