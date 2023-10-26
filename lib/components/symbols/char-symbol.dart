import 'package:flutter/material.dart'; 

class CharSymbol extends StatefulWidget 
{
  const CharSymbol({ 
    super.key, 
    this.width = 250, 
    this.height = 250,
    this.charOffsetX = 0,
    this.charOffsetY = 0, 
    this.withLabels = true,
    this.character = "A",
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.fontFamily = "Baybayin Sisil",
    this.fontSize = 0.4,
    this.label = "a",
    this.labelColor = Colors.black,
    this.borderRadius = 0.1,
    this.labelCharacters = "a"
  });

  final double width; 
  final double height;
  final bool withLabels; 
  final double charOffsetX; 
  final double charOffsetY;
  final String character;
  final Color backgroundColor; 
  final Color textColor;
  final String fontFamily;
  final String label;
  final Color labelColor;
  final double borderRadius;
  final String labelCharacters;
  final double fontSize;

  @override 
  State<CharSymbol> createState() =>  CharSymbolState();  
}

class CharSymbolState extends State<CharSymbol> 
{
  @override 
  Widget build(BuildContext context) {
    var negOffsetY = widget.withLabels ? 0.12 : 0;

    return Container(
      width: widget.width, 
      height: widget.height, 
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(widget.width * widget.borderRadius)
      ), 
      child: Stack( 
        children: [
          Positioned(
            left: widget.width * widget.charOffsetX, 
            top: widget.height * (widget.charOffsetY - negOffsetY), 
            child: Text(
              widget.character,
              style: TextStyle(
                color: widget.textColor,
                fontSize: widget.height * widget.fontSize,
                fontFamily: widget.fontFamily
              )
            )
          ),
          Visibility(
            visible: widget.withLabels, 
            child: Positioned( 
              left: 0, 
              bottom: 0,
              child: Container(
                width: widget.width,
                height: widget.height * (0.35), 
                decoration: BoxDecoration(
                  color: widget.labelColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      widget.width * widget.borderRadius
                    ),
                    bottomRight: Radius.circular(
                      widget.height * widget.borderRadius
                    )
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.labelCharacters,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: widget.width * (0.2)
                      )
                    ),
                    SizedBox(height: widget.height * 0.04)
                  ]
                )
              )
            )
          )
        ]
      )
    );
  }
}
