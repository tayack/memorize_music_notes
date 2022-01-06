import 'package:flutter/widgets.dart';
import 'package:memorize_music_notes/config/config.dart';

class TitleText extends StatelessWidget {
  final String value;
  TitleText(this.value) {}

  @override
  Widget build(BuildContext context) {
    return Text(
      this.value,
      style: TextStyle(
          color: SettingConfig.secondColor,
          fontSize: SettingConfig.titleFontSize),
    );
  }
}
