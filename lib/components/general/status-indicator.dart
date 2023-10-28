import 'package:flutter/material.dart';

class StatusIndicator extends StatefulWidget 
{
  const StatusIndicator({ 
    super.key, 
    required this.icon,
    required this.value
  });

  final Image icon; 
  final int value;

  @override 
  State<StatusIndicator> createState() => StatusIndicatorState();
}

class StatusIndicatorState extends State<StatusIndicator>   
  with TickerProviderStateMixin
{
  late AnimationController controller;
  late Animation<double> animation;
  late int actualValue;


  @override 
  void initState() {
    super.initState(); 

    actualValue = widget.value; 

   

  }

  void setValue(int value) {
    controller = AnimationController(
      duration: const Duration(milliseconds: 500), 
      vsync: this
    );  

    animation = 
      Tween<double>(begin: actualValue.toDouble(), end: value.toDouble())
        .animate(controller);  


    animation.addListener(() {
      setState(() {
        actualValue = animation.value.toInt();
      });
    });

    controller.forward();
  }

  @override 
  Widget build(BuildContext context) {
    return Container(
      width: 125, 
      child: Stack(
        children: [
          Positioned(
            left: 22,
            top: 5,
            child: Container(
              width: 100,
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50)
                ),
                color: Color.fromRGBO(50, 50, 50, 1)
              ), 
              child: Center(
                child: Text(
                  actualValue.toString(), 
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  )
                ), 
              )
            )
          ),
          widget.icon,
        ]
      )
    );
  }
}