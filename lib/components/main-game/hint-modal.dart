import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/components/backdrop/modal-container.dart';
import 'package:four_pics_baybayin/components/backdrop/modal-dialog.dart';
import 'package:four_pics_baybayin/components/main-game/cost-specifier.dart';
import 'package:four_pics_baybayin/components/topbar/game-bar.dart';
import 'package:four_pics_baybayin/helpers/audio-player.dart';
import 'package:four_pics_baybayin/state/game-state.dart';
import 'package:four_pics_baybayin/state/ui-state.dart'; 

class HintModal extends StatefulWidget 
{
  const HintModal({ 
    super.key,
    required this.container, 
    required this.title, 
    required this.description,
    required this.cost, 
    required this.mainAction, 
    required this.gameBar
  });

  final GlobalKey<ModalContainerState> container;
  final GlobalKey<GameBarState> gameBar;
  final String title; 
  final String description; 
  final int cost;
  final Function mainAction;


  @override 
  State<HintModal> createState() => HintModalState(); 
}

class HintModalState extends State<HintModal> 
{
  @override
  Widget build(BuildContext context) {
    return ModalDialog(
      width: 320, 
      title: widget.title,
      container: widget.container,
      child:  Container(
        margin: const EdgeInsets.all(14), 
        child:  Center(
          child: Column(
            children: [
              Container( 
                margin: const EdgeInsets.all(14),
                child: Text(widget.description), 
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CostSpecifier(cost: widget.cost)
                ]
              ),
              const SizedBox(height: 10),
              Container( 
                margin: const EdgeInsets.symmetric(horizontal: 14),
                child:  Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          playSound("click-1");
                          widget.container.currentState!.hide();
                        },
                        child: const Text("CANCEL"),
                      )
                    ), 
                    const SizedBox(width: 10),
                    Expanded( 
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: gameState.coins < widget.cost ?
                           Colors.grey :
                           Colors.redAccent
                        ),
                        onPressed: () {
                          if(gameState.coins >= widget.cost) {
                            playSound("click-1");
                            widget.container.currentState?.hide();
                            gameState.decreaseCoins(50, widget.gameBar);
                            widget.mainAction();
                          }
                        },
                        child: gameState.coins > widget.cost ? 
                          const Text("CONFIRM") : 
                          Row(
                            children: [
                              Image.asset(
                                "assets/icons/icon-lock.png",
                                height: 14
                              ), 
                              const SizedBox(width: 5),
                              const Text("CONFIRM")
                            ]
                          )   
                      )
                    )
                  ]
                )
              ),
              const SizedBox(height: 14)
            ]
          )
        )
      ),
    );
  }
}
