import 'package:flutter/material.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart' as tg;
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart';

import 'common_widgets.dart';
import 'copy_paste.dart';

class UserDetailsView extends StatefulWidget {
  const UserDetailsView({super.key});

  @override
  State<UserDetailsView> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetailsView> {
  final WebAppInitData webAppInitData = tg.initDataUnsafe;

  @override
  void initState() {
    tg.BackButton.show();
    super.initState();
  }

  @override
  void dispose() {
    tg.BackButton.hide();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            KDetailsList("Query", webAppInitData.query_id),
            KDetailsList("chat_type", webAppInitData.chat_type),
            KDetailsList("chat_instance", webAppInitData.chat_instance),
            KDetailsList("start_param", webAppInitData.start_param),
            KDetailsList("auth_date", webAppInitData.auth_date),
            KDetailsList("hash", webAppInitData.hash),
            KDetailsList("user_id", '${webAppInitData.user?.id}'),
            KDetailsList("name", '${webAppInitData.user?.first_name} ${webAppInitData.user?.last_name}'),
            KDetailsList("username", webAppInitData.user?.username),
            KDetailsList("photoUrl", webAppInitData.user?.photo_url),
            KDetailsList("receiver_username", webAppInitData.receiver?.username),
            KDetailsList("chat_username", webAppInitData.chat?.username),
            KDetailsList("chat_title", webAppInitData.chat?.title),
            KDetailsList("chat_url", webAppInitData.chat?.photo_url),
            InkWell(
              child: const Text("复制 hash"),
              onTap: () {
                CopyPaste.copy(webAppInitData.hash);
              },
            ),
            SizedBox(height: 20,),
            InkWell(
              child: const Text("复制 initData"),
              onTap: () {
                CopyPaste.copy(tg.initData);
              },
            ),
            SizedBox(height: 20,),
            InkWell(
              child: const Text("分享到 Twitter"),
              onTap: () {
                var url = "https://twitter.com/intent/tweet?url=https%3A%2F%2Fdial.to%2F%3Faction%3Dsolana-action%3Ahttps%3A%2F%2Fblinkeditor.com%2Fapi%2Factions%2Ffc06152161&text=Check+out+Blink+11";
                tg.openTelegramLink(url);
              },
            ),
            SizedBox(height: 20,),
            InkWell(
              child: const Text("打开外部链接"),
              onTap: () {
                var url = "https://twitter.com";
                tg.openTelegramLink(url);
              },
            ),
          ],
        ),
      ),
    );
  }
}
