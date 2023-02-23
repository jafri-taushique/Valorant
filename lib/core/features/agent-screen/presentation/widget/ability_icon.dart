import 'package:flutter/material.dart';

class AbilityIcon extends StatelessWidget {
  const AbilityIcon({Key? key, required this.abilityIconImage}) : super(key: key);
  final String abilityIconImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      // height: 80,
      width: 60,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image(
        image: NetworkImage(abilityIconImage),
        fit: BoxFit.contain,
      ),
    );
  }
}
