import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/components/backdrop/modal-container.dart';
import 'package:four_pics_baybayin/helpers/audio-player.dart';
import 'package:four_pics_baybayin/state/ui-state.dart';
import 'package:provider/provider.dart'; 

class ModalDialog extends StatefulWidget 
{
  const ModalDialog({ 
    super.key,
    required this.child,
    this.showCloseIcon = true,
    required this.width,
    required this.title,
    required this.container,
    this.backgroundColor = Colors.white
  });

  final Widget child; 
  final bool showCloseIcon;
  final double width;
  final String title;
  final GlobalKey<ModalContainerState> container;
  final Color backgroundColor;

  @override 
  State<ModalDialog> createState() => ModalDialogState(); 
}

class ModalDialogState extends State<ModalDialog> 
{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Container(
            width: widget.width, 
            height: 40, 
            decoration: const BoxDecoration(
              color: Color.fromRGBO(234, 234, 234, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), 
                topRight: Radius.circular(5)
              )
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    widget.title, 
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    )
                  )
                ),
                Visibility( 
                  visible: widget.showCloseIcon,
                  child: InkWell(
                    child: Image.asset("assets/icons/icon-close.png", width: 25), 
                    onTap: () {
                      playSound("click-1");
                      widget.container.currentState!.hide();
                    }
                  )
                ),
                const SizedBox(width: 10),
              ]
            )
          ),
          Container(
            width: widget.width, 
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(5), 
                bottomRight: Radius.circular(5)
              )
            ),
            child: widget.child
          )
        ],
      )
    );
  }
}