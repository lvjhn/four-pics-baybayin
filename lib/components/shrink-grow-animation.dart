import 'package:flutter/material.dart';

class ShrinkGrowAnimation extends StatefulWidget 
{
  const ShrinkGrowAnimation({
    super.key, 
    this.shrinkSize = 50, 
    this.growSize = 100, 
    this.duration = 200,
    required this.child
  });

  final double shrinkSize; 
  final double growSize;
  final int duration; 

  final Widget child;


  @override 
  State<ShrinkGrowAnimation> createState() => ShrinkGrowAnimationState();
}

class ShrinkGrowAnimationState extends State<ShrinkGrowAnimation> 
  with SingleTickerProviderStateMixin
{
  late Animation<double> animation;
  late AnimationController controller; 


  @override 
  void initState() {
    super.initState(); 
    
    controller = AnimationController(
      duration:  Duration(milliseconds: widget.duration),
      vsync: this
    );

    animation = 
      Tween<double>(begin: widget.shrinkSize, end: widget.growSize)
        .animate(controller);

    animation.addListener(() { 
      setState(() {}); 
    });          

    animation.addStatusListener((AnimationStatus status) {
      if(status == AnimationStatus.completed) {
        controller.reverse();
      }
      if(status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/logo/logo.png", width: animation.value);
  }

  @override 
  void dispose() {
    controller.dispose();
    super.dispose();
  }

}