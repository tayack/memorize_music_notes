import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:memorize_music_notes/config/config.dart';
import 'package:memorize_music_notes/pages/question.dart';
import 'package:memorize_music_notes/widget/title_text.dart';

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
  int _selectItem = 1;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: SettingConfig.mainColor,
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
              TitleText('Memorize'),
              TitleText('Music'),
              TitleText('Notes'),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 100,
                      height: SettingConfig.titleButtonHeight,
                      child: DropdownButtonFormField(
                        style: TextStyle(
                          color: SettingConfig.forthColor,
                        ),
                        decoration: InputDecoration(
                            labelText: 'degree',
                            labelStyle:
                                TextStyle(color: SettingConfig.secondColor),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            )),
                        alignment: Alignment.center,
                        dropdownColor: SettingConfig.mainColor,
                        value: _selectItem,
                        items: [
                          DropdownMenuItem(child: Text('m3'), value: 1),
                          DropdownMenuItem(child: Text('3'), value: 2),
                          DropdownMenuItem(child: Text('5'), value: 3),
                          DropdownMenuItem(child: Text('♭7'), value: 4),
                          DropdownMenuItem(child: Text('7'), value: 5),
                          DropdownMenuItem(child: Text('♭9'), value: 6),
                          DropdownMenuItem(child: Text('9'), value: 7),
                          DropdownMenuItem(child: Text('#9'), value: 8),
                          DropdownMenuItem(child: Text('11'), value: 9),
                          DropdownMenuItem(child: Text('#11'), value: 10),
                          DropdownMenuItem(child: Text('♭13'), value: 11),
                          DropdownMenuItem(child: Text('13'), value: 12),
                        ],
                        onChanged: (value) => {
                          setState(() {
                            _selectItem = int.parse(value.toString());
                          }),
                        },
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: SettingConfig.titleButtonHeight,
                      width: 100,
                      child: ElevatedButton(
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
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: SettingConfig.titleButtonHeight,
                width: 220,
                child: ElevatedButton(
                  child: const Text('Score'),
                  style: ElevatedButton.styleFrom(
                    primary: SettingConfig.secondColor,
                    onPrimary: SettingConfig.mainColor,
                    textStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
