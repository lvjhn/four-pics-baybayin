import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/components/status-indicator.dart';
import 'package:four_pics_baybayin/helpers/audio-player.dart';


class GameBar extends StatefulWidget 
{
  const GameBar({ 
    super.key,
    this.isHomeIconVisible = true
  });

  final bool isHomeIconVisible;

  @override 
  State<GameBar> createState() => GameBarState();
}

class GameBarState extends State<GameBar> 
{
  GlobalKey<StatusIndicatorState> levelSI = GlobalKey<StatusIndicatorState>(); 
  GlobalKey<StatusIndicatorState> coinSI  = GlobalKey<StatusIndicatorState>();
  
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
          createSettingsIcon(context),
          const SizedBox(width: 10),
          createHomeIcon(context, widget.isHomeIconVisible),
          
          Expanded(child: const Text("")), 

          // ---- STATUS INDICATORS ---- //

          // level status indicator
          StatusIndicator(
            key: levelSI,
            icon: Image.asset("assets/icons/icon-medal.png", width: 40),
            value: 3 
          ),
          const SizedBox(width: 5),
          StatusIndicator(
            key: coinSI,
            icon: Image.asset("assets/icons/icon-coin.png", width: 40),
            value: 3
          ),

          // ElevatedButton(
          //   onPressed: () {
          //     coinSI.currentState!.setValue(coinSI!.currentState!.actualValue + 10);
          //     playSound("coin-spill");
          //   }, 
          //   child: const Text("CHG")
          // )
        ]
      )
    );
  }
}

Widget createSettingsIcon(BuildContext context) {
  return InkWell(
    child: Image.asset("assets/icons/icon-settings.png", width: 35),
    onTap: () {
      playSound("click-1");
    }
  );
}

Widget createHomeIcon(BuildContext context, bool visible) {
  return Visibility(
    visible: visible,
    child: InkWell( 
      child: Image.asset("assets/icons/icon-home.png", width: 35),
      onTap: () {
        playSound("click-1");
      }
    )
  );
}

