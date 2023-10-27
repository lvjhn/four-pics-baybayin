
import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/state/ui-state.dart'; 

class CostSpecifier extends StatefulWidget 
{
  const CostSpecifier({ 
    super.key,
    required this.cost
  });

  final int cost;

  @override 
  State<CostSpecifier> createState() => CostSpecifierState(); 
}

class CostSpecifierState extends State<CostSpecifier> 
{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container( 
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 48, 44, 44),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(3), 
              bottomLeft: Radius.circular(3), 
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: const Center( 
            child: Text(
              "COST",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white
              )
            )
          )
        ),
        Container(
          width: 75, 
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 248, 246, 246),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(3), 
              bottomRight: Radius.circular(3), 
            )
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Center( 
            child: Row( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.cost.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  )
                ),
                const SizedBox(width: 2.5),
                Image.asset(
                  "assets/icons/icon-coin.png",
                  height: 16
                )
              ]
            )
          )
        )
      ]
    );
  }
}