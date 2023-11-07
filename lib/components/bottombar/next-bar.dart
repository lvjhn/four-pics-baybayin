import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/helpers/goto.dart';
import 'package:four_pics_baybayin/components/general/status-indicator.dart';
import 'package:four_pics_baybayin/helpers/audio-player.dart';
import 'package:four_pics_baybayin/screens/level-selector.dart';
import 'package:four_pics_baybayin/screens/main-menu.dart';
import 'package:four_pics_baybayin/screens/settings.dart';
import 'package:four_pics_baybayin/state/ui-state.dart';

class NextBar extends StatefulWidget {
  const NextBar({
    super.key, 
    required this.title,
    required this.onNext, 
    this.replace = false
  });

  final String title;
  final Function onNext; 
  final bool replace;

  @override
  State<NextBar> createState() => NextBarState();
}

class NextBarState extends State<NextBar> {
  @override
  Widget build(BuildContext context) {
    double topOffset = MediaQuery.of(context).viewPadding.top;

    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(children: [
        // ----- SETTINGS AND HOME ICON ---- //
        Expanded(
          child: ElevatedButton(
            child: Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold
              )
            ), 
            onPressed: () {
              playSound("click-1");
              widget.onNext();
            }
          )
        ),
        const SizedBox(width: 10),
        Transform.flip(
          flipX: true,
          flipY: false,
          child: createBackIcon(context)
        )
      ])
    );
  }
}

Widget createBackIcon(BuildContext context) {
  return InkWell(
    child: Image.asset("assets/icons/icon-back.png", width: 35),
    onTap: () {
    }
  );
}

Widget createTitleText(BuildContext context, String title) {
  return Text(title,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold));
}
