import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/state/ui-state.dart'; 

class FourImages extends StatefulWidget 
{
  const FourImages({ 
    super.key, 
    required this.image1, 
    required this.image2, 
    required this.image3, 
    required this.image4,
    required this.width
  });

  final String image1; 
  final String image2; 
  final String image3; 
  final String image4;

  final double width;
  final double spacing = 0.03;

  @override 
  State<FourImages> createState() => FourImagesState(); 
}

class FourImagesState extends State<FourImages> 
{
  late double boxSpacing;
  late double boxSize; 

  @override 
  void initState() {
    super.initState();  
    boxSpacing = widget.width * widget.spacing;
    boxSize = (widget.width - boxSpacing) / 2;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width, 
    
      child: Column(
        children: [
          Row(
            children: [
              createImage(widget.image1),
              SizedBox(width: boxSpacing),
              createImage(widget.image2)
            ]
          ),
          SizedBox(height: boxSpacing),
          Row(
            children: [
              createImage(widget.image3),
              SizedBox(width: boxSpacing),
              createImage(widget.image4)
            ]
          ),
        ]
      )
    );
  }


  Widget createImage(String src) {
    double borderRadiusPerc = 0.025; 

    return Container(
      width: boxSize,
      height: boxSize, 
      decoration: BoxDecoration(
        border: Border.all(
          color:Color.fromRGBO(234, 234, 234, 1.0),
          width: 3
        ),
        borderRadius: BorderRadius.circular(widget.width * borderRadiusPerc)
      ), 
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.width * borderRadiusPerc * 0.45),
        child: Image.asset(
          src
        )
      )
      
    );
  }
}