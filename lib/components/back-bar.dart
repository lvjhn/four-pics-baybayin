import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/helpers/goto.dart';
import 'package:four_pics_baybayin/components/status-indicator.dart';
import 'package:four_pics_baybayin/helpers/audio-player.dart';
import 'package:four_pics_baybayin/screens/main-menu.dart';
import 'package:four_pics_baybayin/screens/settings.dart';
import 'package:four_pics_baybayin/state/ui-state.dart';


class BackBar extends StatefulWidget 
{
  const BackBar({ 
    super.key,
    required this.title
  });

  final String title;

  @override 
  State<BackBar> createState() => BackBarState();
}

class BackBarState extends State<BackBar> 
{
  @override 
  Widget build(BuildContext context) {
    double topOffset = MediaQuery.of(context).viewPadding.top;

    return Container(
      width: double.infinity, 
      height: 50,
      margin: EdgeInsets.fromLTRB(0, topOffset, 0, 0),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        color:  Colors.white
      ),
      child: Row(
        children: [
          // ----- SETTINGS AND HOME ICON ---- //
          createBackIcon(context),
          const SizedBox(width: 10),
          createTitleText(context, widget.title)
        ]
      )
    );
  }
}

Widget createBackIcon(BuildContext context) {
  return InkWell(
    child: Image.asset("assets/icons/icon-back.png", width: 35),
    onTap: () {
      playSound("click-1");
      goto(context, const MainMenuScreen());
    }
  );
}

Widget createTitleText(BuildContext context, String title) {
  return  Text(
    title, 
    style: const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold
    )
  );
}
