import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'package:test_app/assets/style.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 28),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleSection(
            title: "Profile Page",
            lengthBg: 100,
          ),
          Divider(),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Theme'),
                  LiteRollingSwitch(
                    value: Provider.of<AppStateNotifier>(context).isDarkMode,
                    textOn: 'Light',
                    textOff: 'Dark',
                    colorOn: shadeBlue,
                    colorOff: darkBlue,
                    iconOn: Icons.lightbulb_outline,
                    iconOff: Icons.offline_bolt,
                    onChanged: (bool state) {
                      Provider.of<AppStateNotifier>(context).updateTheme(state);
                      // print('turned ${(state) ? 'on' : 'off'}');
                    },
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Row(
                children: [
                  Expanded(
                    child: Text('Send Advice'),
                  ),
                ],
              ),
            ),
          ),
          Divider()
        ],
      ),
    );
  }
}
