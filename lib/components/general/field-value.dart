import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/state/ui-state.dart'; 

class FieldValue extends StatefulWidget 
{
  const FieldValue({ 
    super.key,
    required this.width, 
    required this.labelProp, 
    required this.label, 
    required this.value
  });

  final double width; 

  final double labelProp; 
  final String label;
  final String value;

  @override 
  State<FieldValue> createState() => FieldValueState(); 
}

class FieldValueState extends State<FieldValue> 
{
  late double labelWidth; 
  late double valueWidth; 

  @override 
  void initState() {
    super.initState();
    labelWidth = widget.width * widget.labelProp;
    valueWidth = widget.width - labelWidth;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ), 
      child: Row(
        children: [
          Container(
            width: labelWidth, 
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 7, 0, 0),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(3), 
                bottomLeft: Radius.circular(3), 
              )
            ),
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Center( 
              child: Text(
                widget.label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white
                )
              )
            )
          ),
          Container(
            width: valueWidth, 
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 248, 246, 246),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(3), 
                bottomRight: Radius.circular(3), 
              )
            ),
            padding: EdgeInsets.symmetric(vertical: 10),
            child:  Center( 
              child: Text(
                widget.value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                )
              )
            )
          )
        ]
      )
    );
  }
}
