import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:memorize_music_notes/config/config.dart';
import 'package:memorize_music_notes/pages/question.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  // 以下mainメソッドの処理
  runApp(const MyApp());
  print(dotenv.env['admobid']);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memorize Music Notes',
      theme: ThemeData(),
      home: const MyHomePage(title: 'Top'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SettingConfig.mainColor,
      appBar: AppBar(
        backgroundColor: SettingConfig.secondColor,
        title: Text(
          widget.title,
          style: TextStyle(color: SettingConfig.mainColor),
        ),
      ),
      drawer: Drawer(
          child: ListView(children: <Widget>[
        const DrawerHeader(
          child: Text(
            'My App',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          title: Text('quiz'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => QuestionPage()));
          },
        ),
      ])),
      body: Center(
        // ここを追加
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Memorize',
              style: TextStyle(
                  color: SettingConfig.secondColor,
                  fontSize: SettingConfig.titleFontSize),
            ),
            Text(
              'Music',
              style: TextStyle(
                  color: SettingConfig.secondColor,
                  fontSize: SettingConfig.titleFontSize),
            ),
            Text(
              'Notes',
              style: TextStyle(
                  color: SettingConfig.secondColor,
                  fontSize: SettingConfig.titleFontSize),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    child: const Text('Start'),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontWeight: FontWeight.bold),
                      primary: SettingConfig.secondColor,
                      onPrimary: SettingConfig.mainColor,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuestionPage()));
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    child: const Text('Score'),
                    style: ElevatedButton.styleFrom(
                      primary: SettingConfig.secondColor,
                      onPrimary: SettingConfig.mainColor,
                      textStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
