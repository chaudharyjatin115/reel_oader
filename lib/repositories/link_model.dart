import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_insta/flutter_insta.dart';

void downloadReels(String link) async {
  try {
    var s = await FlutterInsta().downloadReels(link);

    await FlutterDownloader.enqueue(
            url: '$s',
            saveInPublicStorage: true,
            savedDir: '/sdcard/download',
            showNotification: true,
            openFileFromNotification: true)
        .whenComplete(() => () {
              // ignore: avoid_print
              print('download completed');
              // ignore: avoid_print
            });
  } catch (e) {
    const SnackBar(content: Text('some error'));
  }
}
