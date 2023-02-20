import 'package:flutter/material.dart';
import 'package:tandiza/utilities/settings.dart';

class ServicesCard extends StatelessWidget {
  const ServicesCard({ required this.bottomWidth, required this.leftWidth, required this.rightWidth, required this.topWidth,
  required this.icon, this.color, required this.text,
    Key? key,
  }) : super(key: key);

final IconData icon;
final Color ? color;
final String text;
final double  topWidth;
final double bottomWidth;
final double leftWidth;
final double rightWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
     color: color,
     border: Border(top: BorderSide(color: kPrimaryColour, width: topWidth), bottom: BorderSide(color: kPrimaryColour, width: bottomWidth),
     left: BorderSide(color: kPrimaryColour, width: leftWidth), right: BorderSide(color: kPrimaryColour, width: rightWidth)),
    ),
      child: Column(
     mainAxisAlignment: MainAxisAlignment.center,
     children:  [
       Icon(icon,
       size: 40.0,
       color: kPrimaryColour,),
      const SizedBox(height: 5.0,),
         Text(text,
         style: const TextStyle(
           fontSize: 14
         ),
         )
     ],
  ),
);
  }
}