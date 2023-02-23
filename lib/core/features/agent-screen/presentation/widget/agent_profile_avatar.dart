import 'package:flutter/material.dart';

class AgentProfileAvatar extends StatelessWidget {
  const AgentProfileAvatar({Key? key, required this.stackImage1, required this.stackImage2,}) : super(key: key);
  final String  stackImage1;
  final String stackImage2;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height*.5,
      width: MediaQuery.of(context).size.width*1,

      // color: Colors.blue,
      child: Stack(
        children: [
          Image(image: NetworkImage(stackImage1),
            color: Colors.red,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height*.5,
            width: MediaQuery.of(context).size.width*1,
          ),
          Image(image: NetworkImage(stackImage2),
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height*.5,
            width: MediaQuery.of(context).size.width*1,
          ),
        ],
      ),
    );
  }
}
