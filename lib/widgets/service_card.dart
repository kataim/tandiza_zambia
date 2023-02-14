import 'package:flutter/material.dart';
import 'package:tandiza/utilities/settings.dart';

class ServicesCard extends StatelessWidget {
  const ServicesCard({ required this.icon, required this.color, required this.text,
    Key? key,
  }) : super(key: key);

final IconData icon;
final Color color;
final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
                                            decoration: BoxDecoration(
     color: color,
     borderRadius: BorderRadius.circular(20)
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