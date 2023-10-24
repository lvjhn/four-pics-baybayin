import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/state/ui-state.dart'; 

class BoxSelect extends StatefulWidget 
{
  const BoxSelect({ 
    super.key,
    required this.items,
    this.activeItem = 0,
    this.onChange
  });

  final List<Widget> items;
  final int activeItem;
  final Function? onChange;

  @override 
  State<BoxSelect> createState() => BoxSelectState(); 
}

class BoxSelectState extends State<BoxSelect> 
{
  @override
  Widget build(BuildContext context) {
    var actualItems = [];

    for(int i = 0; i < widget.items.length; i++) {
      actualItems.add(
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
              color: widget.activeItem == i ? 
                Colors.green : 
                Color.fromRGBO(234, 234, 234, 1.0),
              width: 3
            ),
            borderRadius: BorderRadius.circular(15)
          ),
          child: InkWell(
            child: widget.items[i],  
            onTap: () {
              widget.onChange!(i);
            }
          )
        )
      );
      actualItems.add(const SizedBox(width: 10));
    } 
    
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ...actualItems
        ],
      )
    );
  }
}