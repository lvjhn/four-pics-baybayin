import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/state/ui-state.dart';
import 'package:provider/provider.dart'; 

class BGIBox extends StatefulWidget 
{
  const BGIBox({ 
    super.key,
    required this.child
  });

  final Widget child;

  @override 
  State<BGIBox> createState() => BGIBoxState(); 
}

class BGIBoxState extends State<BGIBox> 
{
  @override
  Widget build(BuildContext context) {
    return Consumer<UIState>(
      builder: (context, uiState, child) {
        String patternSource = 
          uiState.backgroundPatterns[uiState.backgroundPattern];
        
        return SizedBox(
          width: double.infinity, 
          height: double.infinity,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(patternSource),
                    repeat: ImageRepeat.repeat
                  )
                )
              ),
              widget.child
            ]
        )
      );
    });
  }
}