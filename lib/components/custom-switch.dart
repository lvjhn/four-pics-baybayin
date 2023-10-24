import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget 
{
  const CustomSwitch({ 
    super.key,
    required this.onChange,
    required this.isOn
  });

  final Function onChange;
  final bool isOn;

  @override 
  State<CustomSwitch> createState() => CustomSwitchState(); 
}

class CustomSwitchState extends State<CustomSwitch> 
{

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.isOn ? "ON" : "OFF"),
        const SizedBox(width: 10),
        InkWell(
          child: Transform.scale(
            scale: widget.isOn ? 1 : -1, 
            child: Image.asset( 
              "assets/icons/icon-switch.png",
              height: 50
            )
          ),
          onTap: () {
            setState(() {
              widget.onChange(widget.isOn);
            });
          }
        )
      ]
    );
  }
}
