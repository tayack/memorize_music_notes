import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:memorize_music_notes/widget/chord_button.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:memorize_music_notes/config/config.dart';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');

  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(QuestionPage());
}

String getTestAdBannerUnitId() {
  String testBannerUnitId = "";
  if (Platform.isAndroid) {
    // Android のとき
    testBannerUnitId = "ca-app-pub-3940256099942544/6300978111";
  } else if (Platform.isIOS) {
    // iOSのとき
    testBannerUnitId = "ca-app-pub-3940256099942544/2934735716";
  }
  return testBannerUnitId;
}

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPage createState() => _QuestionPage();
}

class _QuestionPage extends State<QuestionPage> {
  final BannerAd myBanner = BannerAd(
    //adUnitId: getTestAdBannerUnitId(),
    adUnitId: "ca-app-pub-9410375406721754/1905414002",
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );

  @override
  Widget build(BuildContext context) {
    myBanner.load();
    final AdWidget adWidget = AdWidget(ad: myBanner);
    return MaterialApp(
        home: Scaffold(
            backgroundColor: SettingConfig.mainColor,
            appBar: AppBar(
              leading: new IconButton(
                icon:
                    new Icon(Icons.arrow_back, color: SettingConfig.mainColor),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              backgroundColor: SettingConfig.secondColor,
            ),
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.all(SettingConfig.commonMargin),
                            color: SettingConfig.forthColor,
                            height: SettingConfig.commonHeight,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'C 13',
                                style: TextStyle(
                                    fontSize: SettingConfig.largeFontSize),
                              ),
                            )),
                      ),
                    ],
                  ),
                  Row(children: [
                    ChordButton('C'),
                    ChordButton(
                      'C#',
                    ),
                    ChordButton('D'),
                    ChordButton(
                      'E♭',
                    )
                  ]),
                  Row(children: [
                    ChordButton(
                      'E',
                    ),
                    ChordButton(
                      'F',
                    ),
                    ChordButton(
                      'F#',
                    ),
                    ChordButton(
                      'G',
                    )
                  ]),
                  Row(children: [
                    ChordButton(
                      'G#',
                    ),
                    ChordButton(
                      'A',
                    ),
                    ChordButton(
                      'B♭',
                    ),
                    ChordButton(
                      'B',
                    ),
                  ]),
                ]),
            bottomNavigationBar: Container(
              child: adWidget,
              width: myBanner.size.width.toDouble(),
              height: myBanner.size.height.toDouble(),
            )));
  }
}
