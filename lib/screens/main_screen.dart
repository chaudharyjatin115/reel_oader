import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_insta/flutter_insta.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

final controller = TextEditingController();
void initializeDownloader() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
      );
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();

    initializeDownloader();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              onPressed: () {
                downloadReels(controller.value.toString());
              },
            )
          ],
        ),
      ),
    );
  }
}

void downloadReels(String link) async {
  var s = await FlutterInsta().downloadReels("$link");
  print(s);
}
