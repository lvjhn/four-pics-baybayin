import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/state/ui-state.dart';
import 'package:provider/provider.dart'; 

class ModalContainer extends StatefulWidget 
{
  const ModalContainer({ 
    super.key,
    required this.child,
    required this.modalContent
  });

  final Widget child;
  final Widget modalContent;

  @override 
  State<ModalContainer> createState() => ModalContainerState(); 
}

class ModalContainerState extends State<ModalContainer> 
{
  bool isVisible = false; 

  void hide() { 
    setState(() { isVisible = false; });
  }

  void show() {
    setState(() { isVisible = true; });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        Visibility(
          visible: isVisible,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.9)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.modalContent
              ]
            )
          )
        )
      ]
    );
  }
}