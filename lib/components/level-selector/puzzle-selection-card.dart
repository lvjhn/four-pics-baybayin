import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/components/general/four-images.dart';
import 'package:four_pics_baybayin/state/ui-state.dart'; 

class PuzzleSelectionCard extends StatefulWidget 
{
  const PuzzleSelectionCard({ 
    super.key, 
    required this.image1,
    required this.image2, 
    required this.image3, 
    required this.image4, 
    required this.puzzleNo,
    required this.isSolved, 
    required this.isSelectable,
    this.correctWord = "WORD",
    required this.onSelect 
  });

  final double heightRatio = 1.5; 
  
  final double width = 250; 
  final int puzzleNo;
  final bool isSolved;
  final bool isSelectable;

  final String image1; 
  final String image2; 
  final String image3; 
  final String image4;

  final String correctWord;

  final Function onSelect; 


  @override 
  State<PuzzleSelectionCard> createState() => PuzzleSelectionCardState(); 
}

class PuzzleSelectionCardState extends State<PuzzleSelectionCard> 
{
  late double height; 
  double borderRadiusPerc = 0.05;
  
  bool isTapped = false; 

  @override 
  void initState() {
    super.initState(); 
    height = widget.width * widget.heightRatio;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails tapDownDetails) {
        setState(() { isTapped = true; });
      }, 
      onTapUp: (TapUpDetails tapUpDetails) {
        setState(() { isTapped = false; });
        widget.onSelect();
      },
      child: Container(
        width: widget.width, 
        height: height,
        decoration: BoxDecoration(
          color: Colors.white, 
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            !widget.isSelectable ? BoxShadow(
              color: Colors.transparent.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 3,
              offset: Offset(0, 3), // changes position of shadow
            ) : (isTapped ? BoxShadow(
              color: Colors.white.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 3,
              offset: Offset(0, 3), // changes position of shadow
            ) :  BoxShadow(
              color: Colors.transparent.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 3,
              offset: Offset(0, 3), // changes position of shadow
            )) 
          ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Center(
                  child: FourImages(
                    image1: widget.image1, 
                    image2: widget.image2, 
                    image3: widget.image3, 
                    image4: widget.image4, 
                    width: widget.width * 0.8
                  )
                ),
                Positioned(
                  top: 65,
                  left: (widget.width / 2) - (widget.width * 0.9) / 2,
                  child: Center(
                    child: createSolvedOverlay()
                  )
                )
              ]
            ),
            const SizedBox(height: 10),
            Text(
              "# " + widget.puzzleNo.toString(), 
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              )
            ),
            const SizedBox(height: 10),
            createWordIndicator()
          ]
        )
      )
    );
  }

  Widget createWordIndicator() {  

    late Widget correctWordIndicator; 

    if(widget.isSolved) {
      correctWordIndicator = Text(
        widget.correctWord,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold
        )
      );
    } else {
      correctWordIndicator = Image.asset(
        "assets/icons/icon-lock.png", 
        width: height * 0.10
      );
    }

    return Container(
      width: widget.width * 0.8, 
      height: height * 0.15, 
      decoration: BoxDecoration(
        color: const Color.fromRGBO(234, 234, 234, 1.0),
        border: Border.all(
          color:const Color.fromRGBO(234, 234, 234, 1.0),
          width: 3
        ),
        borderRadius: BorderRadius.circular(widget.width * borderRadiusPerc)
      ),
      child: Center( 
        child: correctWordIndicator
      )
    );
  }

  Widget createSolvedOverlay() {
    return Visibility(
      visible: widget.isSolved, 
      child: Transform.rotate(
        angle: -0.3,
        child:  Container(
          width: widget.width * 0.9,
          height: height * 0.15,
          decoration: BoxDecoration(
            color:  Color.fromARGB(255, 0, 0, 0),
            borderRadius: BorderRadius.circular(widget.width * borderRadiusPerc)
          ),
          child: const Center(
            child: Text(
              "SOLVED",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold
              )
            )
          ),
        )
      )
    );
  }
}