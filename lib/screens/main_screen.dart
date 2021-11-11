// ignore_for_file: await_only_futures

import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_insta/flutter_insta.dart';
import 'package:permission_handler/permission_handler.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

final controller = TextEditingController();

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    initializeDownloader();
  }

  void initializeDownloader() async {
    FlutterDownloader.registerCallback(downloadCallback);
  }

  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send!.send([id, status, progress]);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Reeloader'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
            ),
            TextButton(
              child: const Text('Download'),
              onPressed: () async {
                final status = await Permission.storage.request();
                if (status.isGranted) {
                  downloadReels(controller.text);
                } else {
                  print("Permission denied");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

void downloadReels(String link) async {
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
}
