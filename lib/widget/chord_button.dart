import 'package:flutter/material.dart';
import 'package:memorize_music_notes/config/config.dart';

class ChordButton extends StatefulWidget {
  @override
  _ChordButtonState createState() => _ChordButtonState();
  final String _chord;
  ChordButton(this._chord) {}
}

class _ChordButtonState extends State<ChordButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          margin: EdgeInsets.all(SettingConfig.commonMargin),
          height: SettingConfig.commonHeight,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                primary: SettingConfig.secondColor,
                onPrimary: SettingConfig.secondColor),
            child: Text(
              widget._chord,
              style: TextStyle(color: SettingConfig.mainColor),
            ),
          )),
    );
  }
}
